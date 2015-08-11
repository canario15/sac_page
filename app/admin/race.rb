ActiveAdmin.register Race do

  actions :index, :edit, :show, :update

  config.batch_actions = false
  config.filters = false

  menu false

  permit_params :city, :date, :name, :observation, :circuit_id, steps_attributes: [:id, :number, :name, :_destroy], pilot_races_attributes: [:id, :number, :pilot_id, :race_id]

  action_item only: :show do
    link_to 'Cerrar Fecha', "#", class: "close_race"
  end


  form do |f|
    f.inputs "Fecha" do
      f.input :championship, :input_html => { :disabled => true }
      f.input :date
      f.input :city
      f.input :circuit
      f.input :name
      f.has_many :steps, allow_destroy: true  do |r|
        r.input :number
        r.input :name
      end
      f.has_many :pilot_races, allow_destroy: true  do |r|
        r.input :pilot, :as => :select, :collection => (resource.championship.category ? resource.championship.category.pilots.collect {|pilot| [pilot.full_name, pilot.id]} : [])
        r.input :number
      end
      f.input :observation
    end
    f.actions do
      f.action :submit
      f.action :cancel, :wrapper_html => { :class => 'cancel'}
    end
  end

  index :title => "Fechas"  do
    column :championship
    column :date
    column :city
    column :name
    column :circuit
    actions
  end

  show :title => :date do |ad|
    attributes_table do
      row :id
      row :championship
      row :date
      row :city
      row :circuit
      row :name
      row "Series" do
        table_for(ad.order_steps) do |r|
          r.column "Numero", :number
          r.column "Nombre", :name
          r.column("Ver") {|pr|  link_to("Ver", admin_step_path(pr)) }
          r.column("Editar") {|pr|  link_to("Editar", edit_admin_step_path(pr)) }
        end
      end
      row "Pilotos Inscriptos" do
        table_for(ad.order_pilot_races) do |r|
          r.column "Numero", :number
          r.column "Piloto", :pilot
          r.column("Ver") {|pr|  link_to("Ver", admin_pilot_race_path(pr)) }
          r.column("Editar") {|pr|  link_to("Editar", edit_admin_pilot_race_path(pr)) }
        end
      end
      row "Resultado" do
        table_for(ad.race_results) do |re|
          re.column "Posición", :position
          re.column("Numero")  {|pr| pr.pilot_race.number }
          re.column("Piloto")  {|pr| pr.pilot_race.pilot  }
          re.column "Puntaje Fecha", :score
          re.column "Puntaje Campeonato", :score_for_champ
          re.column("") {|pr|  link_to("setear", edit_admin_race_result_path(pr)) }
        end
      end
      row :done
      row :observation
    end

  end


end
