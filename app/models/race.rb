class Race < ActiveRecord::Base

  belongs_to :championship
  has_many :steps

  accepts_nested_attributes_for :steps, :allow_destroy => true

end
