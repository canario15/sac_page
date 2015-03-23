class Pilot < ActiveRecord::Base

	has_and_belongs_to_many :categories

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/default_profile.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def to_s
  	full_name
  end
end
