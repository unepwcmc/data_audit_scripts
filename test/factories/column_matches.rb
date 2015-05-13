# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :column_match, class: ColumnMatch do
    model_columns 'MyString'
    access_columns 'MyText'
  end
end