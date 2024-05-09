<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resource/css/chat.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
$(loadedHandler)

var nickname1 = localStorage.getItem("nickname1");
nickname = null;
let webSocket;

	/* 채팅 */
	function loadedHandler() {
		
	$("#btn-sendmsg").on("click", socketMsgSend);
	/* $(".close-chat").on("click", closeChatHandler); */
	
	webSocketInit();
	function webSocketInit() {
	    webSocket = new WebSocket("ws://localhost:8080/kschat/chat3");
		webSocket.onopen = function(event) { socketOpen(event);};
		webSocket.onclose = function(event) { socketClose(event);};
		webSocket.onmessage = function(event) { socketMessage(event);};
		webSocket.onerror = function(event) { socketError(event);};
	}  

	//웹소켓 연결
    // WebSocket이 열렸을 때 실행
	function socketOpen(event){
        //서버에 사용자 정보 전달
    	webSocket.send(nickname1+ ' : 님이 입장하셨습니다.');
	    console.log("연결 완료");
	  }

  //메시지를 송신할 때 사용
    function socketMsgSend(){
       console.log($("#inputmsg").val());
	  if($("#inputmsg").val().trim() != ""){
		  // 메시지 포맷
	       var msg = nickname1 + " : " + $("#inputmsg").val();
	       console.log("송신한 메세지 : " + msg);
	       // 세션리스트에 메시지를 송신
	       webSocket.send(msg);

		   //채팅창에 보낸 메세지 표시
	       $(".content-box").append('<div class="msgbox">' + nickname1 + " : " + $("#inputmsg").val() + '</div>');
	       $(".content-box").scrollTop($(".content-box")[0].scrollHeight);
	       $("#inputmsg").val("");
		}
    }
    
    //메시지를 수신했을 때
    function socketMessage(event){
    	  var receiveData = event.data; // 수신 data
    	  //채팅창에 받은 메세지 표시
    	  $(".content-box").append('<div class="receivebox">' + receiveData + "</div>");
    	  $(".content-box").scrollTop($(".content-box")[0].scrollHeight);
    }

    // WebSocket 연결이 닫혔을 때
    function socketClose(event){
     	console.log("웹소켓이 닫혔습니다.");
     }
    
  	//웹소켓 에러
    function socketError(event){
    	alert("에러가 발생하였습니다.");
    }
  	
  	//웹소켓 종료
    function disconnect(){
    	webSocket.close();
    }
	/* function closeChatHandler() {
    	webSocket.send('${ssslogin.mem_id}' + "님이 나가셨습니다.");
		disconnect();
		$(".wrap-chatbox").css("display","none");
	} */
	
}
	function entermsg() {
		if (window.event.keyCode == 13) {
	    	document.getElementById('btn-sendmsg').click();
    	}
	}
</script>
</head>
<body>
<div class="wrap-body">
	<div class="wrap-chatbox">
		<!-- <div class="topbar"><button type="button" class="close-chat">X</button></div> -->
		<div class="content-box">
			<div class="notice"> 과도한 태그남발, 도배, 욕설 등 부적절한 이용을 삼가해주세요.</div>
		</div>
		<div class="input-box">
			<input type="text" id="inputmsg" onkeyup="entermsg()"><button type="button" id="btn-sendmsg">전송</button>
		</div>
	</div>
	<div class="wrap-members">
		<div class="member">서재원</div>
	</div>
</div>
</body>
</html>