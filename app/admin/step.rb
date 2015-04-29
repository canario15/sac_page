ActiveAdmin.register Step do

  actions  :index, :edit, :show, :update

  config.batch_actions = false
  config.filters = false

  menu false

  permit_params :number, :name, :observation, pilot_steps_attributes: [:id, :pilot_race_id, :position, :time, :score, :_destroy]

  form do |f|
    f.inputs "Fecha" do
      f.input :race, :input_html => { :disabled => true }
      f.input :number, :input_html => { :disabled => true }
      f.input :name, :input_html => { :disabled => true }
      f.has_many :pilot_steps, allow_destroy: true  do |r|
        r.input :pilot_race, :as => :select, :collection =>  f.object.race.pilot_races
        r.input :time
        r.input :position
        r.input :score
      end
      f.input :observation
    end
    f.actions do
      f.action :submit
      f.action :cancel, :wrapper_html => { :class => 'cancel'}
    end
  end

  show :title => :name do |ad|
    attributes_table do
      row :race
      row :number
      row :name
      row "Resultado" do
        table_for(ad.pilot_steps) do |r|
          r.column "Piloto", :pilot_race
          r.column "Tiempo", :time
          r.column "Posición", :position
          r.column "Puntos", :score
        end
      end
      row :observation
    end
  end

end
