class User < ActiveRecord::Base
  has_many :user_hunts
  has_many :hunts, through: :user_hunts
  has_many :apartments, through: :hunts
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  mount_uploader :profpic, ProfpicUploader

  def latest_hunt
    self.hunts.last
  end

  def add_hunt
    inviter = User.find(self.invited_by_id)
    UserHunt.create(:user_id => self.id, :hunt_id => inviter.latest_hunt.id)
  end
end