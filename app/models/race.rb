class Race < ActiveRecord::Base

  belongs_to :championship
  has_many :pilot_races
  has_many :steps
  has_many :race_results

  accepts_nested_attributes_for :steps, :allow_destroy => true
  accepts_nested_attributes_for :pilot_races, :allow_destroy => true

  default_scope order('date ASC')

  after_create :create_or_update_race_restult
  after_update :create_or_update_race_restult

  def order_steps
  	steps.order('number ASC')
  end

  def order_pilot_races
  	pilot_races.order('number ASC')
  end

  def calculate_total_score_pilot_race ( pilot )
    score = 0
    steps.each do |step|
      step.pilot_steps.each do |pilot_step|
        if pilot_step.pilot_race.pilot_id == pilot.id
          score = score + pilot_step.score
        end
      end
    end
    score
  end

  def create_or_update_race_restult
    pilot_races.each do |pilot_race|
      if RaceResult.where(pilot_race_id: pilot_race.id, race_id: id).blank?
        RaceResult.create( pilot_race_id: pilot_race.id, race_id: id, score: 0)
      end
    end
  end

  def update_position
    race_results.each_with_index do |race_result, i|
      race_result.position = i + 1
      race_result.save
    end
  end

end
