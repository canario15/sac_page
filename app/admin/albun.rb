ActiveAdmin.register Albun do
  actions :index, :show, :edit, :update, :new, :create

  config.batch_actions = false
  config.filters = false
  config.sort_order = 'date_albun_desc'


  menu :label => "Albunes"

  permit_params :name, :code, :date_albun, :front_pic, :category_id, :is_global

  form do |f|
    f.inputs "Albun" do
      f.input :name
      f.input :date_albun
      f.input :category
      f.input :is_global
      f.input :code
      f.input :front_pic
    end
    f.actions
  end

  index :title => "Albunes"  do
    column :name
    column :code
    column :category
    column :is_global
    column :date_albun
    actions
  end

  show :title => :name do |ad|
    attributes_table do
      row :name
      row :code
      row :category
      row :is_global
      row :date_albun
      row :front_pic do
        image_tag(ad.front_pic.url(:medium))
      end
    end
  end

end