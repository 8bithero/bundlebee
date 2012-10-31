class SandboxItem < ActiveRecord::Base
  attr_accessible :app_id, :user_id

  belongs_to :app
  belongs_to :user
end
