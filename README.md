💻 Desenvolvimento Web - CRUD com JSP e MySQL
Este projeto foi desenvolvido como parte da disciplina de Desenvolvimento Web, utilizando JSP, HTML, CSS e MySQL para implementar um sistema simples de login e CRUD (Create, Read, Update, Delete) de usuários.

🔧 Tecnologias Utilizadas
Java (JSP)

Apache Tomcat

HTML5 / CSS3

MySQL

NetBeans IDE

JDBC (Java Database Connectivity)

🧩 Estrutura do Projeto
📁 web
├── css/
│ └── style.css # Estilos da aplicação
├── login.jsp # Tela inicial de login
├── VerificaSenha.jsp # Validação do login
├── principal.jsp # Tela principal com botões de CRUD e logout
├── create.jsp # Formulário para criar um novo registro
├── read.jsp # Exibe todos os registros do banco
├── update.jsp # Formulário para selecionar e editar registro
├── updateAction.jsp # Executa a atualização
├── delete.jsp # Formulário para deletar com confirmação
├── deleteAction.jsp # Executa a exclusão
└── logout.jsp (opcional) # Destroi a sessão (a ser implementado)

✅ Funcionalidades
Tela de login com verificação de senha

Tela principal com navegação entre operações

Criar novo usuário (Nome e Email)

Listar registros do banco

Atualizar registros existentes

Deletar registros com confirmação

Botões de voltar e sair

Layout estilizado com CSS

⚙️ Requisitos para rodar o projeto
Apache Tomcat (versão 9 ou superior)

MySQL Server

NetBeans IDE com suporte a projetos web

Conexão JDBC configurada corretamente nos arquivos .jsp

🗃️ Banco de Dados
Execute o seguinte SQL no seu MySQL para criar a base de dados e a tabela:

CREATE DATABASE desenvolvimento;

USE desenvolvimento;

CREATE TABLE usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL
);

⚠️ Atenção: Atualize os dados de conexão (usuário, senha, URL do banco) nos arquivos .jsp conforme o seu ambiente.

🚀 Como executar
Clone o repositório:
git clone https://github.com/tiagosaannttos/desenvolvimento-WEB-JSP-.git

Abra o projeto no NetBeans.

Configure o Apache Tomcat no NetBeans, se ainda não estiver feito.

Certifique-se de que o MySQL está rodando e o banco foi criado.

Execute o projeto com o botão “Run Project” (F6).

👨‍🎓 Autor
Tiago dos Santos Silva
Estudante de Análise e Desenvolvimento de Sistemas
🔗 GitHub - tiagosaannttos

