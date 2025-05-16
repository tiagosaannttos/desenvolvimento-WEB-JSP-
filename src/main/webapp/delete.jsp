<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Deletar Registro</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="form-container">
    <h2>Deletar Registro</h2>

<%
    String id = request.getParameter("id");

    if (id == null || id.isEmpty()) {
        // Mostra formulário para digitar o ID
%>
        <form method="GET" action="delete.jsp">
            <label for="id">Digite o ID do usuário que deseja deletar:</label>
            <input type="number" id="id" name="id" required>
            <input type="submit" value="Buscar">
        </form>
<%
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios_db", "root", "admin")) {
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuarios WHERE id = ?");
                stmt.setInt(1, Integer.parseInt(id));
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
%>
                    <p>Você tem certeza que deseja deletar este registro?</p>
                    <p><strong>ID:</strong> <%= rs.getInt("id") %></p>
                    <p><strong>Nome:</strong> <%= rs.getString("nome") %></p>
                    <p><strong>Email:</strong> <%= rs.getString("email") %></p>

                    <form action="DeleteAction.jsp" method="POST" onsubmit="return confirm('Tem certeza que deseja deletar este registro?');">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <input type="submit" value="Confirmar Exclusão" class="btn btn-delete">
                    </form>
<%
                } else {
                    out.println("<p>Registro não encontrado!</p>");
                }
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
