# frozen_string_literal: true

@portfolio_images = [
  'https://raw.githubusercontent.com/vmwhoami/danceter/pre-development/app/assets/images/Screenshot_1.jpg',
  'https://github.com/vmwhoami/The-Next-Web/blob/master/img/screenshot.jpg?raw=true',
  'https://raw.githubusercontent.com/acushlakoncept/smashing-magazine/feature-home/assets/images/screenshot.png',
  'https://raw.githubusercontent.com/vmwhoami/Newsweek/working-branch/img/Screenshot_1.jpg',
  'https://raw.githubusercontent.com/vmwhoami/annual-concert/work-branch/img/screenshot_desktop.jpg',
  'https://raw.githubusercontent.com/vmwhoami/advanced-css/work-home/img/Screenshot_1.jpg',
  'https://raw.githubusercontent.com/vmwhoami/Trillo/work/img/Screenshot_Desktop.jpg'

]

User.create!(name: 'Vitalie Melnic', email: 'vmwhoami@gmail.com', password: 'password', roles: 'site_admin')

puts '=' * 100
puts '++++++++++ User created++++++++'

@technologies = ['Javascript', 'React', 'Ruby', 'Ruby on Rails', 'HTML', 'CSS']
6.times do |t|
  Topic.create!(
    title: @technologies[t]
  )
end
puts '=' * 100
puts '++++++++++  Topics created ++++++++'

10.times do |_post|
  tech = @technologies.sample
  Blog.create!(
    user: User.first,
    title: "I know #{tech} and I love it!",
    body: " #{tech} , often abbreviated as #{tech} , is a programming language that conforms to the ECMAScript specification. #{tech}  is high-level, often just-in-time compiled
       ",
    topic: Topic.find_by_title(tech)
  )
end
puts '=' * 100
puts 'Blogs created'

5.times do |_skill|
  tech = @technologies.sample
  Skill.create!(
    name: "Rails #{tech}",
    percentage_completed: 70
  )
end
puts '=' * 100
puts 'Skills created'

7.times do |p|
  img = @portfolio_images[p]
  Recentwork.create!(
    title: @technologies.sample,
    subtitle: 'Html and CSS',
    body: 'Caramels dragée tart pie. Halvah donut marshmallow  ',
    main_image: img,
    thumb_image: img
  )
end
img = @portfolio_images[-1]
Recentwork.create!(
  title: 'Portfolio 1',
  subtitle: 'Ruby on Rails',
  body: 'Caramels dragée tart pie.
  Halvah donut marshmallow muffin pie tootsie roll oat
   cake. Jelly beans wafer topping.  ',
  main_image: img,
  thumb_image: img
)
puts 'Recentwork created successfully'
4.times do |t|
  Recentwork.last.technologies.create!(
    name: @technologies[t]
  )
end

puts '=' * 100
puts 'Technologies created successfully'
