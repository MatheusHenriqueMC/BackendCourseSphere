puts "Cleaning database..."
Enrollment.destroy_all
Lesson.destroy_all
Section.destroy_all
Course.destroy_all
User.destroy_all

puts "Creating users..."
admin = User.create!(
  name: "Admin CourseSphere",
  email: "admin@coursesphere.com",
  password: "123456"
)

student1 = User.create!(
  name: "Matheus Henrique",
  email: "matheus@test.com",
  password: "123456"
)

student2 = User.create!(
  name: "Matheus Stepple",
  email: "matheusstepple@test.com",
  password: "123456"
)

student3 = User.create!(
  name: "Ana Carolina",
  email: "ana@test.com",
  password: "123456"
)

video = "https://www.youtube.com/watch?v=widZEAJc0QM"

puts "Creating courses..."

python = Course.create!(
  name: "Python",
  description: "Learn programming fundamentals such as variables, control flow, and loops with the world's most popular and versatile coding language — Python!",
  start_date: Date.today,
  end_date: Date.today + 60,
  level: "beginner",
  image_url: "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExanI0d2kxb2V6cW5nZjR6eTd1aDI1NTV5bnkwMDZyajV1bGxleWtvcyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/TRebCjNbc4dIA/giphy.gif",
  creator: admin
)

py_s1 = Section.create!(name: "The Console", position: 1, course: python)
py_s2 = Section.create!(name: "Variables", position: 2, course: python)
py_s3 = Section.create!(name: "Control Flow", position: 3, course: python)
py_s4 = Section.create!(name: "Functions", position: 4, course: python)
py_s5 = Section.create!(name: "Data Structures", position: 5, course: python)

Lesson.create!(title: "Setting Up Python", status: "published", video_url: video, course: python, section: py_s1)
Lesson.create!(title: "Hello World", status: "published", video_url: video, course: python, section: py_s1)
Lesson.create!(title: "Running Scripts", status: "published", video_url: video, course: python, section: py_s1)

Lesson.create!(title: "Data Types", status: "published", video_url: video, course: python, section: py_s2)
Lesson.create!(title: "String Operations", status: "published", video_url: video, course: python, section: py_s2)
Lesson.create!(title: "Type Casting", status: "published", video_url: video, course: python, section: py_s2)
Lesson.create!(title: "User Input", status: "published", video_url: video, course: python, section: py_s2)

Lesson.create!(title: "If/Else Statements", status: "published", video_url: video, course: python, section: py_s3)
Lesson.create!(title: "While Loops", status: "published", video_url: video, course: python, section: py_s3)
Lesson.create!(title: "For Loops", status: "published", video_url: video, course: python, section: py_s3)
Lesson.create!(title: "Nested Loops", status: "draft", video_url: video, course: python, section: py_s3)

Lesson.create!(title: "Defining Functions", status: "published", video_url: video, course: python, section: py_s4)
Lesson.create!(title: "Parameters & Return", status: "published", video_url: video, course: python, section: py_s4)
Lesson.create!(title: "Lambda Functions", status: "draft", video_url: video, course: python, section: py_s4)

Lesson.create!(title: "Lists", status: "published", video_url: video, course: python, section: py_s5)
Lesson.create!(title: "Dictionaries", status: "published", video_url: video, course: python, section: py_s5)
Lesson.create!(title: "Tuples & Sets", status: "published", video_url: video, course: python, section: py_s5)
Lesson.create!(title: "List Comprehensions", status: "draft", video_url: video, course: python, section: py_s5)

javascript = Course.create!(
  name: "JavaScript",
  description: "Learn variables, loops, functions, and events to start building interactive web apps with the programming language of the web — JavaScript!",
  start_date: Date.today,
  end_date: Date.today + 90,
  level: "beginner",
  image_url: "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExcmx4NTZ2dXJ2cmZ2OWFkeWprc2liamhsam9pa2I3aG14eXN5amVlayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/pI43YlhMoPqsE/giphy.gif",
  creator: admin
)

js_s1 = Section.create!(name: "Getting Started", position: 1, course: javascript)
js_s2 = Section.create!(name: "Functions & Scope", position: 2, course: javascript)
js_s3 = Section.create!(name: "DOM Manipulation", position: 3, course: javascript)
js_s4 = Section.create!(name: "Async JavaScript", position: 4, course: javascript)

Lesson.create!(title: "Your First Script", status: "published", video_url: video, course: javascript, section: js_s1)
Lesson.create!(title: "Variables & Constants", status: "published", video_url: video, course: javascript, section: js_s1)
Lesson.create!(title: "Data Types", status: "published", video_url: video, course: javascript, section: js_s1)
Lesson.create!(title: "Operators", status: "published", video_url: video, course: javascript, section: js_s1)

