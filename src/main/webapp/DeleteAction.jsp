<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Deletar Registro</title>
</head>
<body>

<%
    String id = request.getParameter("id");

    if (id != null && !id.trim().isEmpty()) {
        try (
            // Conectar ao banco de dados
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios_db", "root", "admin");
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM usuarios WHERE id = ?")
        ) {
            stmt.setInt(1, Integer.parseInt(id)); // Garantindo que o ID seja do tipo correto

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<h2>Registro deletado com sucesso!</h2>");
            } else {
                out.println("<h2>Erro ao deletar registro. O ID fornecido não existe.</h2>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h2>Erro ao acessar o banco de dados: " + e.getMessage() + "</h2>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Erro inesperado: " + e.getMessage() + "</h2>");
        }
    } else {
        out.println("<h2>ID inválido ou não fornecido!</h2>");
    }
%>

<!-- Link para voltar à página principal -->
<a href="principal.jsp">Voltar ao menu principal</a>

</body>
</html>

