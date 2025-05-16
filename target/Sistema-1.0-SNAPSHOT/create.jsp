<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Criar Registro</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="form-container">
        <h2>Criar Novo Registro</h2>
        <form action="CreateAction.jsp" method="POST">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required><br><br>

            <label for="email">E-mail:</label>
            <input type="email" id="email" name="email" required><br><br>

            <input type="submit" value="Criar">
        </form>
        <br><br>
        <a href="principal.jsp" class="btn-voltar">Voltar</a>

    </div>

</body>
</html>
