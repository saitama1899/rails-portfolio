class Portfolio < ApplicationRecord
    has_many :technologies
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
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end
