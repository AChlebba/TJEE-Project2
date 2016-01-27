<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Sklep</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">Strona głowna</a></li>
      <li><a href="${pageContext.request.contextPath}/player/addPlayer.jsp">Dodaj klienta</a></li>
      <li><a href="${pageContext.request.contextPath}/player/showPlayers.jsp">Pokaz wszystkich</a></li> 
    </ul>
  </div>
</nav>