Lesson.create!(title: "Declaring Functions", status: "published", video_url: video, course: javascript, section: js_s2)
Lesson.create!(title: "Arrow Functions", status: "published", video_url: video, course: javascript, section: js_s2)
Lesson.create!(title: "Closures", status: "published", video_url: video, course: javascript, section: js_s2)

Lesson.create!(title: "Selecting Elements", status: "published", video_url: video, course: javascript, section: js_s3)
Lesson.create!(title: "Event Listeners", status: "published", video_url: video, course: javascript, section: js_s3)
Lesson.create!(title: "Creating & Removing Elements", status: "draft", video_url: video, course: javascript, section: js_s3)

Lesson.create!(title: "Callbacks", status: "published", video_url: video, course: javascript, section: js_s4)
Lesson.create!(title: "Promises", status: "published", video_url: video, course: javascript, section: js_s4)
Lesson.create!(title: "Async/Await", status: "draft", video_url: video, course: javascript, section: js_s4)

rails_course = Course.create!(
  name: "Ruby on Rails",
  description: "Build full-stack web applications with Ruby on Rails. Learn MVC architecture, RESTful APIs, and database management.",
  start_date: Date.today + 7,
  end_date: Date.today + 120,
  level: "intermediate",
  image_url: "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExNmZvMmkwZ3pqbjY4b3JiYWtlZW42Y3NnNGlxMnh0aHduMWJ2OGF2NiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xWMPYx55WNhX136T0V/giphy.gif",
  creator: admin
)

rails_s1 = Section.create!(name: "MVC Basics", position: 1, course: rails_course)
rails_s2 = Section.create!(name: "Models & Database", position: 2, course: rails_course)
rails_s3 = Section.create!(name: "RESTful APIs", position: 3, course: rails_course)
rails_s4 = Section.create!(name: "Authentication", position: 4, course: rails_course)

Lesson.create!(title: "What is MVC?", status: "published", video_url: video, course: rails_course, section: rails_s1)
Lesson.create!(title: "Rails File Structure", status: "published", video_url: video, course: rails_course, section: rails_s1)
Lesson.create!(title: "Routing Basics", status: "published", video_url: video, course: rails_course, section: rails_s1)

Lesson.create!(title: "Active Record Intro", status: "published", video_url: video, course: rails_course, section: rails_s2)
Lesson.create!(title: "Migrations", status: "published", video_url: video, course: rails_course, section: rails_s2)
Lesson.create!(title: "Validations", status: "published", video_url: video, course: rails_course, section: rails_s2)
Lesson.create!(title: "Associations", status: "draft", video_url: video, course: rails_course, section: rails_s2)

Lesson.create!(title: "Building Your First API", status: "published", video_url: video, course: rails_course, section: rails_s3)
Lesson.create!(title: "JSON Responses", status: "published", video_url: video, course: rails_course, section: rails_s3)
Lesson.create!(title: "Error Handling", status: "published", video_url: video, course: rails_course, section: rails_s3)

Lesson.create!(title: "Authentication with JWT", status: "published", video_url: video, course: rails_course, section: rails_s4)
Lesson.create!(title: "Authorization", status: "draft", video_url: video, course: rails_course, section: rails_s4)
Lesson.create!(title: "Protecting Routes", status: "draft", video_url: video, course: rails_course, section: rails_s4)

react_course = Course.create!(
  name: "React",
  description: "Master modern frontend development with React. Learn components, hooks, state management and build interactive UIs.",
  start_date: Date.today,
  end_date: Date.today + 75,
  level: "intermediate",
  image_url: "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExYm1pdm5maG1hZDI5ZGM0ZGNrZGxvenFiaDN2d2wwNGt4aHZvOXQzZSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/J5A1a5C0j1bQuteCtq/giphy.gif",
  creator: student1
)

react_s1 = Section.create!(name: "Components & JSX", position: 1, course: react_course)
react_s2 = Section.create!(name: "Hooks", position: 2, course: react_course)
react_s3 = Section.create!(name: "State Management", position: 3, course: react_course)
react_s4 = Section.create!(name: "Routing", position: 4, course: react_course)

Lesson.create!(title: "What is React?", status: "published", video_url: video, course: react_course, section: react_s1)
Lesson.create!(title: "Creating Components", status: "published", video_url: video, course: react_course, section: react_s1)
Lesson.create!(title: "Props", status: "published", video_url: video, course: react_course, section: react_s1)
Lesson.create!(title: "Conditional Rendering", status: "published", video_url: video, course: react_course, section: react_s1)

