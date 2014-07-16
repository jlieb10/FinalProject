class User < ActiveRecord::Base
  has_many :user_hunts
  has_many :hunts, through: :user_hunts
  has_many :apartments, through: :hunts
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email

  def latest_hunt
    self.hunts.last
  end
end
