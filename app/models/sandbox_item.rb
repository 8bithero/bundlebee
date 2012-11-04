class SandboxItem < ActiveRecord::Base
  
  # ACCESSIBLE ATTRIBUTES
  #---------------------------------------------------------------
  attr_accessible :app_id#, :user_id

  # ASSOCIATIONS
  #---------------------------------------------------------------
  belongs_to :app
  belongs_to :user

  # VALIDATIONS
  #---------------------------------------------------------------
  validates :user_id, presence: true
  validates :app_id,  presence: true
end
