ActiveAdmin.register Pilot do
  actions :index, :show, :edit, :update, :new, :create

  config.batch_actions = false
  config.filters = false

  menu :label => "Pilotos"

  permit_params :number, :first_name, :last_name, :full_name, :car, :team, :avatar, :city, :birth_date, category_ids: []

  form do |f|
    f.inputs "Piloto" do
      f.input :first_name
      f.input :last_name
      f.input :birth_date,  :as => :datepicker
      f.input :city
      f.input :car
      f.input :team
      f.input :categories, :as => :check_boxes
      f.input :avatar
      f.input :car_pic
      f.input :helmet_pic
      f.input :complete_pic
    end
    f.actions
  end

  index :title => "Pilotos"  do
    column :full_name
    column :city
    column :car
    column :team
    column "Categoría/s" do |pilot|
      (pilot.categories.map { |c| c.name }).join(", ")
    end
    actions
  end

  show :title => :full_name do |ad|
    attributes_table do
      row :full_name
      row :birth_date
      row :city
      row :car
      row :team
      row 'Categoria/s' do |pilot|
        (pilot.categories.map { |c| c.name }).join(", ")
      end
      row :avatar do
        image_tag(ad.avatar.url(:medium))
      end
      row :car_pic do
        image_tag(ad.car_pic.url(:thumb))
      end
      row :helmet_pic do
        image_tag(ad.helmet_pic.url())
      end
      row :complete_pic do
        image_tag(ad.complete_pic.url(:thumb))
      end
    end
  end

end
