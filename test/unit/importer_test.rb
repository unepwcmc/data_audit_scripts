require 'test_helper'
require 'csv'

class TestImporter < ActiveSupport::TestCase

  def setup
    @filename = 'long_tables.csv'
  end

  test '.find_fields creates a hash with columns of model and values' do

    FactoryGirl.create(:column_match, model_columns: 'pa_name_mett', access_columns: 'name in file')
    FactoryGirl.create(:column_match, model_columns: 'research', access_columns: 'Research')

    csv_values = { 'name in file' => 'wolf', 'Research' => 4 }

    result = { pa_name_mett:  'wolf', research: 4 }

    importer = Importer.new(filename: @filename)

    assert_equal result, importer.find_fields(csv_values: csv_values)
  end

  test '.find_fields ignores columns not matching' do

    FactoryGirl.create(:column_match, model_columns: 'pa_name_mett', access_columns: 'name in file')
    FactoryGirl.create(:column_match, model_columns: 'research', access_columns: 'Research')

    csv_values = { 'name in file' => 'wolf', 'name we dont want' => 'human', 'Research' => 4 }

    result = { pa_name_mett:  'wolf', research: 4 }

    importer = Importer.new(filename: @filename)

    assert_equal result, importer.find_fields(csv_values: csv_values)
  end

  test 'import imports data from csv file' do
     FactoryGirl.create(:column_match, model_columns: 'programme', access_columns: 'Programme')
     FactoryGirl.create(:column_match, model_columns: 'license', access_columns: 'License')
     FactoryGirl.create(:column_match, model_columns: 'metadata_author', access_columns: 'Form fill-in by')
     FactoryGirl.create(:column_match, model_columns: 'contact_point', access_columns: 'WCMC Point of contact')

     parsed_csv = [ { 'Programme' => 'Informatics', 'License' => 'To Kill', 'WCMC Point of contact' => 'Jackson Martinez',
                       'Form fill-in by' => 'Ricardo Quaresma'} ]

     CSV.stubs(:read).with('long_tables.csv', {:headers => true}).returns(parsed_csv)

     License.expects(:find_or_create_by).with(name: 'To Kill')
     Programme.expects(:find_or_create_by).with(name: 'Informatics')
     User.expects(:find_or_create_by).with(name: 'Ricardo Quaresma')
     User.expects(:find_or_create_by).with(name: 'Jackson Martinez')

     importer = Importer.new(filename: @filename)
     importer.import
  end

end