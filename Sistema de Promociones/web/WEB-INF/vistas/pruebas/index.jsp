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
        <label>Usuarios registrados en la BD: </label> ${reporte.clientesRegistrados}
        <br>
        <label>Compras registradas: </label> ${reporte.comprasRegistradas}
        <br>
        <label>Cantidad de productos comprados: </label> ${reporte.productosComprados}
        <br>
        <label>Empresas registradas: </label> ${reporte.empresasRegistradas}
        <br>
        <label>Promociones registradas: </label> ${reporte.promocionesRegistradas}
        <br>
        <label>Productos registrados: </label> ${reporte.productosRegistrados}
        <br>
        <label>Premios registrados: </label> ${reporte.premiosRegistrados}
        <br>
        <br>
        <spring:url value="pruebas/llenardatos.html" var="actionllenardatos" />
        <spring:url value="pruebas/borrardatos.html" var="borrardatos" />
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
                <form:label path="clientesPorRegistrar">Clientes por registrar: </form:label>
                <form:input path="clientesPorRegistrar" title="Cantidad de clientes que se registran en la base"/>
                <br>
                <form:label path="maxCompras">Cantidad maxima de compras por cliente: </form:label>
                <form:input path="maxCompras" title="Cada cliente hace entre 1 y el maximo de compras"/>
                <br>
                <form:label path="maxProductosComprados">Cantidad maxima de productos del mismo tipo: </form:label>
                <form:input path="maxProductosComprados" title="Cada cliente compra hasta este maximo de productos del mismo tipo en sus compras"/>
                <br>
                <form:button>Llenar Base de Datos</form:button> <a href="${borrardatos}" title="Esta accion no se puede deshacer">Borrar datos de la base</a>
            </fieldset>
        </form:form>
    </body>
</html>
