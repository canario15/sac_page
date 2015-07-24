class Pilot < ActiveRecord::Base

	has_and_belongs_to_many :categories
  has_many :race_results
  has_many :pilot_races

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/default_profile.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  before_save :set_full_name

  def to_s
  	full_name
  end

  def set_full_name
    self.full_name = first_name + " " + last_name
  end

  def number
   data = PilotRace.where(pilot_id: self.id)
   unless data.blank?
    data.last.number
   else
    "#"
   end
  end

  def age
    begin
      now = Time.now.utc.to_date
      now.year - birth_date.year - (birth_date.to_date.change(:year => now.year) > now ? 1 : 0)
    rescue Exception => e
      "-"
    end
  end

  def self.win_races(championship_id, pilot_id)
    races_win =  RaceResult.where(championship_id: championship_id, score_for_champ: 15, pilot_id: pilot_id ).count
  end



  #HAY QUE HACER ESTO AGREGANDO FILTRO LA CATEGORIA LA PUTA MADREEEEEEEEEEEEEEEEEE

  def count_races
    pilot_races.count
  end

  def all_win_races
    race_results.where(position: 1).count
  end

  def podios
    race_results.where(position: [1,2,3]).count
  end

  def poles
    PilotRace.joins(:pilot_steps).where("pilot_races.pilot_id = #{id} AND pilot_steps.score = 1").count
  end

  def count_champion
    Championship.where(one_id: id).count
  end

  def first_race
    PilotRace.joins(:race).where(pilot_id: id).select("races.*").order("races.date ASC").first
  end



  #campeonato actual
    #posicion
    #puntos
    #asistencias
    #mejor resultado

end
