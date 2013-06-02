<%-- 
    Document   : puntos-actuales
    Created on : May 26, 2013, 4:27:44 PM
    Author     : Mario Retana Rojas <201029799>
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%int i = 1;//usada para enumeracion de resultados%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de pruebas</title>
    </head>
    <body>
        <h1>
            Reporte de resultados
        </h1>
        <table>
            <tr>
                <th>Tiempo</th>
                <th>Duración en nanosegundos</th>
                <th>Duración en milisegundos</th>
                <th>Duración en segundos</th>
            </tr>
            <tr>
                <td>Tiempo más largo</td>
                <td>${reporte.tiempoMasLargo} ns</td>
                <td>${reporte.tiempoMasLargo / 1000000} ms</td>
                <td>${reporte.tiempoMasLargo / 1000000000} s</td>
            </tr>
            <tr>
                <td>Tiempo más corto</td>
                <td>${reporte.tiempoMasCorto} ns</td>
                <td>${reporte.tiempoMasCorto / 1000000} ms</td>
                <td>${reporte.tiempoMasCorto / 1000000000} s</td>
            </tr>
            <tr>
                <td>Tiempo promedio</td>
                <td>${reporte.tiempoPromedio} ns</td>
                <td>${reporte.tiempoPromedio / 1000000} ms</td>
                <td>${reporte.tiempoPromedio / 1000000000} s</td>
            </tr>
        </table>
        <br>
        <spring:url value="/pruebas/reporte/exportar.html" var="exportarexcel" />
        <form method="post" action="${exportarexcel}" >
            <input type="submit" value="Descargar reporte"/>
        </form>
        <br>
        <table>
            <tr>
                <th>Todos los tiempos</th>
            </tr>
            <c:forEach var="tiempo" items="${reporte.duracionesConsulta}">
                <tr>
                    <td>Consulta <%=i %> duró ${tiempo} nanosegundos</td>
                    <%i++;%>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
