<%-- 
    Document   : index
    Created on : May 26, 2013, 11:40:07 PM
    Author     : mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuración de Pruebas</title>
    </head>
    <body>
        <h1>Pruebas de Rendimiento</h1>
        <label>Usuarios registrados en la BD: </label> 1
        <br>
        <label>Compras registradas: </label> 1
        <br>
        <label>Cantidad de productos comprados: </label> 4
        <br>
        <label>Empresas registradas: </label> 100
        <br>
        <label>Promociones registradas: </label> 100
        <br>
        <label>Productos registrados: </label> 5000
        <br>
        <label>Premios registrados: </label> 3000
        <spring:url value="pruebas/llenardatos.html" var="actionllenardatos" />
        <form:form modelAttribute="prueba" method="post" action="${actionllenardatos}">
            <fieldset>
                <legend>Llenado de datos</legend>
                <form:label path="totalEmpresas">Empresas: </form:label>
                <form:input path="totalEmpresas" title="Cantidad de empresas que se agregan a la base" />
                <br>
                <form:label path="promocionesPorEmpresa">Promociones por empresa: </form:label>
                <form:input path="promocionesPorEmpresa" title="Cantidad de Promociones que va a tener cada empresa"/>
                <br>
                <form:label path="premiosPorPromocion">Premios por promocion</form:label>
                <form:input path="premiosPorPromocion" title="Premios que va a tener cada promocion"/>
                <br>
                <form:label path="productosPorPromocion">Productos por promocion</form:label>
                <form:input path="productosPorPromocion" title="Productos que va a tener cada promocion"/>
                <br>
                <form:button>Llenar Base de Datos</form:button>
            </fieldset>
        </form:form>
    </body>
</html>
