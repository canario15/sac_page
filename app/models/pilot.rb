class Pilot < ActiveRecord::Base

	has_and_belongs_to_many :categories

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/default_profile.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  before_save :set_full_name

  def to_s
  	full_name
  end

  def set_full_name
    self.full_name = first_name + " " + last_name
  end

  def number
   data = PilotRace.where(pilot_id: self.id)
   unless data.blank?
    data.last.number
   else
    "#"
   end
  end

end
