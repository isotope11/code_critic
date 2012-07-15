class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise  :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:xrono]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me

  has_many :review_requests

  def to_s
    email
  end
end
