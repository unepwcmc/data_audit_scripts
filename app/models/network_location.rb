class NetworkLocation < ActiveRecord::Base
  has_many :datasets
  belongs_to :drive
end
