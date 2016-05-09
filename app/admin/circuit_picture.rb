ActiveAdmin.register CircuitPicture do

  menu parent: "Administración"
  menu :label => "Imagenes de Circuitos"

  actions :index, :show, :edit, :update, :new, :create

  config.batch_actions = false
  config.filters = false

  permit_params :name, :picture, :circuit_id

  form do |f|
    f.inputs "imagen para circuito" do
      f.input :name
      f.input :circuit
      f.input :picture
    end
    f.actions
  end

  index :title => "Imagenes de Circuitos"  do
    column :name
    column :circuit
    actions
  end

  show :title => :name do |ad|
    attributes_table do
      row :name
      row :circuit
      row :picture do
        image_tag(ad.picture.url(:medium))
      end
    end
  end

end
