ActiveAdmin.register Notice do

  config.batch_actions = false
  config.filters = false

  menu :label => "Noticias"

  permit_params :title, :context, :photo

  form do |f|
    f.inputs "Noticia" do
      f.input :title
      f.input :context
      f.input :photo
    end
    f.actions
  end


  index :title => "Noticias"  do
    column :id
    column :title
    column :created_at
    column :context do |notice|
        truncate(notice.context, omision: "...", length: 100)
    end
    actions
  end

  show :title => :title do |ad|
    attributes_table do
      row :id
      row :title
      row :created_at
      row :context
      row :photo do
          image_tag(ad.photo.url(:medium))
        end
    end
  end




end
