class Blog < ApplicationRecord
    enum status: { draft: 0, published: 1 }

    extend FriendlyId
    friendly_id :title, use: :slugged

    # Para impedir la creacion de entradas con campos vacios 
    validates_presence_of :title, :body 
end
