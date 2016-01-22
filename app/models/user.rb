class User < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/images/:style/default.png" 
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
