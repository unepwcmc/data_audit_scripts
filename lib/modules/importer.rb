require 'csv'

class Importer
  def initialize filename: filename
    @filename = filename
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
end