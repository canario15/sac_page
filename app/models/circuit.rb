class Circuit < ActiveRecord::Base

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/default-circuit.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

end

# MAPAS CIRCUITOS

#RIVERA
#"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d4392.548657309552!2d-55.60563204263922!3d-30.86287099474306!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1ses!2suy!4v1437689408363"

#SALTO
#"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d2183.515155187242!2d-57.958756450091066!3d-31.41540495028035!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1ses!2suy!4v1437689640178"

#PAYSANDU
#"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d2162.6637713669397!2d-58.03990137599126!3d-32.30008124139191!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1ses!2suy!4v1437689723308"

#TACUAREMBO
#"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d2176.2713216999587!2d-55.94322793913314!3d-31.725246535225782!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1ses!2suy!4v1437689865360"

#Mercedes
#"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d4279.302748201782!2d-58.07840650274306!3d-33.25201727614398!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1ses!2suy!4v1437689944953"