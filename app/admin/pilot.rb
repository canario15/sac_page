ActiveAdmin.register Pilot do

  menu parent: "Administración"
  menu :label => "Pilotos"

  actions :index, :show, :edit, :update, :new, :create

  config.batch_actions = false

  config.per_page = 15

  filter :categories, collection: proc { Category.all }, as: :select
  filter :last_name

  permit_params :active, :first_name, :last_name, :full_name, :car, :team, :avatar, :car_pic, :complete_pic, :helmet_pic, :city, :birth_date, category_ids: []

  form do |f|
    f.inputs "Piloto" do
      f.input :active
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
    column :active
    actions
  end

  show :title => :full_name do |ad|
    attributes_table do
      row :active
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
        image_tag(ad.complete_pic.url())
      end
    end
  end

end
