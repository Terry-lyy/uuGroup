<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!DOCTYPE html>
			<html lang="Zh-Hant-TW">

			<head>
				<meta charset="UTF-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Document</title>
				<link rel="stylesheet" href="${contextRoot}/css/chatStyle.css" />

				<!-- <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
				<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script> -->
				<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
				<!-- Latest compiled and minified CSS -->
				<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
					integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
					crossorigin="anonymous"></script>


				<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
				<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>

				<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
			</head>

			<body>
				<div id="onlineCount">
					<span></span>
				</div>
				<div>
					<div class="container text-center">
						<div class="row">

							<!-- <div class="chatHeight">
							                     <div class="chatImg"> 

							<a href="#" id="addClass"><img class="chatImg1"
									src="${contextRoot}/images/customer.png" /></a> 
								                     </div>  -->

							<div class="chatImg">
								<c:if test="${loginUser==null }">


									<a href="/login"><img src="${contextRoot}/images/iMessage.png"
											style="width: 65px; margin-top: 15px; flex-direction: column-reverse; position: fixed; right: 0px; bottom: 70px; z-index: 99999;" /></a>
								</c:if>
								<c:if test="${loginUser!=null }">
									<a href="#" id="addFriendTable"><img class="chatImg2"
											src="${contextRoot}/images/iMessage.png" /></a>
								</c:if>
							</div>
						</div>
						<!-- /participants/select1 -->





					</div>
				</div>





				<div class="app-wrapp">
					<div class="app-container">
						<!-- @main page view -->
						<div class="view-main">
							<div class="header-wrapp">

								<div class="app-detail">
									<div>
										<img src="${loginUser.getAvator()}" alt=""
											style="width: 90px; height: 90px; border-radius: 50%">
									</div>
									<div>${loginUser.getName()}</div>
									<div class="status">online</div>
								</div>
								<div class="wave-wrapp">
									<svg class="wave" xmlns="http://www.w3.org/2000/svg" viewBox="0 24 150 28"
										preserveAspectRatio="none">
										<defs>
											<path id="gentle-wave"
												d="m -160,44.4 c 30,0 58,-18 87.7,-18 30.3,0 58.3,18 87.3,18 30,0 58,-18 88,-18 30,0 58,18 88,18 l 0,34.5 -351,0 z" />
										</defs>
										<g class="parallax">
											<use xlink:href="#gentle-wave" x="50" y="0"
												fill="rgba(255, 255, 255, 0.48)" />
											<use xlink:href="#gentle-wave" x="50" y="3"
												fill="rgba(255, 255, 255, 0.78)" />
											<use xlink:href="#gentle-wave" x="50" y="6"
												fill="rgba(255, 255, 255, 0.8)" />
										</g>
									</svg>
								</div>
								<div id="closeFriendTable">
									<button data-widget="remove" id="removeClass1" class="chat-header-button "
										type="button">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
											fill="currentColor" class="bi bi-power" viewBox="0 0 16 19">
											<path d="M7.5 1v7h1V1h-1z" />
											<path
												d="M3 8.812a4.999 4.999 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812z" />
										</svg>
									</button>
								</div>
							</div>
							<div class="content-wrapp">
								<div class="nav-group">
									<nav id="master-nav">
										<ul>
											<li class="ac"><i class="material-icons">perm_identity</i></li>
											<li class="active"><i class="material-icons">chat_bubble_outline</i></li>
											<!-- <li><i class="material-icons">favorite_border</i></li> -->
											<li class="navClick" id="customerGroup" grouproom=""><i
													class="material-icons"><img src="${contextRoot}/images/customer.png"
														style="width: 30px; margin-bottom: 15px" /></i></li>
											<li id="active-line"></li>
										</ul>
									</nav>
								</div>

								<!-- 聯絡人好友 -->
								<div id="master-nav-items" style="margin: 0px 0px">
									<div id="item-1">

										<div class="" id="friendGroupList">
											<a href="#" class="list-group-item active">
												好友
											</a>

											<!-- <ul class="list-group"> -->
											<!-- <li id="a" class=""><a name="a" class="title">A</a>
													<ul> -->
											<!-- <li class="list-group-item " aria-current="true" style="width:100px">
													Adam
												</li>
												<li>Alex</li>
												<li>Ali</li>
												<li>Apple</li>
												<li>Arthur</li> -->
											<!-- 
													</ul>
												</li> -->
											<!-- <li id="b" class=""><a name="b" class="title">B</a>
													<ul>
														<li>Barry</li>
														<li>Becky</li>
														<li>Biff</li>



													</ul>
												</li>
												<li id="c" class=""><a name="c" class="title">c</a>
													<ul>
														<li>Calista</li>
														<li>Cathy</li>
														<li>Chris</li>
														<li>Cinderella</li>
														<li>Corky</li>
														<li>Cypher</li>
													</ul>
												</li> -->

											<!-- </ul> -->
										</div>
									</div>


									<!-- 訊息 -->
									<div id="item-2">
										<div class="messages-list">
											<ul class="touch-y" id="chatRoom">


											</ul>
										</div>
									</div>


								</div>
							</div>
						</div>


						<!-- 對方回覆 -->
						<!-- @send message view -->
						<div class="view-message" style="z-index:9999">
							<div class="status-bar">
								<div class="back-arrow">
									<i class="material-icons">navigate_before</i>
								</div>
								<div class="sender-name" id="messageTitle" grouproom=""></div>
							</div>
							<div class="messages-area" data-viewport="true">
								<ul class="touch-y" id="message" participants="" grouproom="" groupType="">
									<!-- <li class="recive" style="display:none"><img
											src="https://raw.githubusercontent.com/yousefsami/social-app-assets/master/user1.jpg"
											style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />
										<div>
											Hi dear welcome <span>12:08 PM</span>
										</div>
									</li> -->
									<!-- <li class="sent">
										<div>
											Hi how are you? <br /> what's up? <span>12:11 PM</span>
										</div>
									</li>
									<li class="sent" messageId="" style="display:none">
										<div>
											Lorem ipsum is a pseudo-Latin text used in web design,
											typography, layout, and printing in place of English to
											emphasise design elements over content <span>1:11 PM</span>
										</div>
									</li> -->
								</ul>
							</div>
							<div class="text-media-area" id="dragArea">
								<div class=message-form>
									<button id="send-message">
										<i class="material-icons">send</i>
									</button>
									<input id="message-text" type="text" placeholder="Type Something + Enter"
										groupRoom="" senderId="">
									<!-- <textarea id="message-text" type="text" placeholder="Type Something + Enter"
										groupRoom="" senderId=""></textarea> -->
								</div>
							</div>
						</div>
						<!-- -------------------- -->
						<div id="groupPeople">
							<ul class="list-group listGroupRoom">
								<li class="list-group-item disabled">成員</li>
								<li class="list-group-item"><img src="${loginUser.getAvator()}"
										style="width:30px;height:30px;border-radius:50%"><span>${loginUser.getName()}</span>
								</li>
								<!-- <li class="list-group-item">Dapibus ac facilisis in</li> -->

							</ul>
						</div>

						<div id="setButton">
							<div><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
									class="bi bi-gear" viewBox="0 0 16 16">
									<path
										d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
									<path
										d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z" />
								</svg></div>
						</div>
						<div id="chooseBackgroundColor">
							<table style="border-collapse:separate; border-spacing:10px 10px;;
							border-radius:15px 15px; background-image: linear-gradient( 135deg, #90F7EC 10%, #32CCBC 100%);">
								<tr>
									<td class="changeBackgroun"
										style="border-radius:15px 15px;width:50px;height:50px;background-image:linear-gradient( 135deg, #F6D242 10%, #FF52E5 100%); margin:30px"
										chooseColor="linear-gradient( 135deg, #F6D242 10%, #FF52E5 100%)"></td>
									<td class="changeBackgroun"
										style="border-radius:15px 15px;border:1px solid black;width:50px;height:50px;background-image:linear-gradient( 135deg, #3B2667 10%, #BC78EC 100%);margin:10px"
										chooseColor="linear-gradient( 135deg, #3B2667 10%, #BC78EC 100%)"> </td>
									<td class="changeBackgroun"
										style="border-radius:15px 15px;border:1px solid black;width:50px;height:50px;background-image:linear-gradient( 135deg, #81FFEF 10%, #F067B4 100%);margin:10px"
										chooseColor="linear-gradient( 135deg, #81FFEF 10%, #F067B4 100%)"> </td>
								</tr>
								<tr>
									<td class="changeBackgroun"
										style="border-radius:15px 15px;width:50px;height:50px;background-image:linear-gradient( 135deg, #A0FE65 10%, #FA016D 100%); margin:30px"
										chooseColor="linear-gradient( 135deg, #A0FE65 10%, #FA016D 100%)"></td>
									<td class="changeBackgroun"
										style="border-radius:15px 15px;border:1px solid black;width:50px;height:50px;background-image:linear-gradient( 135deg, #FDEB71 10%, #F8D800 100%);margin:10px"
										chooseColor="linear-gradient( 135deg, #FDEB71 10%, #F8D800 100%)"> </td>
									<td class="changeBackgroun"
										style="border-radius:15px 15px;border:1px solid black;width:50px;height:50px;background-image:linear-gradient( 135deg, #FFD26F 10%, #3677FF 100%);margin:10px"
										chooseColor="linear-gradient( 135deg, #FFD26F 10%, #3677FF 100%)"> </td>
								</tr>
							</table>
						</div>

						background-image: linear-gradient( 135deg, #FFD26F 10%, #3677FF 100%);

					</div>
				</div>
				<!-- 預覽圖片 -->
				<div id="previewDiv"></div>

				<div id="remind" class="alert alert-info alert-dismissible ">
					<button type="button" class="close" id="removeRemind">&times;</button>
					<strong>信息!</strong> 你有一則新訊息。
				</div>

				<div id="friendRemind" class="alert alert-info alert-warning " style="width:500px">
					<button type="button" class="close" id="removeFriendRemind" onclick="unacceptGameox()"
						style="right:70px">拒絕</button>
					<button type="button" class="close acceptGame" onclick="acceptGameox()" gameAccount="">接受</button>

					<strong>哈囉!</strong> 你有一個井字遊戲邀請。來自<span></span>
				</div>

				<div id="friendFileList">


				</div>

				<div class="chatimgLargeFile">
					<div class="cloes-tag" style="top:20%;right:35%"></div>
					<img>
				</div>



				<script>


					$("#setButton").click(function () {
						$("#chooseBackgroundColor").toggle("blind", {
							direction: "up"
						}, "slow");
					})
					$(".changeBackgroun").click(function () {
						let thisColor = $(this).attr("chooseColor");
						console.log(thisColor)
						$(".header-wrapp").css("background-image", thisColor)
					})

					// 客服動畫
					const getJsonMessageFile = document.querySelector("#addFriendTable");
					let viewMessage = document.querySelector("#message");
					let viewTitle = document.querySelector("#messageTitle")
					let chat = document.querySelector("#chatRoom");

					//聊天室資料載入


					getJsonMessageFile.addEventListener("click", function () {
						// $(document).ready(function () {
						//搜聊天室
						callChatRoom()
						$("#remind").hide("fold", {
							direction: "down"
						}, "slow");
					})


					function callChatRoom() {
						participantsSelect()
						// setTimeout(() => touchMessageLi(), 1200)
					}

					function touchMessageLi() {
						$(".messages-list > ul>li").click(function (e) {


							let roomId = $(this).attr("id")
							// $("#message-text").attr("groupRoom", roomId)
							// if (roomId === null) {
							// 	console.log("no")
							// } else {
							// 	console.log('roomId' + roomId)
							// 	//延遲仔入js
							groupRoom(roomId)
							$(".messages-list > ul>li").unbind();
							// }
						});
					}
					//延遲仔入js
					function groupRoom(roomId) {
						//警告
						// $("#message-text").attr("groupRoom", roomId)
						console.log("roomId" + roomId)

						//訊息介面

						fetch("${contextRoot}/participants/select1", {
							method: "GET"

						}).then(function (result) {
							return result.json()
						}).then(function (data) {
							let participantsId = [];
							let message = '';
							let messageTitle = '';
							let groomList = data.groomList;
							let memList = data.memList;
							let groupType;
							let people;
							// console.log(groomList)
							// console.log(memList)
							$.each(groomList, function (index, groupList) {

								if (groupList.groupId == roomId) {
									console.log(true)
									// message += '<div class="status-bar"><div class="back-arrow"><i class="material-icons">navigate_before</i></div>'
									if (groupList.groupType === 0) {
										groupType = 0
										$.each(groupList.participants, function (index, participants) {

											if (participants.personId != data.userId) {

												// participantsId.push(participants.personId)
												$.each(memList, function (index, member) {
													if (member.id == participants.personId) {
														messageTitle += member.name;

														participantsId.push(member.account)
														$("#message-text").attr("groupRoom", roomId)
													}
												})
											}
										})

									} else if (groupList.groupType === 1) {
										groupType = 1
										$.each(groupList.participants, function (index, participants) {
											people = groupList.participants.length
											if (participants.personId != data.userId) {
												// participantsId.push(participants.personId)
												$.each(memList, function (index, member) {
													if (member.id == participants.personId) {

														participantsId.push(member.account)
														$(".listGroupRoom").append('<li class="list-group-item groupMember"><img src="' + member.avator + '" style="width:30px;height:30px;border-radius:50%"><span>' + member.name + '</span></li>')
														$("#message-text").attr("groupRoom", roomId)
													}
												})
											}
										})
										messageTitle += groupList.groupName;
									} else if (groupList.groupType === 2) {
										//新加
										if ("${loginUser.account}" == 'admin') {
											groupType = 2
											$.each(groupList.participants, function (index, participants) {

												if (participants.personId != data.userId) {

													// participantsId.push(participants.personId)
													$.each(memList, function (index, member) {
														if (member.id == participants.personId) {
															messageTitle += member.name;

															participantsId.push(member.account)
															$("#message-text").attr("groupRoom", roomId)
														}
													})
												}
											})

										}
										groupType = 2
										$.each(groupList.participants, function (index, participants) {
											if (participants.personId != data.userId) {
												// participantsId.push(participants.personId)
												$.each(memList, function (index, member) {
													if (member.id == participants.personId) {

														participantsId.push(member.account)
													}
												})
											}
										})
										messageTitle += groupList.groupName;
									}
									// message += '<div class="messages-area" data-viewport="true"><ul class="touch-y">'

									$.each(groupList.messageText, function (index, messageContent) {
										if (messageContent.senderId != data.userId) {
											$.each(memList, function (index, member) {
												if (messageContent.senderId === member.id) {

													message += '<li class="recive" messageId="' + messageContent.messageId + '"><img src="' + member.avator + '"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />';

												}

											})
											let startTime = new Date(Date.parse(messageContent.createAt));
											let strTime = getTime(startTime);
											message += '<div><span style="display:flex">' + messageContent.messageText + '</span><span>' + strTime + '</span></div></li>';


										} else {
											let startTime = new Date(Date.parse(messageContent.createAt));
											let strTime = getTime(startTime);
											message += '<li class="sent context-menu-one" onclick="conTextM()" messageId="' + messageContent.messageId + '"><div>';
											if (messageContent.ifRead != null) {

												if (groupList.groupType === 0) {
													message += '<div class="ifReadSocket reading" style="float:left;position:absolute;color:black;bottom:1px;left:-30px">已讀</div>';
												} else if (groupList.groupType === 1) {
													// let readCount = messageContent.ifRead.length();
													let readCount = messageContent.ifRead.split(',')
													let readLength = readCount.length
													message += '<div class="ifReadSocket reading" style="float:left;position:absolute;color:black;bottom:1px;left:-37px">已讀' + readLength + '</div>';
												}
											} else {
												message += '<div class="ifReadSocket" style="float:left;position:absolute;color:black;bottom:1px;left:-37px"></div>'
											}
											message += '<span>' + messageContent.messageText + '</span><span>' + strTime + '</span></div></li>';
										}
									})
									// message += '</ul></div><div class="text-media-area"><div class=message-form><button id="send-message"><i class="material-icons">send</i></button><input id="message-text" type="text" placeholder="Type Something + Enter"></div></div></div>';
								}


							})


							viewMessage.innerHTML = message;
							//新加
							if (groupType == 1) {
								viewTitle.innerHTML = messageTitle + "(" + people + ")";
							} else {
								viewTitle.innerHTML = messageTitle
							}
							$("#message").attr("groupRoom", roomId)

							$("#message-text").attr("senderId", data.userId)
							$("#message").attr("groupType", groupType)
							// $('.sent').click(function (e) {
							// 	console.log($(this).attr("messageId"))
							// 	e.button == 2
							// })
							// console.log(participantsId)
							$("#message").attr("participants", participantsId)
							$("#messageTitle").attr("grouproom", roomId)
							let dataMessage = {};
							dataMessage["type"] = 6
							dataMessage["from"] = "${loginUser.account}";
							dataMessage["to"] = $("#message").attr("participants");
							// dataMessage["text"] = message;
							dataMessage["groupType"] = $("#message").attr("groupType");
							dataMessage["groupRoom"] = roomId;
							// console.log("AAA", JSON.stringify(data))
							websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据

						}).then(a => {
							imgLarge()
							console.log(viewMessage.scrollHeight, "hhehehehe")
							viewMessage.scrollTop = viewMessage.scrollHeight
							console.log(viewMessage.scrollTop = viewMessage.scrollHeight)
						})






						// showMessages(roomId)
						// $('.view-main').addClass("deactive");
						// $('".' + roomId + '"').addClass("active");
						setTimeout(() => showMessages(), 300)

						// setTimeout(() => controllMessage(), 1000)
						$(".back-arrow").unbind();
						setTimeout(() => backArrow(), 1000)

						let formData = new FormData();
						formData.append('groupId', roomId);

						fetch("${contextRoot}/msg/ifRead", {
							method: "POST",
							body: formData

						}).then(res => res.text()).then(res => console.log("ifif", res))


					}


					function showMessages() {
						$('.view-main').addClass("deactive");
						$('.view-message').addClass("active");
						console.log($('.sent div').removeClass('ifReadSocket'), "ifread")

					}
					//進入後返回鍵
					function backArrow() {
						$(".back-arrow").click(function (e) {
							callChatRoom()
							$("#message").empty();

							function removeMessage() {
								$('.view-main').removeClass("deactive");
								$('.view-message').removeClass("active");
							}
							setTimeout(() => removeMessage(), 300)
							$("#message").attr("participants", "")

							// navItemPos($("#master-nav ul .active").index());

							$("#messageTitle").text("");
							$("#message-text").attr("groupRoom", "")
							$("#message-text").attr("senderId", "")
							$("#message").attr("groupRoom", "")
							$("#message").attr("groupType", "")
							$("#messageTitle").attr("grouproom", "")
							$(".groupMember").remove();
						})
					}


					// function controllMessage() {

					//進入後返回鍵


					//傳送訊息enter鍵
					$("#send-message").click(function () {

						let groupRoom = $("#message-text").attr("groupRoom")
						let groupRoomId = $("#message").attr("groupRoom")
						let senderId = $("#message-text").attr("senderId")
						// console.log($("#message").attr("participants"))
						// console.log(websocket)
						// let data = {};
						// data["from"] = "${loginUser.avator}";
						// data["to"] = $("#message").attr("participants");
						// data["text"] = $("#message-text").val();
						// // console.log("AAA", JSON.stringify(data))
						// websocket.send(JSON.stringify(data)); // 使用 send() 方法发送数据
						if (groupRoom != "") {
							sendMassage(groupRoom, senderId)
						} else {
							customerServiceAuto();

						}
					});
					$(document).keyup(
						function (e) {
							if (e.which == 13
								&& $('.view-message').hasClass(
									"active")) {
								let groupRoom = $("#message-text").attr("groupRoom")
								let groupRoomId = $("#message").attr("groupRoom")
								let senderId = $("#message-text").attr("senderId")
								if (groupRoom != "") {
									sendMassage(groupRoom, senderId);
								} else {
									customerServiceAuto();
								}
							}
						})
					function sendMassage(groupRoom, senderId) {
						// console.log(groupRoom)
						// console.log(senderId)
						var date = new Date();
						var message = $("#message-text").val();
						let messageImg;
						if ($("#previewDiv").html() != null) {
							messageImg = $("#previewDiv").html();
							$("#previewDiv").html("");
							message += messageImg
						}
						//輸入歸零
						$("#message-text").val("");
						// let messageIte = ""
						// messageIte += "<li class='sent'><div>" + message + "<span>" + getTime(date)
						// 	+ "</span></div></li>";

						let formData = new FormData();
						formData.append('groupId', groupRoom);
						formData.append('senderId', senderId);
						formData.append('text', message);
						fetch("${contextRoot}/msg/add", {
							method: "POST",
							body: formData

						}).then(function (result) {
							return result.json()
						}).then(function (data) {

							// console.log(data.messageId)
							let messageItem = "<li class='sent goto context-menu-one' messageId='" + data.messageId + "'><div><div class='ifReadSocket' style='float:left;position:absolute;color:black;bottom:1px;left:-37px'></div><span>"
								+ message + "</span><span>" + getTime(date)
								+ "</span></div></li>";
							$(".messages-area > ul").append(messageItem);
							setTimeout(function () {
								$(document).find(".goto").removeClass(
									"goto");


								// systemMessage(date);
								// messageScrollFix();
							}, 50);
							// $('.sent').unbind();

							setTimeout(() => conTextM(), 1000)

							// $('.sent').click(function (e) {

							// 	console.log($(this).attr("messageId"))
							// })
							let dataMessage = {};
							dataMessage["type"] = 1
							dataMessage["from"] = "${loginUser.avator}";
							dataMessage["to"] = $("#message").attr("participants");
							dataMessage["text"] = message;
							dataMessage["messageId"] = data.messageId;
							dataMessage["groupRoom"] = $("#message").attr("grouproom")
							dataMessage["groupType"] = $("#message").attr("groupType")
							// console.log("AAA", JSON.stringify(data))
							websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据



						}).then(a => {
							imgLarge()
						});





					}


					function customerServiceAuto() {
						var date = new Date();
						var message = $("#message-text").val();
						let messageImg;
						if ($("#previewDiv").html() != null) {
							messageImg = $("#previewDiv").html();
							$("#previewDiv").html("");
							message += messageImg
						}
						//輸入歸零
						$("#message-text").val("");
						let messageItem = "<li class='sent goto'><div><span>"
							+ message + "</span><span>" + getTime(date)
							+ "</span></div></li>";
						$(".messages-area > ul").append(messageItem);
						setTimeout(function () {
							$(document).find(".goto").removeClass(
								"goto");


							// systemMessage(date);
							// messageScrollFix();
						}, 50);
						if (message == "") {
							setTimeout(function () {
								let message = '<li class="recive"><img src="${contextRoot}/images/customer.png"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />';
								message += '<div>我不太了解您的意思，您可以轉<a href="#" onclick="customerService()">人工客服</a>，讓他為您服務<span>' + getTime(new Date) + '</span></div></li>';
								$(".messages-area > ul").append(message);



							}, 500);

						} else {
							let formData = new FormData();
							formData.append('text', message);
							fetch("${contextRoot}/customerService/like", {
								method: "POST",
								body: formData

							}).then(function (result) {
								// console.log(result)
								return result.json()
							}).catch(function (error) {
								setTimeout(function () {
									let message = '<li class="recive"><img src="${contextRoot}/images/customer.png"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />';
									message += '<div>我可能不太懂您的意思，您可以轉<a href="#"" onclick="customerService()"">人工客服</a>，讓他為您服務<span>' + getTime(new Date) + '</span></div></li>';
									$(".messages-area > ul").append(message);



								}, 500);
							}).then(function (data) {
								// console.log(date)
								// if (data == null) {
								// 	setTimeout(function () {
								// 		let message = '<li class="recive"><img src="${contextRoot}/images/customer.png"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />';
								// 		message += '<div>我可能不太懂您的意思，您可以轉<a href="#"" onclick="customerService()"">專員</a>，讓他為您服務<span>' + getTime(new Date) + '</span></div></li>';
								// 		$(".messages-area > ul").append(message);



								// 	}, 500);

								// } else {
								if (data != null) {
									let message = '<li class="recive"><img src="${contextRoot}/images/customer.png"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" />';
									message += '<div>' + data.toMessageText + '<span>' + getTime(new Date) + '</span></div></li>';
									$(".messages-area > ul").append(message);
								}

							})
						}
					}



					//訊息超過會自動往下
					function messageScrollFix() {
						setTimeout(
							function () {
								let mes_hieght = parseInt($(
									".messages-area > ul")
									.height());
								let viewportHeight = parseInt($(
									".messages-area").height());
								if (mes_hieght > viewportHeight)
									$(".messages-area > ul")
										.css(
											"transform",
											"translateY("
											+ ((viewportHeight - mes_hieght) - 10)
											+ "px)");
							}, 100);
					}
					// }

					var customerWidth = 90;

					//複雜得東西
					$(document)
						.ready(

							function () {
								// var distX = 0, distY = 0;
								// var viewportX, viewportY;
								// $(document).on('mousedown touchstart', '.touch-y', function (e) {
								// 	var $ele = $(this);
								// 	viewportY = (-1 * $ele.height()) + viewport($ele).height();
								// 	var startY = e.pageY || e.originalEvent.touches[0].pageY;
								// 	var currentY = parseFloat($ele.css('transform').split(',')[5]);
								// 	$(document).on('mousemove touchmove', function (e) {
								// 		e.preventDefault();
								// 		var y = e.pageY || e.originalEvent.touches[0].pageY;
								// 		distY = y - startY;
								// 		if (currentY) {
								// 			distY += currentY;
								// 		}
								// 		// if (distY > 3 || distY < (-3)) {
								// 		// 	$(".messages-list > ul > li").off('click');
								// 		// }
								// 		$ele.css('transform', 'translateY(' + distY + 'px)');
								// 		if (distY > 0 || distY < viewportY) {
								// 			if (viewport($ele).find('.viewportShadow').length == 0)
								// 				viewport($ele).append('<span class="viewportShadow"></span>');
								// 		}
								// 		if (distY > 0) {
								// 			viewport($ele).find('.viewportShadow').css({
								// 				'top': '-5px',
								// 				'box-shadow': '0px 0px 140px ' + distY / 5 + 'px rgba(255,183,0,0.8)'
								// 			});
								// 		} else if (distY < viewportY) {
								// 			viewport($ele).find('.viewportShadow').css({
								// 				'bottom': '-5px',
								// 				'box-shadow': '0px 0px 140px ' + ((-1 * distY) + viewportY) / 5 + 'px rgba(255,183,0,08)'
								// 			});
								// 		}
								// 	});
								// 	$(document).on('mouseup touchend', function () {
								// 		$(document).off('mousemove touchmove mouseup touchend');
								// 		if (!distY) return;
								// 		if (distY > 0) {
								// 			$ele.css('transform', 'translateY(0)').addClass("reset");
								// 			viewport($ele).find('.viewportShadow').css('box-shadow', '0 0 0 rgba(255,183,0,.5)');
								// 		} else if (distY < viewportY) {
								// 			if ($ele.height() > viewport($ele).height()) {
								// 				$ele.css('transform', 'translateY(' + viewportY + 'px)').addClass("reset");
								// 			} else {
								// 				$ele.css('transform', 'translateY(0)').addClass("reset");
								// 			}
								// 			viewport($ele).find('.viewportShadow').css('box-shadow', '0 0 0 rgba(255,183,0,.5)');
								// 		}
								// 		setTimeout(function () {
								// 			$ele.removeClass("reset");
								// 			viewport($ele).find('.viewportShadow').remove();
								// 			$(".messages-list > ul > li").bind('click', showMessages);
								// 		}, 400);
								// 	});
								// });


								// 上拉下拉程式呼叫
								// Get viewport
								function viewport(ele) {
									return ele.closest('[data-viewport="true"]');
								}

								// nav control
								var $el, leftPos, newWidth, $mainNav = $("#master-nav ul");
								//nav橘色底線
								var $active_line = $("#active-line");
								$active_line.css("left", "123px");
								//a一打開的畫面（聊天）
								navItemPos($("#master-nav ul .active").index());

								// 點擊選項功能    
								$("#master-nav ul li").click(function () {
									$el = $(this);
									console.log($el)
									if ($el.hasClass("navClick")) {
										// $("#master-nav ul li").removeClass('active');
										// $el.addClass('active');
										$("#message-text").attr("groupRoom", "")
										let roomId = $("#message").attr("groupRoom")

										// 	// setTimeout(() => controllMessage(), 1000)
										groupRoom(roomId)
										let messageDate = new Date;

										setTimeout(() => systemMessage(messageDate), 1000)

									} else {
										$("#master-nav ul li").removeClass('active');
										$el.addClass('active');
										navItemPos($el.index());
										leftPos = $el.position().left;
										newWidth = $el.parent().width();
										$active_line.stop().animate({
											left: leftPos
										})
									};
								});

								function navItemPos(index) {
									$("#master-nav-items > div").removeClass(
										"active after before");
									$("#master-nav-items > div").eq(index)
										.addClass("active");
									$("#master-nav-items > div").eq(index)
										.nextAll().addClass("after");
									$("#master-nav-items > div").eq(index)
										.prevAll().addClass("before");
								}






								//點擊進入聊天


								// 自動回覆
								function systemMessage(date) {
									let messages = [
										"有什麼需要幫忙的嗎？目前為自動訊息回覆，如需由<a href='#' onclick='customerService()' style='line-height:0;'>人工客服</a>為您服務，請點此"
									]
									setTimeout(function () {
										let messageItem = "<li class='recive'><div>" + messages + "<span>" + getTime(date) + "</span></div></li>";
										$(".messages-area > ul").append(messageItem);

									}, 1000);
									$("#messageTitle").text("客服")
								}
								// [parseInt(Math.random(1, 4) * 4)]

								window.customerService = function () {

									let messageItem = "<li class='sent'><div>轉專員<span>" + getTime(new Date) + "</span></div></li>";
									$(".messages-area > ul").append(messageItem);
									setTimeout(function () {
										messageItem = "<li class='recive'><div>已轉人工，接下來的對話紀錄將會被存取，以確保雙方權益，請見諒，您可先輸入問題，稍後由專員為您服務<span>" + getTime(new Date) + "</span></div></li>";
										$(".messages-area > ul").append(messageItem);

									}, 700);
									let grouproomId = $("#message").attr("grouproom");
									let groupRoom = $("#message-text").attr("groupRoom", grouproomId);
									let senderId = $("#message-text").attr("senderId", "${loginUser.id}");

								}

								//時間格式
								// function getTime(date) {
								// 	var hours = date.getHours();
								// 	var minutes = date.getMinutes();
								// 	var ampm = hours >= 12 ? 'PM' : 'AM';
								// 	hours = hours % 12;
								// 	hours = hours ? hours : 12;
								// 	minutes = minutes < 10 ? '0' + minutes
								// 		: minutes;
								// 	var strTime = hours + ':' + minutes + ' '
								// 		+ ampm;
								// 	return strTime;
								// }
								//訊息超過會自動往下
								// function messageScrollFix() {
								// 	setTimeout(
								// 		function () {
								// 			var mes_hieght = parseInt($(
								// 				".messages-area > ul")
								// 				.height());
								// 			var viewportHeight = parseInt($(
								// 				".messages-area").height());
								// 			if (mes_hieght > viewportHeight)
								// 				$(".messages-area > ul")
								// 					.css(
								// 						"transform",
								// 						"translateY("
								// 						+ ((viewportHeight - mes_hieght) - 10)
								// 						+ "px)");
								// 		}, 100);
								// }
								// 好友聊天顯示
								$(".chatImg2").click(function () {
									$(".chatImg2").addClass("FriendBox")

								})
								$("#addFriendTable").click(function () {
									//延遲跳出時間
									window.setTimeout(addCustomer, 300)
								});

								function addCustomer() {

									//顯示客服方式
									$(".app-wrapp").show("fold", 1100);
									$(".chatImg2").removeClass("FriendBox1");
									$("#closeFriendTable").unbind();
									setTimeout(() => closeFriendTable(), 1000)
								}
								// 好友聊天關閉
								// function showMessages() {
								// 	$('.view-main').addClass("deactive");
								// 	$('.view-message').addClass("active");

								// }
								// //進入後返回鍵
								// $(".back-arrow").click(function () {
								// 	$('.view-main').removeClass("deactive");
								// 	$('.view-message').removeClass("active");
								// })



							});
					// 好友聊天關閉 為何不能放在ready裡
					function closeFriendTable() {
						$("#closeFriendTable").click(function () {

							$(".app-wrapp").hide("fold", {
								direction: "down"
							}, "slow");
							setTimeout(function () {
								$(".chatImg2").removeClass("FriendBox")
								$(".chatImg2").addClass("FriendBox1");
								$(".friendGroupList").remove();
							}, 600);

						})
					};


					function getTime(date) {
						var hours = date.getHours();
						var minutes = date.getMinutes();
						var ampm = hours >= 12 ? 'PM' : 'AM';
						hours = hours % 12;
						hours = hours ? hours : 12;
						minutes = minutes < 10 ? '0' + minutes
							: minutes;
						var strTime = hours + ':' + minutes + ' '
							+ ampm;
						return strTime;
					}


					//收回選單
					$(function () {

						conTextM()

					})

					window.conTextM = function () {
						$.contextMenu({
							selector: '.context-menu-one',
							callback: function (key, options) {
								var m = "clicked: " + key;
								// window.console && console.log(m) || alert(m);
								let messageId = $(this).attr("messageId")
								// console.log(messageId)
								console.log(m)
								console.log(key)
								console.log(options)
							},
							items: {
								// "edit": {
								// 	name: "編輯", icon: "edit",
								// 	callback: function () {
								// 		let messageId = $(this).attr("messageId")
								// 		// console.log($(this).attr("messageId"))
								// 		let defalutMessage = $("li[messageId='" + messageId + "'] > div span:first-child").text()
								// 		var nickname = prompt('請輸入修改內容', defalutMessage);
								// 		if (nickname == null) {
								// 			$("li[messageId='" + messageId + "'] > div span:first-child").text(defalutMessage)
								// 		} else {
								// 			$("li[messageId='" + messageId + "'] > div span:first-child").text(nickname)
								// 			// 	let formData = new FormData();
								// 			// 	formData.append('messageId', messageId);
								// 			// formData.append('text', nickname);
								// 			// fetch("${contextRoot}/msg/add", {
								// 			// 	method: "POST",
								// 			// 	body: formData

								// 			// }).then(function (result) {
								// 			// 	return result.json()
								// 			// }).then(function (data) {

								// 			// })
								// 		}

								// 		// let s = $("li[messageId='" + messageId + "'] > div span:first-child").text()


								// 		// formData.append('messageId', messageId);
								// 		// formData.append('text', nickname);
								// 		// fetch("${contextRoot}/msg/add", {
								// 		// 	method: "POST",
								// 		// 	body: formData

								// 		// }).then(function (result) {
								// 		// 	return result.json()
								// 		// }).then(function (data) {

								// 		// }
								// 	}
								// },
								// "cut": { name: "剪下", icon: "cut" },
								// "copy": { name: "複製", icon: "copy" },
								// "paste": { name: "貼上", icon: "paste" },
								"delete": {
									name: "收回", icon: "delete",
									callback: function () {
										// console.log($(this).attr("messageId"))

										Swal.fire({
											title: '你確定嗎',
											text: '收回訊息的部分',
											type: 'warning',
											showCancelButton: true,
											confirmButtonColor: '#3085d6',
											cancelButtonColor: '#d33',
											confirmButtonText: '確定！'


										}).then((result) => {
											if (result.value) {
												Swal.fire(
													'收回！',
													'你收回了該訊息',
													'success'
												)
												let messageId = $(this).attr("messageId")

												let defalutMessage = '<span style="color:blue;font-weight:800;font-style:italic;">訊息已被收回</span>'
												console.log($(".sent[messageId='" + messageId + "']>div span").text())
												$(".sent[messageId='" + messageId + "'] > div span:eq(0)").html(null)
												$(".sent[messageId='" + messageId + "'] > div span:eq(0)").append(defalutMessage)

												let formData = new FormData();
												formData.append('messageId', messageId);
												formData.append('text', defalutMessage);
												fetch("${contextRoot}/msg/updateMessage", {
													method: "POST",
													body: formData

												})
												let dataMessage = {};
												dataMessage["type"] = 2
												// dataMessage["from"] = "${loginUser.avator}";
												dataMessage["to"] = $("#message").attr("participants");
												dataMessage["text"] = defalutMessage;
												dataMessage["messageId"] = messageId;
												// console.log("AAA", JSON.stringify(data))
												websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据


											}

										})





										/* let messageId = $(this).attr("messageId")

										let yes = confirm('你確定嗎？');

										if (yes) {
											// $("li[messageId='" + messageId + "']").addClass("deleteMessage")
											// $("li[messageId='" + messageId + "']").hide();
											// alert('你按了確定按鈕');
											// $("li[messageId='" + messageId + "']").addClass("deleteMessage")
											let defalutMessage = '<span style="color:blue;font-weight:800;font-style:italic;">訊息已被收回</span>'
											console.log($(".sent[messageId='" + messageId + "']>div span").text())
											$(".sent[messageId='" + messageId + "'] > div span:eq(0)").html(null)
											$(".sent[messageId='" + messageId + "'] > div span:eq(0)").append(defalutMessage)

											let formData = new FormData();
											formData.append('messageId', messageId);
											formData.append('text', defalutMessage);
											fetch("${contextRoot}/msg/updateMessage", {
												method: "POST",
												body: formData

											})
											let dataMessage = {};
											dataMessage["type"] = 2
											// dataMessage["from"] = "${loginUser.avator}";
											dataMessage["to"] = $("#message").attr("participants");
											dataMessage["text"] = defalutMessage;
											dataMessage["messageId"] = messageId;
											// console.log("AAA", JSON.stringify(data))
											websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据
										} else {

										} */

									}
								},
								// "sep1": "---------",
								// "quit": {
								// 	name: "離開", icon: function () {
								// 		return 'context-menu-icon context-menu-icon-quit';
								// 	}
								// }

							}
						});
					}


					//搜聊天室
					function participantsSelect() {
						$(".friendGroupList").remove();
						$.ajax({
							url: "${contextRoot}/participants/select1",
							type: "get",
							dataType: "json",
							success: function (data) {
								let groomList = data.groomList
								let memList = data.memList

								console.log(groomList)
								console.log(memList)
								let chatRoom = '';
								$.each(groomList, function (index, groupList) {
									console.log(index, groupList)
									console.log(groupList.groupId)

									console.log(data.userId)

									if (groupList.groupType === 0) {

										chatRoom += '<li id="' + groupList.groupId + '" onclick="groupRoom(' + groupList.groupId + ')">';
										$.each(groupList.participants, function (index, participants) {

											if (participants.personId != data.userId) {
												$.each(memList, function (index, member) {
													if (member.id == participants.personId) {
														chatRoom += '<div class="sender-image" account="' + member.account + '">';
														chatRoom += '<img src="' + member.avator + '">';
														chatRoom += '</div><div class="mes-detail"><div class="mes-col1"><div class="sender-name">' + member.name + '</div>';
														let dataMessage = {};

														dataMessage["from"] = "${loginUser.account}";
														dataMessage["to"] = 4;
														dataMessage["text"] = member.account;

														// console.log("AAA", JSON.stringify(data))
														websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据
														let friendList = '<a href="#" class="list-group-item friendGroupList" id="friendFileId' + member.id + '" friendFileAvator="' + member.avator + '" friendFileEmail="' + member.account + '" friendFileName="' + member.name + '" friendFileBirth="' + member.birth + '" friendFileGender="' + member.gender + '" onclick="selectFriendFile(' + member.id + ')"><img src="' + member.avator + '"style="width: 30px;height:30px;border-radius: 50%;">' + member.name + '</a>'

														$("#friendGroupList").append(friendList)
														$.each(groupList.messageText, function (index, message) {

															if (index === groupList.messageText.length - 1) {
																// let fmt = SimpleDateFormat("H:mm");

																// let aTime = fmt.parse(message.createAt);
																// let strTime = fmt.format(aTime)
																// let startTime = new Date(Date.parse(message.createAt));

																// let strStart = sdf.format(startTime);
																let startTime = new Date(Date.parse(message.createAt));
																let strTime = getTime(startTime);
																//新加
																if (/<img/.test(message.messageText)) {
																	chatRoom += '<div class="mes-preview">圖片</div></div>'
																} else {
																	chatRoom += '<div class="mes-preview">' + message.messageText + '</div></div>'
																}
																// chatRoom += '<div class="mes-preview">' + message.messageText + '</div></div>'
																chatRoom += '<div class="mes-col2"><div><div class="send-time">' + strTime + '</div></div></div>'
															}
														})
														chatRoom += '</div>'
													}
												})
											}
										})
										chatRoom += '</li>';

									} else if (groupList.groupType === 1) {
										chatRoom += '<li id="' + groupList.groupId + '" onclick="groupRoom(' + groupList.groupId + ')">';
										if (groupList.groupPhoto == null) {
											chatRoom += '<div class="sender-image">';
											chatRoom += '<img src="${ contextRoot}/images/sing.png"/>';
											chatRoom += '</div>';
										} else {
											chatRoom += '<div class="sender-image">';
											chatRoom += '<img src="' + groupList.groupPhoto + '">';
											chatRoom += '</div>';
										}
										let people = groupList.participants.length
										chatRoom += '</div><div class="mes-detail"><div class="mes-col1"><div class="sender-name">' + groupList.groupName + ' (' + people + ')</div>';

										$.each(groupList.messageText, function (index, message) {


											if (index === groupList.messageText.length - 1) {

												// let fmt = SimpleDateFormat("H:mm");

												// let aTime = fmt.parse(message.createAt);
												// let strTime = fmt.format(aTime)
												let startTime = new Date(Date.parse(message.createAt));

												// let strStart = sdf.format(startTime);
												let strTime = getTime(startTime);
												if (/<img/.test(message.messageText)) {
													chatRoom += '<div class="mes-preview">圖片</div></div>'
												} else {
													chatRoom += '<div class="mes-preview">' + message.messageText + '</div></div>'
												}
												chatRoom += '<div class="mes-col2"><div><div class="send-time">' + strTime + '</div></div></div>'
											}
										})
										chatRoom += '</div>';
										chatRoom += '</li>';

									} else {
										$("#message").attr("grouproom", groupList.groupId)
										//新加
										if ("${loginUser.account}" == 'admin') {
											chatRoom += '<li id="' + groupList.groupId + '" onclick="groupRoom(' + groupList.groupId + ')">';
											$.each(groupList.participants, function (index, participants) {

												if (participants.personId != data.userId) {
													$.each(memList, function (index, member) {
														if (member.id == participants.personId) {
															chatRoom += '<div class="sender-image" account="' + member.account + '">';
															chatRoom += '<img src="' + member.avator + '">';
															chatRoom += '</div><div class="mes-detail"><div class="mes-col1"><div class="sender-name">' + member.account + '</div>';
															let dataMessage = {};

															dataMessage["from"] = "${loginUser.account}";
															dataMessage["to"] = 4;
															dataMessage["text"] = member.account;

															// console.log("AAA", JSON.stringify(data))
															websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据
															let friendList = '<a href="#" class="list-group-item friendGroupList" id="friendFileId' + member.id + '" friendFileAvator="' + member.avator + '" friendFileEmail="' + member.account + '" friendFileName="' + member.name + '" friendFileBirth="' + member.birth + '" friendFileGender="' + member.gender + '" onclick="selectFriendFile(' + member.id + ')"><img src="' + member.avator + '"style="width: 30px;height:30px;border-radius: 50%;">' + member.name + '</a>'

															$("#friendGroupList").append(friendList)
															$.each(groupList.messageText, function (index, message) {

																if (index === groupList.messageText.length - 1) {
																	// let fmt = SimpleDateFormat("H:mm");

																	// let aTime = fmt.parse(message.createAt);
																	// let strTime = fmt.format(aTime)
																	// let startTime = new Date(Date.parse(message.createAt));

																	// let strStart = sdf.format(startTime);
																	let startTime = new Date(Date.parse(message.createAt));
																	let strTime = getTime(startTime);
																	chatRoom += '<div class="mes-preview">' + message.messageText + '</div></div>'
																	chatRoom += '<div class="mes-col2"><div><div class="send-time">' + strTime + '</div></div></div>'
																}
															})
															chatRoom += '</div>'
														}
													})
												}
											})
											chatRoom += '</li>';
										}
									}

								})
								chat.innerHTML = chatRoom;

							}
						})
					}

					// 	$(document).ready(function() {
					// 		let websocket=null;
					// 		if ('WebSocket' in window) { // 浏览器支持 WebSocket
					// 	websocket = new WebSocket("ws://localhost:8080/webSocket/" + username); // 打开一个 web socket
					// }
					// 	})
					let websocket = null;
					if ("${loginUser.account}" != null) {
						// console.log("userId" + "${loginUser.id}")

						if ('WebSocket' in window) { // 浏览器支持 WebSocket
							websocket = new WebSocket("ws://localhost:8080/webSocket/${loginUser.account}"); // 打开一个 web socket‘
							// console.log("${loginUser.account}")
							console.log(websocket)
						}

					}
					let onlineFriendSocket = "";
					websocket.onmessage = function (event) {
						var data = JSON.parse(event.data);
						// if (data.to == 0) { //上线消息
						// 	if (data.text != username) {
						// 		$("#users").append('<a href="#" onclick="talk(this)" class="list-group-item">' + data.text + '</a>');
						// 		$("#log-container").append("<div class='bg-info'><label class='text-danger'>" + data.from + "&nbsp;" + data.date + "</label><div class='text-success'>" + data.text + "上线了" + "</div></div><br>");
						// 		scrollToBottom();
						// 	}
						// } else if (data.to == -2) { //下线消息
						// 	if (data.text != username) {
						// 		$("#users > a").remove(":contains('" + data.text + "')");
						// 		$("#log-container").append("<div class='bg-info'><label class='text-danger'>" + data.from + "&nbsp;" + data.date + "</label><div class='text-success'>" + data.text + "下线了" + "</div></div><br>");
						// 		scrollToBottom();
						// 	}
						// } else { // 普通消息
						if (data.to == 0) {
							$("#onlineCount>span").text("線上人數: " + data.text)
							let onlineSocket = data.from;
							$("div[account='" + onlineSocket + "']").css({
								"border": "2px solid lightgreen",
								"border-width": "0 4px 0 0"
							})
						} else if (data.to == -2) {
							$("#onlineCount>span").text("線上人數: " + data.text)
							let onlineSocket = data.from;
							$("div[account='" + onlineSocket + "']").css({
								"border": "0px",
								"border-width": "0"
							})
							//在線的話綠線
						} else if (data.to == 4) {
							onlineFriendSocket = data.text
							console.log("online1234", onlineFriendSocket)
							console.log("account" + data.text)
							$("div[account='" + data.text + "']").css({
								"border": "2px solid lightgreen",
								"border-width": "0 4px 0 0"
							})




						} else if (data.type == 1) {
							//如果沒開聊天室提醒視窗
							// if ($("#message").children().length == 0) {
							if ($("#message").attr("participants") == "") {
								$("#remind").show("shake", 700);
								$("#removeRemind").unbind();
								$("#removeRemind").click(function () {
									$(this).parent().hide("fold", {
										direction: "down"
									}, "slow");

								})
								console.log("messagefalse")
							} else {
								//傳訊息
								if (data.groupRoom == $("#message").attr("grouproom")) {
									$("#message").append('<li class="recive" messageId="' + data.messageId + '"><img src="' + data.from + '"style="width: 35px; height: 35px; border-radius: 50%; display: flex; float: left; margin-top: 10px" /><div><span style="display:flex">' + data.text + '</span><span>' + getTime(new Date()) + '</span></div></li>');
									let dataMessage = {};
									dataMessage["type"] = 6
									dataMessage["from"] = "${loginUser.account}";
									dataMessage["to"] = $("#message").attr("participants");
									// dataMessage["text"] = message;
									dataMessage["groupRoom"] = $("#message").attr("grouproom");
									dataMessage["groupType"] = $("#message").attr("groupType");
									// console.log("AAA", JSON.stringify(data))
									websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据
									let formData = new FormData();
									formData.append('groupId', $("#message").attr("grouproom"));

									fetch("${contextRoot}/msg/ifRead", {
										method: "POST",
										body: formData

									})
									//新增
									imgLarge()
								}
							}
						} else if (data.type == 2) {
							//data.type==2收回訊息
							$("li[messageId='" + data.messageId + "'] > div span:first-child").text(null)
							$("li[messageId='" + data.messageId + "'] > div span:first-child").append(data.text)
						} else if (data.type == 3) {
							$("#friendRemind>span").text(data.text)
							$(".acceptGame").attr("gameAccount", data.from)
							$("#friendRemind").show("shake", 700);

							//4傳訊息給好友 是否玩遊戲
						} else if (data.type == 4) {
							$(".pac-man").hide();
							setTimeout(() => showMain(), 1500)

							//5對方接受後開遊戲
						} else if (data.type == 5) {
							$("#waitText").text(data.text)
							setTimeout(function () {
								$(".pac-man").hide();
								$(".gameAll").show();

								$("#waitText").text("等待中")

							}, 5000);
						} else if (data.type == 6) {
							if (data.groupRoom == $("#message").attr("grouproom")) {
								let ifReadAllList = $('.ifReadSocket')
								console.log($("#message").attr("groupType"))
								if (data.groupType == 1) {

									for (ifReadList of ifReadAllList) {

										if ($(ifReadList).hasClass('reading') == false) {
											$(ifReadList).text('已讀1')
										}
									}
								} else if (data.groupType == 0) {
									for (ifReadList of ifReadAllList) {

										if ($(ifReadList).hasClass('reading') == false) {
											$(ifReadList).text('已讀')
										}
									}
								}
							}
						}


					}
					// };

					function acceptGameox() {
						let toAccount = $(".acceptGame").attr("gameAccount");
						$(".acceptGame").attr("gameAccount", "")
						setTimeout(() => showMain(), 500)

						let dataMessage = {};
						dataMessage["type"] = 4
						dataMessage["from"] = "${loginUser.account}";
						dataMessage["to"] = toAccount;
						dataMessage["text"] = "${loginUser.name}";
						// dataMessage["messageId"] = messageId;
						// console.log("AAA", JSON.stringify(dataMessage))

						websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据
						$(".gameAll").hide()

						$("#friendRemind").hide("fold", {
							direction: "down"
						}, "slow");



					}
					function unacceptGameox() {
						let toAccount = $(".acceptGame").attr("gameAccount");
						$(".acceptGame").attr("gameAccount", "")
						let dataMessage = {};
						dataMessage["type"] = 5
						dataMessage["from"] = "${loginUser.account}";
						dataMessage["to"] = toAccount;
						dataMessage["text"] = "${loginUser.name}拒絕你的邀請";
						// dataMessage["messageId"] = messageId;
						// console.log("AAA", JSON.stringify(dataMessage))

						websocket.send(JSON.stringify(dataMessage)); // 使用 send() 方法发送数据

						$("#friendRemind").hide("fold", {
							direction: "down"
						}, "slow");

					}
					let base64String = "WW91IGNhdGNoZWQgbWUh"
					// atob() 解碼
					atob(base64String)
					// 輸出: "You catched me!"
					// 預覽圖片，將取得的files一個個取出丟到convertFile()
					function previewFiles(files) {
						if (files && files.length >= 1) {
							$.map(files, file => {
								convertFile(file)
									.then(data => {
										// console.log(data) // 把編碼後的字串輸出到console
										showPreviewImage(data, file.name)
									})
									.catch(err => console.log(err))
							})
						}
					}

					// 使用FileReader讀取檔案，並且回傳Base64編碼後的source
					function convertFile(file) {
						return new Promise((resolve, reject) => {
							// 建立FileReader物件
							let reader = new FileReader()
							// 註冊onload事件，取得result則resolve (會是一個Base64字串)
							reader.onload = () => { resolve(reader.result) }
							// 註冊onerror事件，若發生error則reject
							reader.onerror = () => { reject(reader.error) }
							// 讀取檔案
							reader.readAsDataURL(file)
						})
					}

					// 在頁面上新增<img>
					function showPreviewImage(src, fileName) {
						let image = new Image(250) // 設定寬250px
						image.name = fileName
						image.classList = "chatImgLarge"
						image.src = src // <img>中src屬性除了接url外也可以直接接Base64字串
						$("#previewDiv").append(image)
						// .append(`<p>File: ${image.name}`)
					}

					// 當上傳檔案改變時清除目前預覽圖，並且呼叫previewFiles()
					$("#dragArea").change(function () {
						$("#previewDiv").empty() // 清空當下預覽
						previewFiles(this.files) // this即為<input>元素
					})

					// dragover事件：拖曳(滑鼠還沒鬆開)至放置區時，就要先防止瀏覽器進行開圖
					$("#dragArea").on("dragover", function (e) {
						e.preventDefault()
					})

					// 當拖曳區發生drop事件時，接受格式為image的資料
					$("#dragArea").on("drop", function (e) {
						// 防止事件傳遞及預設事件發生
						e.stopPropagation()
						e.preventDefault()
						// 取得data type為image/*的資料
						e.originalEvent.dataTransfer.getData("image/*")
						let files = e.originalEvent.dataTransfer.files
						// console.dir(files) // 看看File長什麼樣子
						$("#previewDiv").empty() // 清空當下預覽
						previewFiles(files)
					})

					//客服系統
					// $("#master-nav ul li img").click(function () {
					// 	setTimeout(() => showMessages(), 300)

					// 	// setTimeout(() => controllMessage(), 1000)
					// 	$(".back-arrow").unbind();
					// 	setTimeout(() => backArrow(), 1000)
					// })
					function closeWebSocket() {
						websocket.close();
						console.log("closeWebSocket")
					}
					// console.log(viewMessage.scrollTop, "hhehehehe")
					// $("#message").scrollTop = $("#message").scrollHeight;
					// function selectGP() {
					// 	$("#groupPeople").toggle("Blind", 1000)
					// }

					$("#messageTitle").click(function () {
						$("#groupPeople").toggle("blind", {
							direction: "up"
						}, "slow");
					})
					function selectFriendFile(id) {

						document.getElementById("friendFileList").innerHTML = "";
						let f = $("#friendFileId" + id)

						console.log(f.attr("friendFileName"))
						let friendgender;
						if (f.attr("friendFileGender") == 1) {
							friendgender = '男'
						} else if (f.attr("friendFileGender") == 2) {
							friendgender = '女'

						}
						let friendFile = '<img src="' + f.attr("friendFileAvator") + '" style="width:30px;height:30px;border-radius:50%"><div>' + f.attr("friendFileName") + '</div><div>性別：' + friendgender + '</div><div>生日：08-15</div><div>email:' + f.attr("friendFileEmail") + '</div>'
						$("#friendFileList").append(friendFile)
						$("#friendFileList").toggle("drop", {
							direction: "right"
						}, "slow");
					}


					// var $ = function (obj) {
					// 	return document.querySelector(obj);
					// }
					function imgLarge() {
						$('.chatImgLarge').unbind();
						$('.cloes-tag').unbind();
						var initWindowWithIMGAndShow = function (src) {
							console.log(src)
							$('.chatimgLargeFile img').attr("src", src);
							$('.chatimgLargeFile').addClass('window-show');
						}

						$('.chatImgLarge').click(function () {

							var src = this.src;
							initWindowWithIMGAndShow(src);
						})

						$('.cloes-tag').click(function () {
							$('.chatimgLargeFile').removeClass('window-show');
						})
					}
				</script>
			</body>

			</html>