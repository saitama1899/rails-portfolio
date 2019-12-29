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

```git
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
    rails g scaffold Blog title:string body:text
    rails db:migrate
    rails s

    rails g controller Pages home about contact
```

