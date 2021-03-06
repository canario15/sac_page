class Notice < ActiveRecord::Base

	self.per_page = 4

	has_attached_file :photo, :styles => { :medium => "200x200>", :thumb => "100x100>", :carr => "1170x400" }, :default_url => "/assets/logo.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  default_scope { order(created_at: :desc) }

end