Lesson.create!(title: "useState", status: "published", video_url: video, course: react_course, section: react_s2)
Lesson.create!(title: "useEffect", status: "published", video_url: video, course: react_course, section: react_s2)
Lesson.create!(title: "useContext", status: "published", video_url: video, course: react_course, section: react_s2)
Lesson.create!(title: "Custom Hooks", status: "draft", video_url: video, course: react_course, section: react_s2)

Lesson.create!(title: "Lifting State Up", status: "published", video_url: video, course: react_course, section: react_s3)
Lesson.create!(title: "Context API", status: "published", video_url: video, course: react_course, section: react_s3)
Lesson.create!(title: "useReducer", status: "draft", video_url: video, course: react_course, section: react_s3)

Lesson.create!(title: "React Router Setup", status: "published", video_url: video, course: react_course, section: react_s4)
Lesson.create!(title: "Dynamic Routes", status: "published", video_url: video, course: react_course, section: react_s4)
Lesson.create!(title: "Protected Routes", status: "draft", video_url: video, course: react_course, section: react_s4)

html_css = Course.create!(
  name: "HTML & CSS",
  description: "Build beautiful websites from scratch. Learn HTML structure, CSS styling, flexbox, grid and responsive design.",
  start_date: Date.today,
  end_date: Date.today + 45,
  level: "beginner",
  image_url: "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExcjBjdWNhN2k1ZHRkaXZreXlzamRtdWJoZnRiYW5xcXdjc3JzeWtjNSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/N3yLGQ1oMYfGU/giphy.gif",
  creator: admin
)

html_s1 = Section.create!(name: "HTML Basics", position: 1, course: html_css)
html_s2 = Section.create!(name: "CSS Fundamentals", position: 2, course: html_css)
html_s3 = Section.create!(name: "Flexbox & Grid", position: 3, course: html_css)

Lesson.create!(title: "Your First HTML Page", status: "published", video_url: video, course: html_css, section: html_s1)
Lesson.create!(title: "Tags & Elements", status: "published", video_url: video, course: html_css, section: html_s1)
Lesson.create!(title: "Forms & Inputs", status: "published", video_url: video, course: html_css, section: html_s1)
Lesson.create!(title: "Semantic HTML", status: "published", video_url: video, course: html_css, section: html_s1)

Lesson.create!(title: "Selectors & Properties", status: "published", video_url: video, course: html_css, section: html_s2)
Lesson.create!(title: "Box Model", status: "published", video_url: video, course: html_css, section: html_s2)
Lesson.create!(title: "Colors & Typography", status: "published", video_url: video, course: html_css, section: html_s2)

Lesson.create!(title: "Flexbox Layout", status: "published", video_url: video, course: html_css, section: html_s3)
Lesson.create!(title: "CSS Grid", status: "published", video_url: video, course: html_css, section: html_s3)
Lesson.create!(title: "Responsive Design", status: "draft", video_url: video, course: html_css, section: html_s3)

typescript = Course.create!(
  name: "TypeScript",
  description: "Add type safety to your JavaScript code. Learn interfaces, generics, enums and advanced type patterns.",
  start_date: Date.today + 14,
  end_date: Date.today + 90,
  level: "intermediate",
  image_url: "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExZzE5M3NoYzI2ZHkwamE4cXlibG51cjh1cmkyZmQyandvZGl2bjAzaiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/9LZTcawH3mc8V2oUqk/giphy.gif",
  creator: student1
)

ts_s1 = Section.create!(name: "Getting Started", position: 1, course: typescript)
ts_s2 = Section.create!(name: "Types & Interfaces", position: 2, course: typescript)
ts_s3 = Section.create!(name: "Advanced Types", position: 3, course: typescript)

Lesson.create!(title: "Why TypeScript?", status: "published", video_url: video, course: typescript, section: ts_s1)
Lesson.create!(title: "Installing & Setup", status: "published", video_url: video, course: typescript, section: ts_s1)
Lesson.create!(title: "Basic Types", status: "published", video_url: video, course: typescript, section: ts_s1)

Lesson.create!(title: "Interfaces", status: "published", video_url: video, course: typescript, section: ts_s2)
Lesson.create!(title: "Type Aliases", status: "published", video_url: video, course: typescript, section: ts_s2)
Lesson.create!(title: "Enums", status: "published", video_url: video, course: typescript, section: ts_s2)
Lesson.create!(title: "Union Types", status: "draft", video_url: video, course: typescript, section: ts_s2)

