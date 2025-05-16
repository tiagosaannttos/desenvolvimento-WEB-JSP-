<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teste de Conexão com MySQL</title>
</head>
<body>
<%
    String url = "jdbc:mysql://localhost:3306/usuarios_db?serverTimezone=UTC&useSSL=false";
    String usuario = "root";
    String senha = "admin";

    Connection conexao = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexao = DriverManager.getConnection(url, usuario, senha);
        out.println("<h2>✅ Conexão bem-sucedida com o banco de dados!</h2>");
    } catch (Exception e) {
        out.println("<h2>❌ Erro na conexão: " + e.toString() + "</h2>");
    } finally {
        if (conexao != null) {
            try {
                conexao.close();
            } catch (SQLException e) {
                out.println("<p>Erro ao fechar conexão: " + e.getMessage() + "</p>");
            }
        }
    }
%>
</body>
</html>
