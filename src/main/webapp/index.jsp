<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Text_Quest</title>
    <link href="static/style.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page session="true" %>
    <%@ page isELIgnored="false" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
</head>
<body>
<div id = "quest-container">
    <c:if test = "${!sessionScope.start}">
        <h1 id = "quest-title">Тайны подземелья</h1>
        <h2 id = "quest-text">В древние времена, когда магия и рыцарство были неотъемлемой частью жизни, ходили легенды о подземелье, скрывающем несметные богатства. Говорят, что те, кто осмеливался войти внутрь, сталкивались не только с хитроумными ловушками, но и с магическими существами, охраняющими тайны прошлого.
            Тебе, молодому искателю приключений, повезло узнать об этом месте из старого дневника, найденного в заброшенной библиотеке. Листая пожелтевшие страницы, ты узнал, что подземелье находится недалеко от твоего родного города. Твоя цель — найти легендарный золотой амулет, который, по слухам, может исполнить любое желание.
            Охваченный духом авантюризма, ты собрал всё, что мог: факел, верёвку, нож, немного еды и воды. И вот ты стоишь у мрачного каменного входа. Тяжёлые каменные плиты с высеченными на них древними рунами выглядят пугающе, но манят своей загадочностью.
        </h2>
        <button type = "button" class="choice" onclick = "selectOption('start')">Начать</button>
    </c:if>

    <c:if test = "${sessionScope.start && sessionScope.choice == ''}">
        <h1 id = "quest-title">
            Начало пути
        </h1>
        <h2 id = "quest-text">
            Ты стоишь у входа в древнее подземелье, скрывающее загадочные сокровища. Легенды гласят, что только смелый и мудрый сможет выбраться оттуда живым. В руке у тебя факел, в сумке — верёвка и небольшой нож. Ты заходишь внутрь?
        </h2>
        <button type = "button" class="choice" onclick="selectOption('brave')">Да, я войду.</button>
        <button type = "button" class="choice" onclick="selectOption('noBrave')">Нет, я ухожу.</button>
    </c:if>

    <c:if test = "${sessionScope.choice == 'coward'}">
        <h1 id = "quest-title">
            Конец
        </h1>
        <h2 id = "quest-text">
            Ты избежал опасности, но потерял шанс на славу.
        </h2>
        <button type="button" class="choice" onclick="restart()">Начать заново</button>
    </c:if>

    <c:if test="${sessionScope.choice == 'brave'}">
        <h1 id = quest-title>
            В подземелье
        </h1>
        <h2 id = "quest-text">
            Ты заходишь внутрь. Узкий коридор уходит в темноту. Внезапно ты слышишь шорохи. Перед тобой — три пути:
        </h2>
        <button type="button" class="choice" onclick="selectOption('directly')">Идти прямо.</button>
        <button type="button" class="choice" onclick="selectOption('left')">Идти налево.</button>
        <button type="button" class="choice" onclick="selectOption('right')">Идти направо.</button>
    </c:if>

    <c:if test="${sessionScope.choice == 'directly'}">
        <h1 id = quest-title>
            Путь прямо
        </h1>
        <h2 id = "quest-text">
            Ты видишь сверкающий сундук. Открыв его, ты находишь золотой амулет. Внезапно стены начинают сдвигаться, пытаясь раздавить тебя.
        </h2>
        <button type="button" class="choice" onclick="selectOption('drop')">Бросить амулет и бежать.</button>
        <button type="button" class="choice" onclick="selectOption('exit')">Найти выход.</button>
    </c:if>

    <c:if test="${sessionScope.choice == 'exit'}">
        <h1 id = quest-title>
            Сокровище найдено!
        </h1>
        <h2 id = "quest-text">
            Ты находишь узкий проход и успеваешь выбраться. Ты находишь выход из подземелья. Ты доказал свою смелость и выжил. Ты покидаешь подземелье с амулетом, став героем.
        </h2>
        <button type="button" class="choice" onclick="restart()">Начать заново</button>
    </c:if>

    <c:if test="${sessionScope.choice == 'left'}">
        <h1 id = quest-title>
            Путь налево
        </h1>
        <h2 id = "quest-text">
            Ты попадаешь в комнату, где на полу сверкает золотая монета. Когда ты поднимаешь её, с потолка начинает падать песок, заполняя комнату.
        </h2>
        <button type="button" class="choice" onclick="selectOption('run')">Бежать назад.</button>
        <button type="button" class="choice" onclick="selectOption('search')">Искать скрытый выход.</button>
    </c:if>

    <c:if test="${sessionScope.choice == 'search'}">
        <h1 id = quest-title>
            Конец
        </h1>
        <h2 id = "quest-text">
            Ты нашёл рычаг, но он был ловушкой. Ты остался навеки погребенным под толстым слоем песка. Ты проиграл.
        </h2>
        <button type="button" class="choice" onclick="restart()">Начать заново</button>
    </c:if>

    <c:if test="${sessionScope.choice == 'right'}">
        <h1 id = quest-title>
            Путь направо
        </h1>
        <h2 id = "quest-text">
            Ты входишь в просторный зал, в центре которого сидит скелет с мечом. Он медленно поднимается и направляется к тебе.
        </h2>
        <button type="button" class="choice" onclick="selectOption('fight')">Броситься в бой.</button>
        <button type="button" class="choice" onclick="selectOption('escape')">Попытаться убежать.</button>
    </c:if>

    <c:if test="${sessionScope.choice == 'fight'}">
        <h1 id = quest-title>
            Ранен, но жив!
        </h1>
        <h2 id = "quest-text">
            Ты побеждаешь скелета, но получаешь ранения. Ты выжил, но не нашел сокровища. Возможно, это был лишь тренировочный бой.
        </h2>
        <button type="button" class="choice" onclick="restart()">Начать заново</button>
    </c:if>

    <c:if test="${sessionScope.choice == 'escape'}">
        <h1 id = quest-title>
            Конец
        </h1>
        <h2 id = "quest-text">
            Скелет догнал тебя. Последнее, что ты увидел - пустые глазницы скелета, смотрящие тебе прямо в душу. Ты проиграл.
        </h2>
        <button type="button" class="choice" onclick="restart()">Начать заново</button>
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
            type: 'POST',
            data: { action: action },
            success: function() {
            location.reload();
        }
        })
    }
    </script>
</body>
</html>