Lesson.create!(title: "Generics", status: "published", video_url: video, course: typescript, section: ts_s3)
Lesson.create!(title: "Utility Types", status: "published", video_url: video, course: typescript, section: ts_s3)
Lesson.create!(title: "Decorators", status: "draft", video_url: video, course: typescript, section: ts_s3)

sql = Course.create!(
  name: "SQL & Databases",
  description: "Master relational databases. Learn SQL queries, joins, indexes, and database design principles.",
  start_date: Date.today,
  end_date: Date.today + 60,
  level: "beginner",
  image_url: "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExYXhhcTNhcXJia2FkZmEycnFnd3p3bzFteXl0Zmd1bHJtbnlqNDA1cCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/9B7XwCQZRQfQs/giphy.gif",
  creator: admin
)

sql_s1 = Section.create!(name: "SQL Basics", position: 1, course: sql)
sql_s2 = Section.create!(name: "Joins & Relationships", position: 2, course: sql)
sql_s3 = Section.create!(name: "Advanced Queries", position: 3, course: sql)

Lesson.create!(title: "What is SQL?", status: "published", video_url: video, course: sql, section: sql_s1)
Lesson.create!(title: "SELECT Queries", status: "published", video_url: video, course: sql, section: sql_s1)
Lesson.create!(title: "INSERT, UPDATE, DELETE", status: "published", video_url: video, course: sql, section: sql_s1)
Lesson.create!(title: "WHERE & Filtering", status: "published", video_url: video, course: sql, section: sql_s1)

Lesson.create!(title: "INNER JOIN", status: "published", video_url: video, course: sql, section: sql_s2)
Lesson.create!(title: "LEFT & RIGHT JOIN", status: "published", video_url: video, course: sql, section: sql_s2)
Lesson.create!(title: "Many-to-Many", status: "published", video_url: video, course: sql, section: sql_s2)

Lesson.create!(title: "Subqueries", status: "published", video_url: video, course: sql, section: sql_s3)
Lesson.create!(title: "Indexes & Performance", status: "published", video_url: video, course: sql, section: sql_s3)
Lesson.create!(title: "Transactions", status: "draft", video_url: video, course: sql, section: sql_s3)

git_course = Course.create!(
  name: "Git & GitHub",
  description: "Learn version control with Git. Master branches, merges, pull requests and collaborative workflows.",
  start_date: Date.today,
  end_date: Date.today + 30,
  level: "beginner",
  image_url: "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExcHZmemRzcmhqZ3dhMm5pZHJ0YzI4d2FkM2l0azdta3J3MHkzbzF1cSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/MHboUUIoxzOKs/giphy.gif",
  creator: student2
)

git_s1 = Section.create!(name: "Git Basics", position: 1, course: git_course)
git_s2 = Section.create!(name: "Branching", position: 2, course: git_course)
git_s3 = Section.create!(name: "GitHub & Collaboration", position: 3, course: git_course)

Lesson.create!(title: "Installing Git", status: "published", video_url: video, course: git_course, section: git_s1)
Lesson.create!(title: "Init, Add & Commit", status: "published", video_url: video, course: git_course, section: git_s1)
Lesson.create!(title: "Git Log & Status", status: "published", video_url: video, course: git_course, section: git_s1)

Lesson.create!(title: "Creating Branches", status: "published", video_url: video, course: git_course, section: git_s2)
Lesson.create!(title: "Merging Branches", status: "published", video_url: video, course: git_course, section: git_s2)
Lesson.create!(title: "Resolving Conflicts", status: "published", video_url: video, course: git_course, section: git_s2)
Lesson.create!(title: "Rebasing", status: "draft", video_url: video, course: git_course, section: git_s2)

Lesson.create!(title: "Push & Pull", status: "published", video_url: video, course: git_course, section: git_s3)
Lesson.create!(title: "Pull Requests", status: "published", video_url: video, course: git_course, section: git_s3)
Lesson.create!(title: "Code Reviews", status: "draft", video_url: video, course: git_course, section: git_s3)

docker_course = Course.create!(
  name: "Docker",
  description: "Containerize your applications with Docker. Learn images, containers, volumes, networks and Docker Compose.",
  start_date: Date.today + 7,
  end_date: Date.today + 60,
  level: "advanced",
  image_url: "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExdHJsYWJ3b3RoZzJkMzZ4dmhrcGUxcGR1NDBhcWo4eHRienExOTk2ZSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/LXxWO0pgGEma8W40A9/giphy.gif",
  creator: admin
)

