# Lo puedes usar para crear datos en la DB durante el desarrollo
# Para ejecutar rails db:setup

3.times do |topic|
    Topic.create!(
        title: " Topic # #{topic}"
    )
end

10.times do |blog|
    Blog.create!(
        title: "Mi post del Blog # #{blog}", # esta variable nos daria el numero
        body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        topic_id: Topic.last.id
    )
end

5.times do |skill|
    Skill.create!(
        title: "Habilidad # #{skill}",
        percent_utilized: 15
    )
end

8.times do |portfolio|
    Portfolio.create!(
        title: "Portfolio # #{portfolio}",
        subtitle: "Ruby on Rails",
        body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        main_image: "http://placehold.it/600x400",
        thumb_image: "http://placehold.it/350x200"
    )
end

1.times do |portfolio|
    Portfolio.create!(
        title: "Portfolio # #{portfolio}",
        subtitle: "Angular",
        body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        main_image: "http://placehold.it/600x400",
        thumb_image: "http://placehold.it/350x200"
    )
end

3.times do |technology|
    Portfolio.last.technologies.create!(
        name: "Technology # #{technology}"
    )
end



# Para inserciones mas pequeñas se puede usar la consola interactiva
# de rails c