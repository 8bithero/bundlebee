class App < ActiveRecord::Base
  attr_accessible :bundle_id, :developer_id, :name

  validates :name,        presence: true
  validates :bundle_id,   presence: true, uniqueness: true

  has_many :apps_users
  has_many :users, through: :apps_users
end
