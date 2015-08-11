ActiveAdmin.register Championship do

  actions :index, :show, :edit, :update, :new, :create

  config.batch_actions = false
  filter :category, collection: proc { Category.all }, as: :select

  menu :label => "Campeonatos"

  config.sort_order = 'year_desc'

  permit_params :name, :category_id, :circuit_id, :year, :one_id, :two_id, :three_id, races_attributes: [:id, :city, :date, :name, :circuit_id, :_destroy]

  form do |f|
    f.inputs "Campeonato" do
      f.input :name
      f.input :category, :as => :select, :collection => Category.all.collect {|cat| [cat.name, cat.id] }
      f.input :year
      f.input :one
      f.input :two
      f.input :three
      f.has_many :races, allow_destroy: true  do |r|
        r.input :city
        r.input :date, as: :datepicker
        r.input :name
        r.input :circuit
      end
    end
    f.actions
  end

  index :title => "Campeonatos"  do
    column :name
    column :category
    column :year
    column :one
    column :two
    column :three
    actions
  end

  show :title => :name do |ad|
    attributes_table do
      row :name
      row :category
      row :year
      row :one
      row :two
      row :three
      row "Fechas" do
        table_for(ad.races) do |r|
          r.column "Fecha", :date
          r.column "Ciudad", :city
          r.column "Nombre", :name
          r.column "Circuito", :circuit
          r.column "Cerrada", :done
          r.column("Ver") {|pr|  link_to("Ver", admin_race_path(pr)) }
          r.column("Editar") {|pr|  link_to("Editar", edit_admin_race_path(pr)) }
        end
      end
    end
  end

end
