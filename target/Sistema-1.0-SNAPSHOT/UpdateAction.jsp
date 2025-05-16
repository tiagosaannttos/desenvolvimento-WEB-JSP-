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

<%
    String id = request.getParameter("id");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");

    if (id != null && nome != null && email != null) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/usuarios_db?serverTimezone=UTC&useSSL=false";
            conn = DriverManager.getConnection(url, "root", "admin");

            String sql = "UPDATE usuarios SET nome = ?, email = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome);
            stmt.setString(2, email);
            stmt.setInt(3, Integer.parseInt(id));

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<h2>✅ Registro atualizado com sucesso!</h2>");
            } else {
                out.println("<h2>❌ Erro ao atualizar o registro. Tente novamente.</h2>");
            }

        } catch (Exception e) {
            out.println("<h2>❌ Erro ao conectar com o banco de dados:</h2>");
            e.printStackTrace(new java.io.PrintWriter(out));
        } finally {
            if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
        }
    } else {
        out.println("<h2>❌ Dados incompletos para atualização.</h2>");
    }
%>

<br><br>
<a href="principal.jsp" class="btn-voltar">Voltar</a>

</body>
</html>
