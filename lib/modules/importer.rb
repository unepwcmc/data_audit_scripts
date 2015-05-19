require 'csv'

CSV_FILES = [:programmes, :dataset_formats, :use_levels, :licenses, 
             :sources, :importance_levels, :audit_statuses, :datasets]

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
      elsif [:programmes, :audit_statuses].include? csv_table
        duplicated_manipulation converted_dataset: converted_dataset, table: csv_table
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
      elsif k.to_s.end_with? 'legacy_id'
        legacy_ids_manipulation k,v
      end
    end
  end

  def duplicated_manipulation converted_dataset: converted_dataset, table: table
    legacy_id_name = table.to_s + '_legacy_id'
    converted_dataset[:name] = converted_dataset.delete legacy_id_name.to_sym
    create_record_with_class table, converted_dataset
  end

  def user_info v
    User.find_or_create_by(name: v)
  end

  def create_record_with_class (table, options = {})
    cls = extract_class table: table
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

  def legacy_ids_manipulation k,v
    table = k.to_s.split('_legacy_id').first
    cls = extract_class table: table
    cls.where('legacy_id = ?', v)
  end

  def extract_class table: table
    Object.const_get(table.to_s.singularize.classify, Class.new)
  end
end
