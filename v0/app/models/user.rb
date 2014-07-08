class User < ActiveRecord::Base
  has_many :user_hunts
  has_many :hunts, through: :user_hunts
  has_many :apartments, through: :hunts
  # Include default devise modules. Others available are:
  # :invitable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
end
