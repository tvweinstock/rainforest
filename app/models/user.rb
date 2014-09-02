class User < ActiveRecord::Base
  has_secure_password
  #attr_accessor :password, :password confirmation

  has_many :reviews
  has_many :products, through: :reviews

  validates :name, presence: true

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    
  end
end
