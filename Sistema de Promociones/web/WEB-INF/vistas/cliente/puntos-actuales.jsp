<%-- 
    Document   : puntos-actuales
    Created on : May 26, 2013, 4:37:44 PM
    Author     : Mario Retana Rojas <201029799>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puntos actuales del Cliente</title>
    </head>
    <body>
        <h1><c:choose>
                <c:when test="${cliente == null}">
                    Cliente no encontrado
                </c:when>
                <c:otherwise>
                    Puntos de <c:out value="${cliente.nombre} ${cliente.apellido1} ${cliente.apellido2}" />
                </c:otherwise>
            </c:choose>
        </h1>
        <c:if test="${cliente != null}">
            <table>
                <tr>
                    <th>Empresa</th>
                    <th>Promoción</th>
                    <th>Puntos</th>
                </tr>
                <c:forEach var="info" items="${cliente.puntos}">
                    <tr>
                        <td>${info.nombreEmpresa}</td>
                        <td>${info.nombrePromocion}</td>
                        <td>${info.cantidad}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
