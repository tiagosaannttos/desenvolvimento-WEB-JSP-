<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Atualizar Registro</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="form-container">
    <h2>Atualizar Registro</h2>

    <%
        String id = request.getParameter("id");

        if (id == null || id.isEmpty()) {
            // Mostra formulário para o usuário digitar o ID
    %>
            <form method="GET" action="update.jsp">
                <label for="id">Digite o ID do usuário que deseja atualizar:</label>
                <input type="number" id="id" name="id" required>
                <input type="submit" value="Buscar">
            </form>
    <%
        } else {
            try (
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios_db", "root", "admin");
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuarios WHERE id = ?")
            ) {
                stmt.setInt(1, Integer.parseInt(id));
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
    %>
                    <form action="UpdateAction.jsp" method="POST">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

                        <label for="nome">Nome:</label>
                        <input type="text" id="nome" name="nome" value="<%= rs.getString("nome") %>" required><br><br>

                        <label for="email">E-mail:</label>
                        <input type="email" id="email" name="email" value="<%= rs.getString("email") %>" required><br><br>

                        <input type="submit" value="Atualizar" class="btn">
                    </form>
    <%
                } else {
                    out.println("<p>Registro não encontrado!</p>");
                }
            } catch (Exception e) {
                out.println("<p>Erro: " + e.getMessage() + "</p>");
            }
        }
    %>

    <br><br>
    <a href="principal.jsp" class="btn-voltar">Voltar</a>
</div>

</body>
</html>
