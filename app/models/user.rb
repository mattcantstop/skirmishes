class User < ActiveRecord::Base
  include Tokenable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

end
