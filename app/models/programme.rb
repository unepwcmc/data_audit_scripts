class Programme < ActiveRecord::Base
  has_many :datasets
  has_many :users
end
