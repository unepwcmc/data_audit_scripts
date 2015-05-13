class License < ActiveRecord::Base
  has_many :datasets
end
