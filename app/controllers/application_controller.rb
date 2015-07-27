class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :actual_championship

  def close_race
    race = Race.find(params[:race_id])
    race.done = true
    respond_to do |format|
      if race.save
        format.json { render json: { :status =>  'OK', :message =>  'Fecha cerrada con éxito.' } }
      else
        format.json { render json: { :status => 'ERROR', :errors => 'No se pudo cerrar la fecha.' } }
      end
    end
  end


  def actual_championship
    @actual_championship = Championship.actual_championship(1)
  end

end
