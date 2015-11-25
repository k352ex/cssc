class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #:confirmable
  has_many :posts, dependent: :destroy # User객체를 삭제할 때 모든 게시물 삭제
  has_many :board, dependent: :destroy
end
