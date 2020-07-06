<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/styles/gamePage.css">
<title>Hangman</title>
</head>
<body>
	<div class="title">
		<p class="gameTitle"> Hangman </p>
	</div>
			<br/>
			<br/>
		<p> Guess the word! </p>
			<br/>
		<div class="hiddenWord">
			<c:set var="myLetters" value="${game.hiddenLettersList}"/>
			<c:forEach var="letter" items="${myLetters}">
				<c:out value="${letter}"/>
			</c:forEach>
			<br/>
			<br/>
			<p>Attempts left: ${game.attemptsLeft}</p>
		</div>
		<br/>
		<div class="cheat">
			<form class="cheatButton" method="POST" action="${game.id}/real-word">
				<button type="submit" class="btn btn-success">${game.wordReveal}</button>
			</form>
		</div>

		<div class="holder">
			<form class="buttons" method="POST">
				<!-- праща към същият път, когато не е уточнено специфично  -->
				<!-- Value-то на бутона се подава като RequestParam при заявката, затова го улавяме
				ч/з @RequestParam в контролера по името му letter -->
				<c:set var="alphabet" value="${game.unusedLetters}"/>
				<c:forEach var="unusedLetter" items="${alphabet}">
					<input type="submit" name="letter" value="${unusedLetter}"/>
				</c:forEach>
			</form>
		</div>
</body>
</html>