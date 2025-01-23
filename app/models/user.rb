class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :boards, dependent: :destroy
  has_one :profile, dependent: :destroy


  def prepare_profile
    profile || build_profile
  end

  def has_written?(board)
    boards.exists?(id: board.id)
  end

  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'User.png'
    end
  end

end
