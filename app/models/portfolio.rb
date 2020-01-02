class Portfolio < ApplicationRecord
    # Validaciones
    validates_presence_of :title, :body, :main_image, :thumb_image

    # Scope para filtrar datos
    def self.angular
        where(subtitle: 'Angular')
    end
    # Otra manera de crear un scope
    scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
    
    # Defaults
    after_initialize :set_defaults
    # ||= Asigna el valor solo si antes era Nil
    def set_defaults
        self.main_image ||= "http://placehold.it/600x400"
        self.thumb_image ||= "http://placehold.it/350x200"
    end
end
