<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="content-type" content="text/html; charset=utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <!-- JavaScript file included -->
            <%-- <script src="${contextRoot}/js/jquery-3.6.1.min.js">
                </script> --%>
                <style>
                    #main {
                        width: 310px;
                        height: 550px;
                        border: 1px solid black;
                        right: 10px;
                        bottom: 200px;
                        position: fixed;
                        float: right;
                        display: none;
                        background-color: white;
                    }

                    .gameAll {
                        float: right;
                        right: 10px;
                        bottom: 200px;
                        position: fixed;

                    }

                    .gameox>li {
                        box-sizing: border-box;
                        float: left;
                        width: 60px;
                        height: 60px;
                        margin-left: -4px;
                        /* margin-top: -4px; */
                        line-height: 100px;
                        text-align: center;
                        list-style: none;
                        border: 4px solid rgb(237, 240, 244);
                        position: relative;
                        top: 20px;


                    }

                    .Allgame {
                        width: 300px;
                        height: 100px;
                        border: 1px solid black;
                        border-radius: 20px 20px 20px 20px;
                        float: right;
                        right: 30px;
                        bottom: 200px;
                        position: fixed;
                        display: none;
                    }

                    .gameox>li:hover {
                        border-color: blue;
                        position: absolute;
                    }

                    .gameClose {
                        top: 10px;
                        right: 10px;
                        position: absolute;
                    }

                    .friendGame {
                        border: 1px solid black;
                        border-radius: 10px 10px;
                        width: 300px;
                    }

                    .friendGame>li:hover {
                        background-color: aqua;
                        width: 80px;
                    }

                    .onlineFriend {
                        display: none;
                        right: 30px;
                        bottom: 200px;
                        float: right;
                        position: fixed;
                    }








                    /* 小精靈 */
                    .pac-man {
                        position: fixed;
                        bottom: 200px;
                        right: 100px;
                        float: right;
                        z-index: 9999;
                        display: none;
                    }

                    .half {
                        width: 50px;
                        height: 25px;
                        overflow: hidden;
                        animation: rotate 1s ease infinite;
                        transform-origin: 50% 100%;
                    }

                    .half-bottom {
                        transform-origin: 50% 0%;
                        animation: rotate-bottom 1s ease infinite;
                    }

                    .circle {
                        width: 50px;
                        height: 50px;
                        background: orange;
                        border-radius: 50%;

                    }

                    .bottom {
                        transform: translateY(-50%);
                    }

                    .little-circle {
                        width: 10px;
                        height: 10px;
                        background: orange;
                        border-radius: 50%;
                        position: absolute;
                        top: 50%;
                        left: 150px;
                        transform: translateY(-50%);
                    }

                    .little-circle:nth-of-type(3) {
                        animation: walk-left 1s infinite linear;
                    }

                    .little-circle:nth-of-type(4) {
                        animation: walk-left 1s infinite linear 0.5s;
                    }


                    @keyframes rotate {
                        0% {
                            transform: rotate(0deg);
                        }

                        50% {
                            transform: rotate(-45deg);
                        }

                        100% {
                            transform: rotate(0deg);
                        }
                    }

                    @keyframes rotate-bottom {
                        0% {
                            transform: rotate(0deg);
                        }

                        50% {
                            transform: rotate(45deg);
                        }

                        100% {
                            transform: rotate(0deg);
                        }
                    }

                    @keyframes walk-left {
                        0% {
                            opacity: 0;
                        }

                        100% {
                            left: 15px;
                            opacity: 1;
                        }
                    }
                </style>
        </head>

        <body>

            <div class="gameAll" onclick="allgame()">

                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                    class="bi bi-controller" viewBox="0 0 16 16">
                    <path
                        d="M11.5 6.027a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-1.5 1.5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm2.5-.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-1.5 1.5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm-6.5-3h1v1h1v1h-1v1h-1v-1h-1v-1h1v-1z" />
                    <path
                        d="M3.051 3.26a.5.5 0 0 1 .354-.613l1.932-.518a.5.5 0 0 1 .62.39c.655-.079 1.35-.117 2.043-.117.72 0 1.443.041 2.12.126a.5.5 0 0 1 .622-.399l1.932.518a.5.5 0 0 1 .306.729c.14.09.266.19.373.297.408.408.78 1.05 1.095 1.772.32.733.599 1.591.805 2.466.206.875.34 1.78.364 2.606.024.816-.059 1.602-.328 2.21a1.42 1.42 0 0 1-1.445.83c-.636-.067-1.115-.394-1.513-.773-.245-.232-.496-.526-.739-.808-.126-.148-.25-.292-.368-.423-.728-.804-1.597-1.527-3.224-1.527-1.627 0-2.496.723-3.224 1.527-.119.131-.242.275-.368.423-.243.282-.494.575-.739.808-.398.38-.877.706-1.513.773a1.42 1.42 0 0 1-1.445-.83c-.27-.608-.352-1.395-.329-2.21.024-.826.16-1.73.365-2.606.206-.875.486-1.733.805-2.466.315-.722.687-1.364 1.094-1.772a2.34 2.34 0 0 1 .433-.335.504.504 0 0 1-.028-.079zm2.036.412c-.877.185-1.469.443-1.733.708-.276.276-.587.783-.885 1.465a13.748 13.748 0 0 0-.748 2.295 12.351 12.351 0 0 0-.339 2.406c-.022.755.062 1.368.243 1.776a.42.42 0 0 0 .426.24c.327-.034.61-.199.929-.502.212-.202.4-.423.615-.674.133-.156.276-.323.44-.504C4.861 9.969 5.978 9.027 8 9.027s3.139.942 3.965 1.855c.164.181.307.348.44.504.214.251.403.472.615.674.318.303.601.468.929.503a.42.42 0 0 0 .426-.241c.18-.408.265-1.02.243-1.776a12.354 12.354 0 0 0-.339-2.406 13.753 13.753 0 0 0-.748-2.295c-.298-.682-.61-1.19-.885-1.465-.264-.265-.856-.523-1.733-.708-.85-.179-1.877-.27-2.913-.27-1.036 0-2.063.091-2.913.27z" />
                </svg>
            </div>


            <div class="Allgame" onclick="showFriend()">
                <ul class="gameox">
                    <li>
                        <img src="${contextRoot}/images/gameox.png" width="50" height="50"
                            style="position:absolute;left:0px">
                    </li>
                </ul>
            </div>
            <div class="onlineFriend">
                <p>在線好友</p>
                <ul class="friendGame">

                </ul>

            </div>
            <div id="main">




                <!-- Space to show player turn -->
                <p id="player"></p>


                <div id="game">
                    <div class="gameClose" onclick="closeMain()"><svg xmlns="http://www.w3.org/2000/svg" width="30"
                            height="30" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                            <path
                                d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
                        </svg></div>
                    <canvas id="canvas" width="300" height="300"></canvas>
                </div>

                <!-- Grid end here -->
                <br>

                <!-- Button to reset game -->
                <button id="but" onclick="reset()">
                    重新開始
                </button>


                <!-- Space to show player turn -->
                <p id="print2"></p>


                <!-- Space to show player turn -->
                <p id="print"></p>



            </div>
            <div class="pac-man" id="smallpac">
                <div style="bottom:50px;position:relative;font-size: large;color: mediumpurple;" id="waitText">等待中</div>
                <div class="pac-man">

                    <div class="half">
                        <div class="circle"></div>
                    </div>

                    <div class="half half-bottom">
                        <div class="circle bottom"></div>
                    </div>

                    <div class="little-circle"></div>
                    <div class="little-circle"></div>

                </div>
            </div>








            <script>
                function allgame() {
                    $(".gameAll").hide()
                    $(".Allgame").show();
                    onlineFriendList()

                }
                function onlineFriendList() {
                    fetch("${contextRoot}/friendlist", {
                        method: "GET"

                    }).then(function (result) {
                        return result.json()
                    }).then(function (data) {
                        console.log("${loginUser.id}")
                        console.log(data)
                        let friend = "";
                        $.each(data, function (index, friendFile) {
                            if (friendFile.fuid.id == "${loginUser.id}") {


                                let dataMessage = {};

                                dataMessage["from"] = "${loginUser.account}";
                                dataMessage["to"] = 4;
                                dataMessage["text"] = friendFile.userid.account;

                                // console.log("AAA", JSON.stringify(data))
                                websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据

                                setTimeout(function () {
                                    if (onlineFriendSocket == friendFile.userid.account) {
                                        console.log("userid", friendFile.userid.account)
                                        console.log("web1", onlineFriendSocket)

                                        onlineFriendSocket = "";
                                        friend = "<li style='list-style: none;' id='" + friendFile.userid.account + "' onclick='gameCallFriend(this)'><img src='" + friendFile.userid.avator + "'style='width:30px;height:30px;border-radius:15px'><span>" + friendFile.userid.name + "</span></li><hr style='width:200px'>"
                                        console.log(friend)
                                        $(".friendGame").append(friend)
                                    }
                                }, 500);

                            } else if (friendFile.userid.id == "${loginUser.id}") {

                                let dataMessage = {};

                                dataMessage["from"] = "${loginUser.account}";
                                dataMessage["to"] = 4;
                                dataMessage["text"] = friendFile.fuid.account;

                                // console.log("AAA", JSON.stringify(data))
                                websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据

                                setTimeout(function () {
                                    if (onlineFriendSocket == friendFile.fuid.account) {
                                        console.log("web2", onlineFriendSocket)
                                        console.log("userid2", friendFile.fuid.account)
                                        onlineFriendSocket = "";
                                        friend = "<li style='list-style: none;' id='" + friendFile.fuid.account + "'onclick='gameCallFriend(this)'><img src='" + friendFile.fuid.avator + "'style='width:30px;height:30px;border-radius:15px'><span>" + friendFile.fuid.name + "</span></li><hr style='width:200px'>"
                                        console.log(friend)
                                        $(".friendGame").append(friend)
                                    }
                                }, 500);

                            }
                            // console.log(friend)
                        })
                        // console.log("friend", friend)
                        // $(".friendGame").append(friend)

                    })
                }
                function gameCallFriend(callFriend) {
                    let dataMessage = {};
                    dataMessage["type"] = 3
                    dataMessage["from"] = "${loginUser.account}";
                    dataMessage["to"] = callFriend.id;
                    dataMessage["text"] = "${loginUser.name}";
                    // dataMessage["messageId"] = messageId;
                    // console.log("AAA", JSON.stringify(dataMessage))

                    websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据

                    $(".pac-man").show();
                    $(".friendGame").empty();
                    $(".onlineFriend").hide();
                }


                function showFriend() {
                    $(".Allgame").hide();
                    $(".onlineFriend").show();
                }


                function showMain() {

                    $("#main").show();
                    init();
                }





                function closeMain() {
                    $("#main").hide();
                    $(".gameAll").show();
                    clear()
                    webSocketgame.close();
                }






                // Function called whenever user tab on any box
                player = "";
                turn = "";
                gameover = "NO";
                // Function to reset game
                function reset() {
                    message = "reset";
                    webSocketgame.send(message);
                    message = "turn-X";
                    webSocketgame.send(message);
                }
                function reset2() {
                    clear();
                    drawboard();
                    gameover = "NO";
                    document.getElementById("print2")
                        .innerHTML = "遊戲開始, 請開始放置棋子";
                }

                // Here onwards, functions check turn of the player
                // and put accordingly innerText X or O
                flag = 1;
                function place(id) {
                    if (gameover === "NO") {
                        if (flag === 1) {
                            if (document.getElementById(id).innerText === "") {
                                document.getElementById(id).innerText = "X";
                                flag = 0;
                            }
                        } else {
                            if (document.getElementById(id).innerText === "") {
                                document.getElementById(id).innerText = "O";
                                flag = 1;
                            }
                        }
                    }
                    check();
                }
                function place2(id) {
                    if (gameover === "NO") {
                        if (turn === player) {
                            if (document.getElementById(id).innerText === "") {
                                message = "place-" + id + "-" + player;
                                webSocketgame.send(message);
                            }
                        }
                    }
                }

                //function place3(id, player) {
                //        document.getElementById(id).innerText = player;
                //check();
                //}

                function getRootUri() {
                    return "ws://" + (document.location.hostname == "" ? "localhost" : document.location.hostname) + ":" +
                        (document.location.port == "" ? "8080" : document.location.port);
                }

                function init() {
                    output = document.getElementById("output");
                    webSocketgame = new WebSocket(getRootUri() + "/tictactoe/${loginUser.name}");
                    console.log(webSocketgame)
                    webSocketgame.onopen = function (evt) {
                        onOpen(evt)
                    };
                    webSocketgame.onmessage = function (evt) {
                        onMessage(evt)
                    };
                    webSocketgame.onerror = function (evt) {
                        onError(evt)
                    };
                }

                function onMessage(evt) {

                    console.log(evt.data);
                    // console.log(evt.data.to);
                    if (evt.data == "roomfull") {
                        document.getElementById("print")
                            .innerHTML = "遊戲玩家已滿";
                        webSocketgame.close(-1);
                    }
                    if (evt.data == "reset") {
                        reset2();
                    }
                    if (evt.data == "wait") {
                        //window.alert("Waiting for Second Player");
                        document.getElementById("print2")
                            .innerHTML = "等待第二個玩家";

                    }
                    if (evt.data == "start") {
                        reset();
                    }



                    // if (evt.data.to === "xwon") {
                    //     document.getElementById("print2")
                    //         .innerHTML = "玩家" + data.text + "赢了";

                    // }
                    // if (evt.data == "owon") {
                    //     document.getElementById("print2")
                    //         .innerHTML = "玩家O赢了";

                    // }
                    if (evt.data == "tie") {
                        document.getElementById("print2")
                            .innerHTML = "平局";

                    }
                    if (evt.data.indexOf("leave") != -1) {
                        //window.alert(evt.data);
                        words = evt.data.split("-");
                        //window.alert(words[1]);
                        player = words[1];
                        //window.alert(player);
                        document.getElementById("print2")
                            .innerHTML = "對方已離開遊戲,請退出遊戲";
                    }
                    // .innerHTML = "玩家" + player + "已离开游戏,请退出游戏";

                    if (evt.data.indexOf("player") != -1) {
                        //window.alert(evt.data);
                        words = evt.data.split("-");
                        //window.alert(words[1]);
                        player = words[1];
                        //window.alert(player);
                        document.getElementById("player")
                            .innerHTML = "你是玩家" + player;
                    }
                    if (evt.data.indexOf("turn") != -1) {
                        //window.alert(evt.data);
                        words = evt.data.split("-");
                        //window.alert(words[1]);
                        turn = words[1];
                        //window.alert(turn);
                        document.getElementById("print")
                            .innerHTML = "當前由玩家" + turn + "放置棋子";
                    }
                    if (evt.data.indexOf("place") != -1) {
                        //window.alert(evt.data);
                        words = evt.data.split("-");
                        //window.alert(words[1]);
                        place3(words[1], words[2]);
                    }
                    if (evt.data.indexOf("gameover") != -1) {
                        //window.alert(evt.data);
                        words = evt.data.split("-");
                        //window.alert(words[1]);
                        gameover = words[1];
                        //window.alert(turn);
                        document.getElementById("print")
                            .innerHTML = "遊戲结束！";
                    }
                    if (typeof evt.data == 'string') {
                        try {
                            var obj = JSON.parse(evt.data);
                            if (typeof obj == 'object' && obj) {
                                if (obj.to == "xwon") {
                                    if (obj.text == "${loginUser.name}") {
                                        document.getElementById("print2")
                                            .innerHTML = "你赢了";
                                    } else {
                                        document.getElementById("print2")
                                            .innerHTML = "玩家" + obj.text + "赢了";
                                    }


                                } else if (obj.to == "owon") {
                                    if (obj.text == "${loginUser.name}") {
                                        document.getElementById("print2")
                                            .innerHTML = "你赢了";
                                    } else {
                                        document.getElementById("print2")
                                            .innerHTML = "玩家" + obj.text + "赢了";
                                    }
                                }
                            } else {
                                return false;
                            }
                        } catch (e) {
                            return false;
                        }
                    }
                }

                function onOpen(evt) {
                }
                function onError(evt) {
                }



                players = 2;
                cell_count = 3;
                winCount = 3;
                cell_size = 100;
                size = cell_size * cell_count;


                var canvas = document.getElementById('canvas');
                canvas.width = size;
                canvas.height = size;

                canvas.addEventListener('click', click, false);


                var ctx = canvas.getContext('2d');

                ctx.imageSmoothingEnabled = false;
                ctx.lineWidth = 3;


                function clear() {
                    ctx.clearRect(0, 0, canvas.width, canvas.height);
                }

                function line(x, y, w, h, color = '#ccc') {
                    ctx.beginPath();
                    ctx.moveTo(x, y);
                    ctx.lineTo(x + w, y + h);
                    ctx.strokeStyle = color;
                    ctx.stroke();
                    ctx.closePath();
                }

                function click(e) {
                    if (gameover === "NO") {
                        if (turn === player) {
                            i = e.offsetX / cell_size | 0;
                            j = e.offsetY / cell_size | 0;
                            id = "";
                            if (i == 0 && j == 0) {
                                id = "b1";
                            }
                            if (i == 1 && j == 0) {
                                id = "b2";
                            }
                            if (i == 2 && j == 0) {
                                id = "b3";
                                ;
                            }
                            if (i == 0 && j == 1) {
                                id = "b4";
                            }
                            if (i == 1 && j == 1) {
                                id = "b5";
                            }
                            if (i == 2 && j == 1) {
                                id = "b6";
                            }
                            if (i == 0 && j == 2) {
                                id = "b7";
                            }
                            if (i == 1 && j == 2) {
                                id = "b8";
                            }
                            if (i == 2 && j == 2) {
                                id = "b9";
                            }
                            message = "place-" + id + "-" + player;
                            webSocketgame.send(message);
                        }
                    }
                }
                function place3(id, player) {
                    i = 0;
                    j = 0;
                    if (id === "b1") {
                        i = 0;
                        j = 0;
                    }
                    if (id === "b2") {
                        i = 1;
                        j = 0;
                    }
                    if (id === "b3") {
                        i = 2;
                        j = 0;
                    }
                    if (id === "b4") {
                        i = 0;
                        j = 1;
                    }
                    if (id === "b5") {
                        i = 1;
                        j = 1;
                    }
                    if (id === "b6") {
                        i = 2;
                        j = 1;
                    }
                    if (id === "b7") {
                        i = 0;
                        j = 2;
                    }
                    if (id === "b8") {
                        i = 1;
                        j = 2;
                    }
                    if (id === "b9") {
                        i = 2;
                        j = 2;
                    }

                    if (player === "X") {
                        //             window.alert("X");
                        // draw X figure
                        color = '#3F51B5';

                        left = (i + 0.1) * cell_size;
                        up = (j + 0.1) * cell_size;
                        size = 0.8 * cell_size;
                        //            window.alert(left);
                        //            window.alert("up="+up);
                        //            window.alert(size);

                        line(left, up, size, size, color);
                        line(left + size, up, -size, size, color);
                    }
                    if (player === "O") {
                        color = '#FF5722';
                        left = (i + 0.1) * cell_size;
                        up = (j + 0.1) * cell_size;
                        size = 0.8 * cell_size;
                        ctx.beginPath();
                        ctx.arc((i + 0.5) * cell_size, (j + 0.5) * cell_size, 0.4 * cell_size, 0, Math.PI * 2, false);
                        ctx.strokeStyle = color;
                        ctx.stroke();
                        ctx.closePath();
                    }
                }

                function drawboard() {
                    for (let i = 0; i < cell_count; i++) {
                        for (let j = 0; j < cell_count; j++) {
                            left = i * cell_size;
                            up = j * cell_size;
                            size = cell_size;
                            ctx.beginPath();
                            ctx.lineWidth = "6";
                            ctx.strokeStyle = "gray";
                            ctx.rect(left, up, size, size);
                            ctx.stroke();
                        }

                    }

                }
                drawboard();


                /* window.addEventListener("load", init, false); */


            </script>
        </body>

        </html>