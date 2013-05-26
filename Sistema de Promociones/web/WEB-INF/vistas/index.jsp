<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Promociones</title>
    </head>

    <body>
        <h1>Bienvenido</h1>
        <h2>Ver puntos de cliente</h2>
        <spring:url value="/cliente/buscarporid.html" var="action" />
        <spring:url value="/pruebas.html" var="pruebas" />
        <form action="${action}" method="get">
            <label>Identificación del Cliente: </label>
            <input type="text" name="identificacion" id="identificacion" value=""
                   title="Digite la identificación del cliente.">
            <input type="submit" value="Buscar"
                   title="Busca los puntos que ha ganado un cliente con cierta identificación.">
        </form>
        <br>
        <ul>
            <li>
                <a href="${pruebas}" title="Desde aquí podrá configurar las pruebas y ejecutarlas.">Módulo de pruebas</a>
            </li>
        </ul>
    </body>
</html>
