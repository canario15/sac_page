class Race < ActiveRecord::Base

  belongs_to :championship
  has_many :pilot_races
  has_many :steps

  accepts_nested_attributes_for :steps, :allow_destroy => true
  accepts_nested_attributes_for :pilot_races, :allow_destroy => true

  default_scope order('date ASC')

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

end
