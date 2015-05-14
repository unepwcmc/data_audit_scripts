require 'csv'

CSV_FILES = [:programme, :dataset_format, :use_level,
             :license, :source, :importance_level, :datasets]

USERS = [:metadata_author, :contact_point]

class Importer

  def import
    CSV_FILES.each do |file|
      complete_filename = file.to_s + '.csv'
      read_csv csv_table: complete_filename
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

  def read_csv csv_table: csv_table
    csv_table = CSV.read(csv_table, headers: true)
    csv_table.each do |dataset|
      converted_dataset = find_fields csv_values: dataset
      dataset_manipulation converted_dataset: converted_dataset
    end
  end

  def dataset_manipulation converted_dataset: converted_dataset
    converted_dataset.each do |k,v|
      if k == :dataset_scope
        direct_tables k,v
      elsif USERS.include? k
        user_info v
      elsif k == :network_location
        network_location k,v
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

  def network_location k,v
    path_splitted = v.split('\\')
    drive_name = path_splitted[0]
    path = path_splitted[1..-1].join("\\")
    Drive.find_or_create_by(name: drive_name)
    drive_id = Drive.where('name = ?', drive_name).first[:id]
    NetworkLocation.find_or_create_by(drive_id: drive_id, path: path)
  end

end