docker_s1 = Section.create!(name: "Docker Basics", position: 1, course: docker_course)
docker_s2 = Section.create!(name: "Images & Containers", position: 2, course: docker_course)
docker_s3 = Section.create!(name: "Docker Compose", position: 3, course: docker_course)

Lesson.create!(title: "What is Docker?", status: "published", video_url: video, course: docker_course, section: docker_s1)
Lesson.create!(title: "Installing Docker", status: "published", video_url: video, course: docker_course, section: docker_s1)
Lesson.create!(title: "Your First Container", status: "published", video_url: video, course: docker_course, section: docker_s1)

Lesson.create!(title: "Building Images", status: "published", video_url: video, course: docker_course, section: docker_s2)
Lesson.create!(title: "Dockerfile Deep Dive", status: "published", video_url: video, course: docker_course, section: docker_s2)
Lesson.create!(title: "Volumes & Networks", status: "published", video_url: video, course: docker_course, section: docker_s2)
Lesson.create!(title: "Multi-stage Builds", status: "draft", video_url: video, course: docker_course, section: docker_s2)

Lesson.create!(title: "Docker Compose Intro", status: "published", video_url: video, course: docker_course, section: docker_s3)
Lesson.create!(title: "Multi-Service Apps", status: "published", video_url: video, course: docker_course, section: docker_s3)
Lesson.create!(title: "Production Setup", status: "draft", video_url: video, course: docker_course, section: docker_s3)

node_course = Course.create!(
  name: "Node.js",
  description: "Build server-side applications with JavaScript. Learn Express, middleware, APIs, and server deployment.",
  start_date: Date.today,
  end_date: Date.today + 75,
  level: "intermediate",
  image_url: "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMjI4YjMxcGE5bWFremdkc2lwNGd1dXFqZDZ4cHlyZm1yMmM3ZTc5aCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/iiJ870TcI3PZKxatzS/giphy.gif",
  creator: student2
)

node_s1 = Section.create!(name: "Node Fundamentals", position: 1, course: node_course)
node_s2 = Section.create!(name: "Express.js", position: 2, course: node_course)
node_s3 = Section.create!(name: "APIs & Middleware", position: 3, course: node_course)

Lesson.create!(title: "What is Node.js?", status: "published", video_url: video, course: node_course, section: node_s1)
Lesson.create!(title: "Modules & NPM", status: "published", video_url: video, course: node_course, section: node_s1)
Lesson.create!(title: "File System", status: "published", video_url: video, course: node_course, section: node_s1)
Lesson.create!(title: "Event Loop", status: "published", video_url: video, course: node_course, section: node_s1)

Lesson.create!(title: "Setting Up Express", status: "published", video_url: video, course: node_course, section: node_s2)
Lesson.create!(title: "Routing", status: "published", video_url: video, course: node_course, section: node_s2)
Lesson.create!(title: "Template Engines", status: "draft", video_url: video, course: node_course, section: node_s2)

Lesson.create!(title: "Building REST APIs", status: "published", video_url: video, course: node_course, section: node_s3)
Lesson.create!(title: "Authentication Middleware", status: "published", video_url: video, course: node_course, section: node_s3)
Lesson.create!(title: "Error Handling", status: "draft", video_url: video, course: node_course, section: node_s3)

puts "Creating enrollments..."
Enrollment.create!(user: student1, course: python)
Enrollment.create!(user: student1, course: javascript)
Enrollment.create!(user: student1, course: html_css)
Enrollment.create!(user: student1, course: sql)
Enrollment.create!(user: student1, course: docker_course)

Enrollment.create!(user: student2, course: python)
Enrollment.create!(user: student2, course: react_course)
Enrollment.create!(user: student2, course: typescript)
Enrollment.create!(user: student2, course: rails_course)

Enrollment.create!(user: student3, course: python)
Enrollment.create!(user: student3, course: javascript)
Enrollment.create!(user: student3, course: react_course)
Enrollment.create!(user: student3, course: git_course)
Enrollment.create!(user: student3, course: node_course)
Enrollment.create!(user: student3, course: docker_course)

Enrollment.create!(user: admin, course: react_course)
Enrollment.create!(user: admin, course: git_course)
Enrollment.create!(user: admin, course: node_course)
Enrollment.create!(user: admin, course: typescript)

puts ""
puts "Seed completed!"
puts ""
puts "Users created:"
puts "  admin@coursesphere.com / 123456"
puts "  matheus@test.com / 123456"
puts "  matheusstepple@test.com / 123456"
puts "  ana@test.com / 123456"
puts ""
puts "Courses: #{Course.count}"
puts "Sections: #{Section.count}"
puts "Lessons: #{Lesson.count}"
puts "Enrollments: #{Enrollment.count}"