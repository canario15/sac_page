class Category < ActiveRecord::Base

	has_and_belongs_to_many :pilots
	has_many :championships
  has_many :circuits

	has_attached_file :logo, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/assets/logo.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  def last_championship
    self.championships.first
  end

end
