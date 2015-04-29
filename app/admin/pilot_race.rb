ActiveAdmin.register PilotRace do

  actions :index, :edit, :show, :update

  config.batch_actions = false
  config.filters = false

  menu false

  permit_params :pilot_id, :number

  form do |f|
    f.inputs "Pilotos de la fecha" do
      f.input :race, :input_html => { :disabled => true }
      f.input :pilot
      f.input :number
    end
    f.actions do
      f.action :submit
      f.action :cancel, :wrapper_html => { :class => 'cancel'}
    end
  end

  show :title => "Pilotos de la fecha" do |ad|
    attributes_table do
      row :race
      row :pilot
      row :number
    end
  end


end
