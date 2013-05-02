class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, # :recoverable,
  :rememberable, :trackable, :validatable

  # Accessible attributes
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :image
  
  # Validation
	validates_attachment :image, presence: true,
							   content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
							   size: { less_than: 5.megabytes} 

	# Relationships
  has_many :pins, :dependent => :destroy
  has_attached_file :image, styles: {tiny: "25x25>", small: "50x50>"}, :dependent => :destroy
end
