class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, as: :patternable
  has_many :comments

  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :admin, default: false

  scope :created_today, -> {where('created_at >= ?', Time.zone.now.beginning_of_day)}
end