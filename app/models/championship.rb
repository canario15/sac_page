class Championship < ActiveRecord::Base

	belongs_to :category

	has_many :races

	belongs_to :one,   :class_name => "Pilot"
	belongs_to :two, 	 :class_name => "Pilot"
	belongs_to :three, :class_name => "Pilot"

	accepts_nested_attributes_for :races, :allow_destroy => true
 
  default_scope { order(year: :desc) }

  def self.championship_data(championship_id)
    Championship.find_by_sql("select rr.pilot_id, p.first_name, p.last_name, p.city, p.team,  p.car, SUM (rr.score_for_champ) as score
            from race_results rr, races r, pilots p, pilot_races pr
           where r.championship_id = #{championship_id}
             and rr.race_id = r.id
             and p.id = rr.pilot_id
             and pr.id = rr.pilot_race_id
             and rr.score_for_champ is not null
        group by rr.pilot_id, p.first_name, p.last_name, p.team, p.city, p.car
        order by SUM (rr.score_for_champ) DESC")
  end

  def race_done
    RaceResult.unscoped.where(championship_id: self.id).select(:race_id).distinct.count
  end

  def self.actual_championship(category_id)
    Championship.where(category_id: category_id).order(:year).first
  end


  def self.data_of_pilot_in_championship(pilot_id, category_id)
    data = { score: "0", pos: "0", best_place: "0", assists: "0" }
    ch = RaceResult.joins(:championship).where("race_results.pilot_id = #{pilot_id} and championships.year = #{Time.now.year} and championships.category_id = #{category_id}").first
    unless ch.blank?
      self.championship_data(ch.championship_id).each_with_index do |result, i|
        if result.pilot_id == pilot_id
          data[:score] = result.score
          data[:pos]   = i + 1
        end
      end
    end
    data[:assists] = Race.joins(:pilot_races).joins(:championship).where("championships.year = #{Time.now.year} and championships.category_id = #{category_id} and pilot_races.pilot_id = #{pilot_id}").count
    best_result = RaceResult.find_by_sql("SELECT race_results.position
                                            FROM race_results
                                           INNER JOIN races ON races.id = race_results.race_id
                                           INNER JOIN championships ON championships.id = races.championship_id
                                           WHERE race_results.category_id = #{category_id}
                                             AND race_results.pilot_id = #{pilot_id}
                                             AND championships.year = #{Time.now.year}
                                           ORDER BY race_results.position ASC").first
    data[:best_place] = !best_result.nil? ? best_result.position : "0"
    return data
  end

  def next_race
    races.where(done: nil).order(:date).first
  end

end

