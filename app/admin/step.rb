ActiveAdmin.register Step do

  actions  :index, :edit, :show, :update

  config.batch_actions = false
  config.filters = false

  menu false

  permit_params :number, :name, pilot_steps_attributes: [:id, :pilot_id, :position, :time, :score, :_destroy]

  form do |f|
    f.inputs "Fecha" do
      f.input :race, :input_html => { :disabled => true }
      f.input :number, :input_html => { :disabled => true }
      f.input :name, :input_html => { :disabled => true }
      f.has_many :pilot_steps, allow_destroy: true  do |r|
        r.input :pilot
        r.input :time
        r.input :position
        r.input :score
      end
    end
    f.actions
  end

  show :title => :name do |ad|
    attributes_table do
      row :race
      row :number
      row :name
      row "Resultado" do
        table_for(ad.pilot_steps) do |r|
          r.column "Piloto", :pilot
          r.column "Tiempo", :time
          r.column "Posición", :position
          r.column "Puntos", :score
          r.column("Ver") {|pr|  link_to("Ver", admin_pilot_step_path(pr)) }
          r.column("Editar") {|pr|  link_to("Editar", edit_admin_pilot_step_path(pr)) }
        end
      end
    end
  end

end
