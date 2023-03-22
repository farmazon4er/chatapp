class User < ApplicationRecord
  validates_uniqueness_of :username
  scope :all_expect, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }
end
