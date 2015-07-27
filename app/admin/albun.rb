ActiveAdmin.register Albun do
  actions :index, :show, :edit, :update, :new, :create

  config.batch_actions = false
  config.filters = false

  menu :label => "Albunes"

  permit_params :name, :code, :date_albun, :front_pic, :category_id

  form do |f|
    f.inputs "Albun" do
      f.input :name
      f.input :date_albun
      f.input :category
      f.input :code
      f.input :front_pic
    end
    f.actions
  end

  index :title => "Albunes"  do
    column :name
    column :code
    column :category
    column :date_albun
    actions
  end

  show :title => :name do |ad|
    attributes_table do
      row :name
      row :code
      row :category
      row :date_albun
      row :front_pic do
        image_tag(ad.front_pic.url(:medium))
      end
    end
  end

end