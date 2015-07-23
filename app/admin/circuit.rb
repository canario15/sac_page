ActiveAdmin.register Circuit do


  actions :index, :show, :edit, :update, :new, :create

  config.batch_actions = false
  config.filters = false

  menu :label => "Circuitos"

  permit_params :name, :location, :description, :large, :logo, :map_position

  form do |f|
    f.inputs "Circuito" do
      f.input :name
      f.input :location
      f.input :large
      f.input :description
      f.input :map_position
      f.input :logo
    end
    f.actions
  end

  index :title => "Circuitos"  do
    column :name
    column :location
    column :large
    actions
  end

  show :title => :name do |ad|
    attributes_table do
      row :name
      row :location
      row :large
      row :description
      row :logo do
        image_tag(ad.logo.url(:logo))
      end
    end
  end


end

