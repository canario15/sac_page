ActiveAdmin.register Category do

  menu parent: "Administración"
  menu :label => "Categorías"

  config.batch_actions = false
  config.filters = false


  permit_params :name, :description, :logo, :short_name

  form do |f|
    f.inputs "Categoría" do
      f.input :name
      f.input :short_name
      f.input :description
      f.input :logo
    end
    f.actions
  end


  index :title => "Categorías"  do
    column :name
    column :short_name
    column :description do |category|
      truncate(category.description, omision: "...", length: 100)
    end
    actions
  end

  show :title => :name do |ad|
    attributes_table do
      row :name
      row :short_name
      row :description
      row :logo do
        image_tag(ad.logo.url(:medium))
      end
    end
  end

end
