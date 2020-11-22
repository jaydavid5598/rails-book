class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :books

  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable,
      :omniauthable, omniauth_providers: %i[facebook google_oauth2] 

  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true
  validates_format_of :email, with: Devise::email_regexp

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name  
      user.image = auth.info.image
    end
  end

end
