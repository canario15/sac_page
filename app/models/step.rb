class Step < ActiveRecord::Base
  belongs_to :race
  has_many :pilot_steps

  accepts_nested_attributes_for :pilot_steps, :allow_destroy => true

  default_scope order('number ASC')

  after_create :update_race_restult
  after_update :update_race_restult

  def update_race_restult
  	race.pilot_races.each do |pilot_race|
  		result = race.race_results.find_by(pilot_race_id: pilot_race.id)
      unless result.blank?
  		  result.score = race.calculate_total_score_pilot_race(pilot_race.pilot)
  		  result.save
      end
  	end
  	race.update_position
  end

end
