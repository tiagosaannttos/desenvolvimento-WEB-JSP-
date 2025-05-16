<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");

    // Verificando se o nome e email não estão nulos
    if (nome != null && !nome.trim().isEmpty() && email != null && !email.trim().isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios_db", "root", "admin");

            // SQL de inserção
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO usuarios (nome, email) VALUES (?, ?)");
            stmt.setString(1, nome);
            stmt.setString(2, email);

            // Executa o SQL
            int rowsAffected = stmt.executeUpdate();

            // Verificando se a inserção foi bem-sucedida
            if (rowsAffected > 0) {
                response.sendRedirect("read.jsp");  // Redireciona para a página de leitura de registros
            } else {
                out.println("<p style='color:red;'>Falha ao inserir o registro.</p>");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();  // Exibe o erro completo no console para depuração
            out.println("<p style='color:red;'>Erro ao inserir registro: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p style='color:red;'>Nome e email não podem estar vazios.</p>");
    }
%>
