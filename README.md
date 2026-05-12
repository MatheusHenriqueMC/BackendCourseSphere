# CourseSphere API

API Backend para o CourseSphere, uma plataforma colaborativa de gestão de cursos online com estética retro gaming.

Construído com **Ruby on Rails** (modo API) e **PostgreSQL**.

## Deploy

- **API:** https://backendcoursesphere.onrender.com
- **Documentação Swagger:** https://backendcoursesphere.onrender.com/api-docs
- **Frontend:** [CourseSphere Web](https://github.com/MatheusHenriqueMC/FrontendCourseSphere)

## Repositório do Frontend

[CourseSphere Web](https://github.com/MatheusHenriqueMC/FrontendCourseSphere)

## Funcionalidades

- Autenticação JWT (registro, login, logout)
- CRUD de cursos com suporte a imagem URL e nível de dificuldade
- Seções de curso com posicionamento ordenado
- CRUD de aulas com atribuição a seções e status (rascunho/publicado)
- Sistema de inscrição (inscrever/desinscrever em cursos)
- Chatbot assistente com IA utilizando a API do Anthropic Claude
- Busca de cursos com filtro case-insensitive
- Autorização exclusiva do criador para edição/exclusão
- Documentação da API com Swagger
- Seed
- Testes automatizados com Minitest
- CI/CD com GitHub Actions
- Dockerizado para desenvolvimento e produção

## Stack Tecnológica

- Ruby 3.2
- Rails 8.1 (modo API)
- PostgreSQL 16
- JWT para autenticação
- bcrypt para hash de senhas
- HTTParty para chamadas a APIs externas (Anthropic Claude)
- Rswag para documentação Swagger
- Minitest para testes
- Docker & Docker Compose
- GitHub Actions para CI

## Como Rodar

### Pré-requisitos

- Docker e Docker Compose instalados

### Configuração

1. Clone o repositório:

```bash
git clone https://github.com/MatheusHenriqueMC/BackendCourseSphere.git
cd BackendCourseSphere
```

2. Crie o arquivo `.env` a partir do exemplo:

```bash
cp .env.example .env
```

3. Preencha as variáveis no `.env`:

```
DATABASE_URL=postgresql://postgres:postgres@db:5432/coursesphere_development
JWT_SECRET=sua-chave-secreta-aqui
RAILS_ENV=development
ANTHROPIC_API_KEY=sua-chave-da-anthropic-aqui
```

4. Construa e inicie os containers:

```bash
docker-compose build
docker-compose up -d
```

5. Crie o banco de dados e rode as migrations:

```bash
docker-compose exec api rails db:create
docker-compose exec api rails db:migrate
```

6. Popule o banco com dados de exemplo:

```bash
docker-compose exec api rails db:seed
```

7. A API estará disponível em `http://localhost:3000`
8. Documentação Swagger disponível em `http://localhost:3000/api-docs`

### Rodando os Testes

```bash
docker-compose exec api rails test
```

26 testes, 29 asserções, 0 falhas.

### Usuários da Seed

| Nome | Email | Senha |
|------|-------|-------|
| Admin CourseSphere | admin@coursesphere.com | 123456 |
| Matheus Henrique | matheus@test.com | 123456 |
| Matheus Stepple | matheusstepple@test.com | 123456 |

### Dados da Seed

- 3 usuários
- 10 cursos (Python, JavaScript, Ruby on Rails, React, HTML & CSS, TypeScript, SQL & Databases, Git & GitHub, Docker, Node.js)
- 3-5 seções por curso
- 3-5 aulas por seção com URLs de vídeo
- Múltiplas inscrições entre usuários

## Endpoints da API

### Autenticação

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| POST | /register | Criar um novo usuário |
| POST | /login | Login e receber token JWT |

### Cursos

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| GET | /courses | Listar todos os cursos (suporta ?search=) |
| GET | /courses/:id | Mostrar detalhes do curso com info de inscrição |
| POST | /courses | Criar um curso |
| PUT | /courses/:id | Atualizar um curso (apenas criador) |
| DELETE | /courses/:id | Deletar um curso (apenas criador) |

### Seções

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| GET | /courses/:id/sections | Listar seções do curso com aulas |
| POST | /courses/:id/sections | Criar uma seção (apenas criador) |
| PUT | /courses/:id/sections/:id | Atualizar uma seção (apenas criador) |
| DELETE | /courses/:id/sections/:id | Deletar uma seção (apenas criador) |

### Aulas

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| GET | /courses/:id/lessons | Listar aulas do curso |
| GET | /courses/:id/lessons/:id | Mostrar detalhes da aula |
| POST | /courses/:id/lessons | Criar uma aula (apenas criador) |
| PUT | /courses/:id/lessons/:id | Atualizar uma aula (apenas criador) |
| DELETE | /courses/:id/lessons/:id | Deletar uma aula (apenas criador) |

### Inscrição

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| POST | /courses/:id/enroll | Inscrever-se em um curso |
| DELETE | /courses/:id/unenroll | Desinscrever-se de um curso |

### Chat com IA

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| POST | /courses/:id/chat | Enviar uma mensagem para o PI, o assistente de IA do curso |

## Autenticação

Todos os endpoints exceto `/register` e `/login` requerem um token JWT no header Authorization:

```
Authorization: Bearer <seu-token>
```

## Estrutura do Projeto

```
app/
├── controllers/
│   ├── auth_controller.rb
│   ├── courses_controller.rb
│   ├── lessons_controller.rb
│   ├── sections_controller.rb
│   ├── enrollments_controller.rb
│   ├── chat_controller.rb
│   └── concerns/
│       └── authenticatable.rb
├── models/
│   ├── user.rb
│   ├── course.rb
│   ├── lesson.rb
│   ├── section.rb
│   └── enrollment.rb
└── services/
    ├── jwt_service.rb
    └── ai_chat_service.rb
```

## Schema do Banco de Dados

- **Users** — name, email, password_digest
- **Courses** — name, description, start_date, end_date, image_url, level, creator_id
- **Sections** — name, position, course_id
- **Lessons** — title, status (draft/published), video_url, course_id, section_id
- **Enrollments** — user_id, course_id (índice único)
