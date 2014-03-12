class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :telephone, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  validates :telephone, format: { with: /(\d|[)(-]|\s|\+){5,15}/, message: "Wrong phone format, only numbers allowed" }
  validates :email, format: { with: /.+@.+\..+/, message: "Wrong email format" }, presence: true

  has_many :venues
end
