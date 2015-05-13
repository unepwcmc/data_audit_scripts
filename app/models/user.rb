class User < ActiveRecord::Base
  has_many :datasets, foreign_key: :metadata_author_id
  has_many :datasets, foreign_key: :contact_id
  belongs_to :programme
end
