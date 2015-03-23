class Step < ActiveRecord::Base
  belongs_to :race
  has_many :pilot_steps

  accepts_nested_attributes_for :pilot_steps, :allow_destroy => true

  default_scope order('number ASC')
end
