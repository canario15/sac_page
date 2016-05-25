ActiveAdmin.register RacePrevius do

  config.batch_actions = false
  config.filters = false

  menu :label => "Previa de Carrera"

  permit_params :race_id, :ticket, :picture, :crono

  form do |f|
    f.inputs "Previa de Carrera" do
      f.input :race, :as => :select, :collection => Race.all.collect {|race| [ "#{race.date} - #{race.name} - #{race.championship.category.short_name}" , race.id ] }
      f.input :ticket
      f.input :box_ticket
      f.input :picture
      f.input :crono
    end
    f.actions
  end


  index :title => "Previas de Carrera"  do
    column :race
    actions
  end

  show do |ad|
    attributes_table do
      row :race
      row :ticket
      row :box_ticket
      row :picture do
        image_tag(ad.picture.url(:medium))
      end
      row :crono
    end
  end


end
