# Lo puedes usar para crear datos en la DB durante el desarrollo
# Para ejecutar rails db:setup

10.times do |blog|
    Blog.create!(
        title: "Mi post del Blog # #{blog}", # esta variable nos daria el numero
        body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    )
end

puts "10 blog posts created"

5.times do |skill|
    Skill.create!(
        title: "Habilidad # #{skill}",
        percent_utilized: 15
    )
end

puts "5 skills created"

9.times do |portfolio|
    Portfolio.create!(
        title: "Portfolio # #{portfolio}",
        subtitle: "Subtitulo del portfolio # #{portfolio}",
        body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        main_image: "http://placehold.it/600x400",
        thumb_image: "http://placehold.it/350x200"
    )
end

puts "9 portfolio created"

# Para inserciones mas pequeñas se puede usar la consola interactiva
# de rails c