require 'csv'

CSV_FILES = [:programme, :dataset_format, :use_level, :license, 
             :source, :importance_level, :audit_status, :datasets]

USERS = [:metadata_author, :contact_point]

class Importer

  def import
    CSV_FILES.each do |file|
      read_csv csv_table: file
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
    csv_file = csv_table.to_s + '.csv'
    csv_data = CSV.read(csv_file, headers: true)
    csv_data.each do |dataset|
      converted_dataset = find_fields csv_values: dataset
      if csv_table == :datasets
        dataset_manipulation converted_dataset: converted_dataset
      elsif csv_table == :programme
        programme_manipulation converted_dataset: converted_dataset
      else
        create_record_with_class csv_table, converted_dataset
      end
    end
  end

  def dataset_manipulation converted_dataset: converted_dataset
    converted_dataset.each do |k,v|
      if USERS.include? k
        user_info v
      elsif k == :network_location
        network_location k,v
      end
    end
  end

  def programme_manipulation converted_dataset: converted_dataset
    converted_dataset[:name] = converted_dataset.delete :programme_legacy_id
    create_record_with_class :programme, converted_dataset
  end

  def user_info v
    User.find_or_create_by(name: v)
  end

  def create_record_with_class (table, options = {})
    cls = Object.const_get(table.to_s.classify, Class.new)
    cls.find_or_create_by(options)
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
