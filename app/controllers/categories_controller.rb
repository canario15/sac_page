class CategoriesController < ApplicationController


  def show
    @category = Category.find_by_id(params[:id])
  end

  def show_championships
    @category = Category.find_by_id(params[:id])
  end

  def championship
    @championship = Championship.find_by_id(params[:championship_id])
  end

  def championship_query
    @championship = Championship.find_by_year(params[:year])
    respond_to do |format|
      if request.xhr?
        if params[:type] == "2"
          @races = @championship.races
          format.html { render partial: 'championship_by_race', :layout => false}
        else
          format.html { render partial: 'championship_table', :layout => false}
        end
      else
        format.html
      end
    end
  end

  def championship_by_year
    @championships = Championship.where.not(one_id: nil)
    @actual_championship =  Championship.order(:year).first
    respond_to do |format|
      if request.xhr?
        format.html { render partial: 'champions_year', :layout => false}
      else
        format.html
      end
    end
  end

  def show_gallery
    @category = Category.find_by_id(params[:id])
  end

  def show_pilots
    @category = Category.find_by_id(params[:id])
    @pilots = @category.pilots
  end

  def show_regulation
    @category = Category.find_by_id(params[:id])

  end

  def regulation_turismo_pista_sac
  end

  def regulation_karting_125
  end

  def method_name

  end



end
