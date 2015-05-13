class Dataset < ActiveRecord::Base
  belongs_to :network_location
  belongs_to :dataset_format
  belongs_to :dataset_scope
  belongs_to :importance_level
  belongs_to :license
  belongs_to :programme
  belongs_to :source
  belongs_to :use_level
  belongs_to :user, foreign_key: :metadata_author_id
  belongs_to :user, foreign_key: :contact_id
end
