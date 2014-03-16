class User < ActiveRecord::Base

  FAKE_EMAIL = 'change_me.email'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, 
         :authentication_keys => [:email], :omniauth_providers => [:facebook,:vkontakte,:google_oauth2,:twitter,:yandex,:github]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :telephone, :password_confirmation, :remember_me, :fullname, :provider, :uid
  # attr_accessible :title, :body
  #validates :telephone, format: { with: /(\d|[)(-]|\s|\+){5,15}/, message: "Wrong phone format, only numbers allowed" }
  validates :email, format: { with: /.+@.+\..+/, message: "Wrong email format" }, presence: true

  has_many :venues
  has_many :entry_photos

  def self.find_for_common_oauth(auth, signed_in_resource=nil)
    email = auth.info.email || "#{auth.provider}_#{Devise.friendly_token[0,10]}@#{FAKE_EMAIL}"
    user_data ={ fullname: auth.info.name, 
                     provider: auth.provider,
                     uid: auth.uid,
                     email: email,
                     password: Devise.friendly_token[0,20] }
    return self.get_oauth_user(user_data)
  end

  def self.get_oauth_user user_data 
    user = User.where(:provider => user_data[:provider], :uid => user_data[:uid]).first
    unless user
      user = User.new(user_data)
      user.save!(validate: false)
    end
    user
  end

  def invalid_contacts?
    email.include?(FAKE_EMAIL) && telephone.blank?
  end
end
