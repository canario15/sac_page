class CategoriesController < ApplicationController

  before_filter :set_hover

  def show
    @category = Category.find_by_id(params[:id])
  end

  def show_championships
    @category = Category.find_by_id(params[:id])
    @championship = @category.last_championship
  end

  def championship_query
    @championship = Championship.where(year: params[:year], category_id: params[:category_id]).first
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
    @championships = Championship.where(category_id: params[:category_id]).where.not(one_id: nil)
    @actual_championship =  Championship.actual_championship(params[:category_id])
    respond_to do |format|
      if request.xhr?
        format.html { render partial: 'champions_year', :layout => false}
      else
        format.html
      end
    end
  end

  def show_gallery
    @category = Category.find_by_id(params[:category_id])
  end

  def show_albun
    @albun = Albun.find(params[:id])
    @category = @albun.category
  end

  def show_pilots
    @category = Category.find_by_id(params[:category_id])
    @pilots = @category.pilots
  end

  def pilot
    @category = Category.find_by_id(params[:category_id])
    @actual_championship = Championship.actual_championship(params[:category_id])
    @pilot = @category.pilots.find(params[:id])
  end

  def show_regulation
    @category = Category.find_by_id(params[:id])
  end

  def show_calendar
    @category = Category.find_by_id(params[:category_id])
    @actual_championship = Championship.actual_championship(@category.id)
    @races = @actual_championship.races
  end

  def race
    @category = Category.find_by_id(params[:category_id])
    @actual_championship = Championship.actual_championship(@category.id)
    @race = Race.find(params[:id])
  end

  def set_hover
    @hover_menu = CONSTANT_MENU_CATEGORIY_ID
  end


end
