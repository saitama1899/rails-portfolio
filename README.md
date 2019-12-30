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

    # Para insertar datos en la DB
    rails c
    # La exclamacion te da feedback de errores
    > Skill.create!(title: "Ruby on Rails", percent_utilized: 75)
    > Skill.all

    # resource crea routes, model y controler SIN codigo
    rails g resource Portfolio title:string subtitle:string body:text main_image:text

    # Para filtrar por consola las routes que queremos ver: 
    rails routes | grep portfolio

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