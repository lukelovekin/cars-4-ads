class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :age, numericality: { only_integer: true }, :on => :update
  validates :username, length: { maximum: 15 }
  validates :phone_number, length: { maximum: 10 }
  validates :first_name, :username, :suburb, :state, presence: true, :on => :update
  
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end
end
 