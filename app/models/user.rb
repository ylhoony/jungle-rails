class User < ActiveRecord::Base

  has_secure_password
  validates :password, :length => { :minimum => 5 }
  validates_confirmation_of :password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

# in your SessionsController

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
    else
      # failure, render login form
    end
  end


end
