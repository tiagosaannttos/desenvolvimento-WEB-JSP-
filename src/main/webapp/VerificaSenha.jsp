<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Resultado do Login</title>
    <script>
        // Função para redirecionar após 3 segundos
        setTimeout(function(){
            window.location.href = 'principal.jsp';  // Redireciona para a página principal
        }, 3000); // 3000 milissegundos = 3 segundos
    </script>
</head>
<body>

<%
    String usuario = request.getParameter("Usuario");
    String senha = request.getParameter("Senha");

    if (usuario != null && !usuario.trim().isEmpty()) {
        if ("12345".equals(senha)) {
%>
            <h2>Seja bem-vindo, <%= usuario %>!</h2>
            <p>Aguarde enquanto redirecionamos para a página principal...</p>
<%
        } else {
%>
            <p style="color:red;">Senha não confere.</p>
<%
        }
    } else {
%>
        <p class="error">Nenhum nome foi digitado.</p>
<%
    }
%>

<p><a href="index.html">Voltar ao formulário</a></p>

</body>
</html>
