class RacePrevius < ActiveRecord::Base
  belongs_to :race

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/logo.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
