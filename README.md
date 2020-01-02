# Portfolio application

> Aplicación desarrollada con Ruby on Rails 6 que permite a los usuarios crear sus propios portfolios

### Features

- Real time chat engine para los comentarios
- Blog
- Portfolio
- Interfaz de arrastrar objetos en pantalla

### Code Example

```ruby
def new
    @blog = Blog.new
end
```
### Comandos GitHub

```bash
    git init
    git status
    git add .
    git add [file]
    git commit -m 'Breve descripcion'
    git remote add origin [url.git]
    git push -u origin master

    git branch
    git checkout -b 'my-great-feature'
    git checkout master
    git merge my-great-feature

    # Tras hacer add y commit en un branch
    git push origin my-great-feature
    # Se puede confirmar el merge desde github

    # Para actualizar tu codigo
    git pull
```
### Comandos Rails

```bash
    rails -h
    rails new DevcampPortfolio
    rails db:create

    # scaffold crea routes, model y view y controller CON codigo
    rails g scaffold Blog title:string body:text

    rails db:migrate
    rails s

    rails g controller Pages home about contact

    rails g model Skill title:string percent_utilized:integer

    # Para manejar datos en la DB desde la consola de rails
    rails c
    # La exclamacion te da feedback de errores
    > Skill.create!(title: "Ruby on Rails", percent_utilized: 75)
    > Skill.all

    > skill = Skill.last
    # Borra el dato sin tener en cuenta callbacks
    > skill.delete
    # Primero ejecuta callbacks asociados y luego borra
    > skill.destroy

    # resource crea routes, model y controler SIN codigo
    rails g resource Portfolio title:string subtitle:string body:text main_image:text

```

### Routes Rails

```bash

    # Para filtrar por consola las routes que queremos ver: 
    rails routes | grep portfolio

    # Para modificar una ruta que viene por defecto, except:
    resources :portfolios, except: [:show]
    # La queremos en singular, enlazada al action controller y asignando un nombre
    # para poder utilizar el enlace en la vista como: portfolio_show_path(portfolio)
    get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

    # Añadir una ruta a blogs
    resources :blogs do
        member do
        get :toggle_status
        end
    end
    # Nombre del controller: toggle_status Ruta en vista: toggle_status_blog_path(blog)

```
### DB Rails

```bash

    # Modificar una tabla existente
    rails g migration add_fecha_to_blogs fecha:datetime

    # Para añadir el slug con la gema friendly_id
    rails g migration add_slug_to_blogs slug:string:uniq
    # uniq para indicar que sea unico
    # Guia completa de esta gema https://github.com/norman/friendly_id
    # Para añadir slug a tablas ya existentes, modificar los modelos
    # Para actualizar los datos ya existentes con el slug en Nil
    # En la consola de rails c
    > Blog.find_each(&:save)

    # Una buena forma de indicar el estado de un post en borrador o publicado
    rails g migration add_post_status_to_blogs status:integer
    # Indicar que por default es 0 en la migracion.rb
    add_column :blogs, :status, :integer, default: 0
    rails db:migrate
    # Añadir un enum al modelo:  enum status: { draft: 0, published: 1 }
    > Blog.create!(title: "Blog title", body: "Blog body")
    # Por defecto al crearlo es 0 (draft)
    > Blog.last.published!
    # Ahora el status es 1
    # Para listar los publicados
    > Blog.published
    > Blog.published.count
    
    # Para impedir la creacion de entradas con campos vacios (validaciones)
    validates_presence_of :title, :body # (en el model)

    # Crear relacion has_many entre Blog y Topic
    rails g migration add_topic_reference_to_blogs topic:references
    # En los modelos 
    blog.rb belongs_to :topic
    topic.rb has_many :blogs
    # En consola puedes crear topic
    > Topic.last.blogs.create!(title: "Titulo", body: "Body") 

    # Filtrar BD
    > Portfolio.where(subtitle: 'Ruby on Rails')
    # Scope para filtrar datos (en el model)
    def self.angular
        where(subtitle: 'Angular')
    end
    # Otra manera de crear un scope 
    scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
    # (En el controler)
    Portfolio.ruby_on_rails
    # Para asociarlo a una url concreta (creando la vista)
    def ruby_on_rails
        Portfolio.ruby_on_rails
    end
    get 'ruby-on-rails-items', to: 'portfolios#ruby_on_rails' # En routes

    # Defaults (asignar valores por defecto al crear una instancia)
    after_initialize :set_defaults
    # ||= Asigna el valor solo si antes era Nil
    def set_defaults
        self.main_image ||= "http://placehold.it/600x400"
        self.thumb_image ||= "http://placehold.it/350x200"
    end
```

### Apuntes Rails

> En archivos html.erb
```js
    Porcesa la lógica de ruby sin renderizar nada
    <%  %>

    Permite renderizar variables
    <%=  %>

    Para comentar inserciones de ruby
    <%#=  %>

    Nos devuelve Url relativa
    <%= new_portfolio_path %>

    Url absoluta, Util en casos de subdominio y mandar la url via email
    <%= new_portfolio_url %>
```

```bash
# Concerns para compartir funciones comunes entre modelos
# concerns/placeholder.rb
module Placeholder
    extend ActiveSupport::Concern

    def self.image_generator(height:, width:)
        "http://placehold.it/#{height}x#{width}"
    end
end
# En el modelo
    include Placeholder

    def set_defaults
        self.badge ||= Placeholder.image_generator(height: '250', width: '250')
    end
```