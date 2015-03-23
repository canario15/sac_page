ActiveAdmin.register Race do

  actions :index, :edit, :show, :update

  config.batch_actions = false
  config.filters = false

  menu false

  permit_params :city, :date, :name, :observation, steps_attributes: [:id, :number, :name, :_destroy], pilot_races_attributes: [:id, :number, :pilot_id, :race_id]

  form do |f|
    f.inputs "Fecha" do
      f.input :championship, :input_html => { :disabled => true }
      f.input :date, :input_html => { :disabled => true }
      f.input :city, :input_html => { :disabled => true }
      f.input :name, :input_html => { :disabled => true }
      f.has_many :steps, allow_destroy: true  do |r|
        r.input :number
        r.input :name
      end
      f.has_many :pilot_races, allow_destroy: true  do |r|
        r.input :pilot
        r.input :number
      end
      f.input :observation
    end
    f.actions
  end

  index :title => "Fechas"  do
    column :championship
    column :date
    column :city
    column :name
    actions
  end

  show :title => :date do |ad|
    attributes_table do
      row :championship
      row :date
      row :city
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
      row :observation
    end
  end


end
