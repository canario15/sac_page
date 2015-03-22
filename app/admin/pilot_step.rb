ActiveAdmin.register PilotStep do

  actions :index, :edit, :show, :update

  config.batch_actions = false
  config.filters = false

  menu false

  permit_params :pilot_id, :position, :time, :score

  form do |f|
    f.inputs "Piloto en la serie" do
      f.input :step, :input_html => { :disabled => true }
      f.input :pilot, :input_html => { :disabled => true }
      f.input :time
      f.input :position
      f.input :score
    end
    f.actions
  end

  show :title => "Piloto en la serie" do |ad|
    attributes_table do
      row :step
      row :pilot
      row :time
      row :position
      row :score
    end
  end


end
