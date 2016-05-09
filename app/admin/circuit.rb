ActiveAdmin.register Circuit do

  menu parent: "Administración"
  menu :label => "Circuitos"

  actions :index, :show, :edit, :update, :new, :create

  config.batch_actions = false
  config.filters = false

  permit_params :name, :location, :description, :large, :logo, :map_position, :video_url, :category_id, :truck

  form do |f|
    f.inputs "Circuito" do
      f.input :name
      f.input :location
      f.input :large
      f.input :description
      f.input :category
      f.input :map_position
      f.input :video_url
      f.input :logo
      f.input :truck
    end
    f.actions
  end

  index :title => "Circuitos"  do
    column :name
    column :location
    column :large
    column :category
    actions
  end

  show :title => :name do |ad|
    attributes_table do
      row :name
      row :location
      row :large
      row :description
      row :category
      row :logo do
        image_tag(ad.logo.url(:medium))
      end
      row :truck do
        image_tag(ad.truck.url(:medium))
      end
    end
  end


end

