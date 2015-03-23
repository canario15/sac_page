class Championship < ActiveRecord::Base

	belongs_to :category

	has_many :races

	belongs_to :one,   :class_name => "Pilot"
	belongs_to :two, 	 :class_name => "Pilot"
	belongs_to :three, :class_name => "Pilot"

	accepts_nested_attributes_for :races, :allow_destroy => true

	default_scope order('year DESC')

end
