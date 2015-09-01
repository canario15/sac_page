class Albun < ActiveRecord::Base

  belongs_to :category

  has_attached_file :front_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/default_profile.png"
  validates_attachment_content_type :front_pic, :content_type => /\Aimage\/.*\Z/

  default_scope order("date_albun desc")

end
