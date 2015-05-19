require 'test_helper'
require 'csv'

class TestImporter < ActiveSupport::TestCase

  test '.find_fields creates a hash with columns of model and values' do

    FactoryGirl.create(:column_match, model_columns: 'pa_name_mett', access_columns: 'name in file')
    FactoryGirl.create(:column_match, model_columns: 'research', access_columns: 'Research')

    csv_values = { 'name in file' => 'wolf', 'Research' => 4 }

    result = { pa_name_mett:  'wolf', research: 4 }

    importer = Importer.new

    assert_equal result, importer.find_fields(csv_values: csv_values)
  end

  test '.find_fields ignores columns not matching' do

    FactoryGirl.create(:column_match, model_columns: 'pa_name_mett', access_columns: 'name in file')
    FactoryGirl.create(:column_match, model_columns: 'research', access_columns: 'Research')

    csv_values = { 'name in file' => 'wolf', 'name we dont want' => 'human', 'Research' => 4 }

    result = { pa_name_mett:  'wolf', research: 4 }

    importer = Importer.new

    assert_equal result, importer.find_fields(csv_values: csv_values)
  end

  test 'import imports data from csv file' do
    FactoryGirl.create(:column_match, model_columns: 'metadata_author', access_columns: 'Form fill-in by')
    FactoryGirl.create(:column_match, model_columns: 'contact_point', access_columns: 'WCMC Point of contact')
    FactoryGirl.create(:column_match, model_columns: 'network_location', access_columns: 'NetworkLocation')
    FactoryGirl.create(:column_match, model_columns: 'programme_legacy_id', access_columns: 'Programme')
    FactoryGirl.create(:column_match, model_columns: 'code', access_columns: 'Suffix')
    FactoryGirl.create(:column_match, model_columns: 'legacy_id', access_columns: 'ID')
    FactoryGirl.create(:column_match, model_columns: 'legacy_id', access_columns: 'CODE')
    FactoryGirl.create(:column_match, model_columns: 'name', access_columns: 'NAME')
    FactoryGirl.create(:column_match, model_columns: 'legacy_id', access_columns: 'Use level ID')
    FactoryGirl.create(:column_match, model_columns: 'legacy_id', access_columns: 'Importance ID')
    FactoryGirl.create(:column_match, model_columns: 'name', access_columns: 'Use level rate')
    FactoryGirl.create(:column_match, model_columns: 'name', access_columns: 'LICENSE')
    FactoryGirl.create(:column_match, model_columns: 'name', access_columns: 'BODY')
    FactoryGirl.create(:column_match, model_columns: 'name', access_columns: 'Importance rate')
    FactoryGirl.create(:column_match, model_columns: 'state', access_columns: 'Audit Status')
    FactoryGirl.create(:column_match, model_columns: 'detail', access_columns: 'Detail')

    dataset_csv = [ { 'WCMC Point of contact' => 'Jackson Martinez','Form fill-in by' => 'Ricardo Quaresma',
                       'NetworkLocation' => 'C:\MIGUEL TORRES\FILES', 'Programme' => 11} ]
    programme_csv = [ { 'Suffix' => 'D5', 'ID' => 11, 'Programme' => 'informatics'} ]
    dataset_format_csv = [ { 'CODE' => 22, 'NAME' => 'vector' } ]
    use_level_csv = [ { "Use level ID" => 33,"Use level rate" => 'Sometimes' } ]
    license_csv = [ { "CODE" => 44,"LICENSE" => 'To Kill'} ]
    source_csv = [ { "ID" => 55,"BODY" => 'UNEP'} ]
    importance_level_csv = [ { "Importance ID" => 66, "Importance rate" => 'High' } ]
    audit_status_csv = [{"ID" => 77, "Audit Status" => "OK", "Detail" => "Detailed"}]

    CSV.stubs(:read).with('programme.csv', {:headers => true}).returns(programme_csv)
    CSV.stubs(:read).with('dataset_format.csv', {:headers => true}).returns(dataset_format_csv)
    CSV.stubs(:read).with('use_level.csv', {:headers => true}).returns(use_level_csv)
    CSV.stubs(:read).with('license.csv', {:headers => true}).returns(license_csv)
    CSV.stubs(:read).with('source.csv', {:headers => true}).returns(source_csv)
    CSV.stubs(:read).with('importance_level.csv', {:headers => true}).returns(importance_level_csv)
    CSV.stubs(:read).with('datasets.csv', {:headers => true}).returns(dataset_csv)
    CSV.stubs(:read).with('audit_status.csv', {:headers => true}).returns(audit_status_csv)

    User.expects(:find_or_create_by).with(name: 'Ricardo Quaresma')
    User.expects(:find_or_create_by).with(name: 'Jackson Martinez')
    Drive.expects(:find_or_create_by).with(name: "C:")
    drive_mock = mock
    drive_mock.expects(:first).returns(id: 999).once
    Drive.expects(:where).with('name = ?',  "C:").returns(drive_mock).once
    NetworkLocation.expects(:find_or_create_by).with(path: 'MIGUEL TORRES\FILES', drive_id: 999)

    Programme.expects(:find_or_create_by).with(name: 'informatics', code: 'D5', legacy_id: 11)
    DatasetFormat.expects(:find_or_create_by).with(legacy_id: 22, name: 'vector')
    UseLevel.expects(:find_or_create_by).with(legacy_id: 33, name: 'Sometimes')
    License.expects(:find_or_create_by).with(legacy_id: 44, name: 'To Kill')
    Source.expects(:find_or_create_by).with(legacy_id: 55, name: 'UNEP')
    ImportanceLevel.expects(:find_or_create_by).with(legacy_id: 66, name: 'High')
    AuditStatus.expects(:find_or_create_by).with(legacy_id: 77, state: 'OK', detail: 'Detailed')

    importer = Importer.new
    importer.import
  end
end
