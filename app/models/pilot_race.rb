class PilotRace < ActiveRecord::Base
  belongs_to :pilot
  belongs_to :race
  has_many :pilot_steps

  default_scope order('number ASC')

  def to_s
  	"#{number} #{pilot.full_name}"
  end

end
