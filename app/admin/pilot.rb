ActiveAdmin.register Pilot do
  actions :index, :show, :edit, :update, :new, :create

  config.batch_actions = false
  config.filters = false

  menu :label => "Pilotos"

  permit_params :number, :full_name, :car, :team, :avatar, :city, category_ids: []

  form do |f|
    f.inputs "Piloto" do
      f.input :full_name
      f.input :city
      f.input :car
      f.input :team
      f.input :categories, :as => :check_boxes
      f.input :avatar
    end
    f.actions
  end


  index :title => "Pilotos"  do
    column :full_name
    column :city
    column :car
    column :team
    column "Categoría" do |pilot|
      (pilot.categories.map { |c| c.name }).join(", ")
    end
    actions
  end

  show :title => :full_name do |ad|
    attributes_table do
      row :full_name
      row :city
      row :car
      row :team
      row 'Categorias' do |pilot|
        (pilot.categories.map { |c| c.name }).join(", ")
      end
      row :avatar do
        image_tag(ad.avatar.url(:medium))
      end
    end
  end

end
