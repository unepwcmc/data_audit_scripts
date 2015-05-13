require 'csv'

DIRECT_TABLES = [:programme, :scope, :license, :importance_level,
                 :use_level, :source]

USERS = [:metadata_author, :contact_point]

class Importer
  def initialize filename: filename
    @filename = filename
  end

  def import
    csv_table = CSV.read(@filename, headers: true)
    csv_table.each do |dataset|
      converted_dataset = find_fields csv_values: dataset
      dataset_manipulation converted_dataset: converted_dataset
    end
  end

  def find_fields csv_values: csv_values
    csv_data = {}
    csv_values.each do |column, value|
      model_column = ColumnMatch.select(:model_columns).where(access_columns: column)
      unless model_column == []
        csv_data.merge!(model_column.first['model_columns'].to_sym => value)
      end
    end
    csv_data
  end

  private

  def dataset_manipulation converted_dataset: converted_dataset
    converted_dataset.each do |k,v|
      if DIRECT_TABLES.include? k
        direct_tables k,v
      elsif USERS.include? k
        user_info v
      end
    end
  end

  def direct_tables k,v
    cls = Object.const_get(k.to_s.classify, Class.new)
    cls.find_or_create_by(name: v)
  end

  def user_info v
    User.find_or_create_by(name: v)
  end
end