class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  #has_and_belongs_to_many :news_posts
  #has_many :created_solutions, :class_name => 'Solution', :foreign_key => :creator_id
  has_many :problem_entries, :foreign_key => :creator_id
end
