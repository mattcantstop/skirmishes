class User < ActiveRecord::Base
  include Tokenable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wars

end
