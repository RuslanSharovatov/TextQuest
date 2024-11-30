<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Text_Quest</title>
    <link href="static/style.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.7.1.slim.min.js"/>"></script>
</head>
<body>
<div id = "quest-container">
    <c:if test="${!begin}">
    <h1 id = "quest-title">Тайны подземелья</h1>
    <h2 id = "quest-text">В древние времена, когда магия и рыцарство были неотъемлемой частью жизни, ходили легенды о подземелье, скрывающем несметные богатства. Говорят, что те, кто осмеливался войти внутрь, сталкивались не только с хитроумными ловушками, но и с магическими существами, охраняющими тайны прошлого.
        Тебе, молодому искателю приключений, повезло узнать об этом месте из старого дневника, найденного в заброшенной библиотеке. Листая пожелтевшие страницы, ты узнал, что подземелье находится недалеко от твоего родного города. Твоя цель — найти легендарный золотой амулет, который, по слухам, может исполнить любое желание.
        Охваченный духом авантюризма, ты собрал всё, что мог: факел, верёвку, нож, немного еды и воды. И вот ты стоишь у мрачного каменного входа. Тяжёлые каменные плиты с высеченными на них древними рунами выглядят пугающе, но манят своей загадочностью.
    </h2>
    <button type = "button" class="choice" onclick = selectOption("begin")>Начать</button>
    </c:if>
    <c:if test = "${win == true || dead == true}">
        <button type = "button" class = "choice" onclick="restart()">Начать заново</button>
    </c:if>
    <c:if test = "${begin == true}">
        <h2 id = "quest-text">
            Ты стоишь у входа в древнее подземелье, скрывающее загадочные сокровища. Легенды гласят, что только смелый и мудрый сможет выбраться оттуда живым. В руке у тебя факел, в сумке — верёвка и небольшой нож. Ты заходишь внутрь?
        </h2>
    </c:if>
</div>

<script>
    function restart() {
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function() {
                location.reload();
            }
        });
    }

    function selectOption(action) {
        $.ajax({
            url: '/start',
            type: POST,
            data: { action: action },
            success: function() {
            location.reload();
        }
        })
    }
    </script>
</body>
</html>
