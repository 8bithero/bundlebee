class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  before_save :ensure_authentication_token

  has_many :sandboxes
  has_many :apps, through: :sandboxes

  def has_app?(the_app)
    sandboxes.find_by_app_id(the_app.id)
  end

  def add_app!(the_app)
    sandboxes.create!(app_id: the_app.id)
  end

  def remove_app!(the_app)
    sandboxes.find_by_app_id(the_app.id).destroy
  end
end
