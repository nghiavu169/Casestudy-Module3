<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 28/09/2020
  Time: 8:13 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table cellpadding="2" cellspacing="2" border="1">
    <tr>
        <th>Option</th>
        <th>Id</th>
        <th>Name</th>
        <th>Photo</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Sub Total</th>
    </tr>
    <c:set var="total" value="0"></c:set>
    <c:forEach var="item" items="${sessionScope.cart }">
        <c:set var="total" value="${total + item.price * item.quantity }"></c:set>
        <tr>
            <td align="center">
                <a href="${pageContext.request.contextPath }/cart?action=remove&id=${item.watch.id }"
                   onclick="return confirm('Are you sure?')">Remove</a>
            </td>
            <td>${item.watch.id }</td>
            <td>${item.watch.name }</td>
            <td>
                <img src="${pageContext.request.contextPath }/Image/${item.watch.img }" width="120">
            </td>
            <td>${item.watch.price }</td>
            <td>${item.quantity }</td>
            <td>${item.watch.price * item.quantity }</td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="6" align="right">Total</td>
        <td>${total}</td>
    </tr>
</table>
<br>
<a href="${pageContext.request.contextPath }/watches">Continue Shopping</a>
</body>
</html>
