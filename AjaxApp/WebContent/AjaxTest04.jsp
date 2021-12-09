<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
#result {
	display: inline-block;
	width: 250px;
	color: #F33;
}
</style>

<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">
	function check()
	{
		//alert("함수 호출 확인~!!!");

		// 데이터 수집
		var id = document.getElementById("id").value;
		
		if(id=="")
		{
			document.getElementById("result").innerText = "아이디를 입력해주세요.";
			return;
		}

		// URL 준비
		var url = "test03.do?id=" + id;

		// AJAX 객체 생성 (→ XMLHttpRequest 객체)
		ajax = createAjax();

		// 환경 설정(『open("메소드방식", "URL", 비동기(true)/동기(false)』)
		ajax.open("GET", url, true);
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4 && ajax.status == 200)
			{
				// 업무 처리(→ 외부로 추출)
				callBack();
			}
		};

		// 실제 서버에서 AJAX 요청을 한다. (즉, 이 부분이 진짜 연결 작업이다.)
		ajax.send("");
	}

	// 아이디 중복 검사 결과(0 or 1)를 통보 받아
	// 사용자에게 메시지 출력 → span → result
	function callBack()
	{
		// 외부로 추출된 업무 처리 내용 구성(responseText / responseXML)
		//@ Ajax 로부터 어떤 데이터를 받고, 어떻게 처리할 것인지
		var data = ajax.responseText;

		data = parseInt(data);
		if (data == 0)
		{
			document.getElementById("result").innerText = "사용 가능한 아이디입니다.";
		} else
		{
			document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
		}

	}
	
	function search()
	{
		//alert("Test1");
		
		// 데이터 수집
		var addr = document.getElementById("addr").value;
		
		// URL 준비
		var url = "test04.do?addr=" + addr;
		
		// XMLHttpRequest 객체 생성(→ AJAX 객체)
		ajax = createAjax();		// ajax.js
		
		// 설정
		ajax.open("GET", url, true);
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState==4 && ajax.status==200)
			{
				// 수행 업무
				callBack2();
			}
		};	
		
		ajax.send("");
	}	
	
	// 우편번호 검색결과를 통보 받아서
	// 사용자에게 안내해줄 수 있도록 처리
	function callBack2()
	{
		//alert("Test2");
		
		// XML 문서 전체의 참조 객체. (흔히 XML 문서 객체라고 한다.)
		var doc = ajax.responseXML;
		
		// XML 문서의 최상위 엘리먼트 반환
		//-- 현재는 『<list>』 엘리먼트
		var root = doc.documentElement;
		
		// 모든 『<item>』 엘리먼트 반환받기
		var itemList = root.getElementsByTagName("item");
		
		// select box 초기화
		document.getElementById("addrResult").innerHTML = "";
		
		// 검색 결과 확인
		if(itemList.Length == 0)
		{
			document.getElementById("addrResult").innerHTML
				= "<option>주소를 입력하세요</option>";
		}
		else
		{
			document.getElementById("addrResult").innerHTML
				= "<option value='0'>주소를 입력하세요</option>";
		}
		
		//검색 결과가 존재할 경우... 반복문을 순환하며 각 데이터 가져오기
		for(var i=0; i<itemList.length; i++)
		{
			var zipcode = itemList[i].getElementsByTagName("zipcode")[0];
			var address = itemList[i].getElementsByTagName("address")[0];
			
			// ※ 태그가 가지는 텍스트는 태그의 첫 번째 자식이고...
			//    텍스트 노드의 값은 nodeValue 로 가져온다.
			
			var zipcodeText = zipcode.firstChild.nodeValue;
			var addressText = address.firstChild.nodeValue;
			
			// select box 에 아이템 추가
			document.getElementById("addrResult").innerHTML
				+= "<option value ='" + zipcodeText + "/" + addressText
				+ "'>[" + zipcodeText + "] " + addressText + "</option>";
		}
		
	}
	
	function selectZipCode(sel)
	{
		//alert("test~!!!");
		//alert(sel.value);	//--==>> 06232/서울특별시 강남구 강남대로 지하 396 (역삼동 858 강남역)
		
		if(sel.value != 0)
		{
			document.getElementById("addr1").value = sel.value.split("/")[0];
			document.getElementById("addr2").value = sel.value.split("/")[1];
			document.getElementById("addr3").value.focus();
		}
		
	}
	
	
</script>

</head>
<body>

	<div>
		<h1>회원 가입</h1>
		<p>우편번호 검색</p>
		<hr />
	</div>

	<table class="table">
		<tr>
			<th>아이디</th>
			<td><input type="text" id="id" class="control" /> <input
				type="button" value="중복검사" class="control" onclick="check()">
				<span id="result"></span></td>
		</tr>

		<tr>
			<th>이름</th>
			<td><input type="text" id="name" class="control" /></td>
		</tr>

		<tr>
			<th>주소</th>
			<td>
				<input type="text" id="addr" class="control" placeholder="동 입력" />
				<input type="button" value="검색하기" class="control" onclick="search()"> <br> 
				<select id="addrResult"	class="control" onchange="selectZipCode(this)">
					<option>주소를 입력하세요</option>
				</select>
			</td>
		</tr>

		<tr>
			<th>주소 검색 결과</th>
			<td>
				<input type="text" id="addr1" class="control"
				readonly="readonly" style="width: 200px;" /> <br> 
				<input type="text" id="addr2" class="control" readonly="readonly"
				style="width: 400px;" /> <br> 
				<input type="text" id="addr3" class="control" style="width: 400px;" 
				placeholder="상세주소를 입력하세요." />
				<br>
			</td>
	</table>

</body>
</html>