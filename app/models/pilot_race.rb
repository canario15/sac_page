class PilotRace < ActiveRecord::Base
  belongs_to :pilot
  belongs_to :race
  has_many :pilot_steps

  default_scope order('number ASC')

  #before_save :set_category

  def set_category
    self.category_id = self.race.championship.category_id
  end

  def to_s
  	"#{number} #{pilot.full_name}"
  end

end
