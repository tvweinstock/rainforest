class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  has_many :products, through: :reviews

  validates :name, presence: true

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
    
  end
end
