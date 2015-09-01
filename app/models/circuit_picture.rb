class CircuitPicture < ActiveRecord::Base
  belongs_to :circuit

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/default-circuit.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
