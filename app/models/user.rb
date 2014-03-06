class User < ActiveRecord::Base
  include Tokenable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token

  validates :username, :uniqueness => { :case_sensitive => false }

  attr_accessor :login

  has_many :wars

  ###
  # Class Methods
  ###

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  ###
  # Instance Methods
  ###

  def login
    @login || self.username || self.email
  end

  private

  def ensure_authentication_token
    @token = generate_token
    self.authentication_token = @token
  end

end
