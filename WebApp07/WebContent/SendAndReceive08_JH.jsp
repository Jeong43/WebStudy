<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   
   Calendar cal = Calendar.getInstance();
   
   int nowYear = cal.get(Calendar.YEAR);
   int nowMonth = cal.get(Calendar.MONTH)+1;
   int nowDay = cal.get(Calendar.DAY_OF_MONTH);
   
   String yearStr = request.getParameter("year");
   String monthStr = request.getParameter("month");
   
   int year = nowYear;
   int month = nowMonth;
   
   if(yearStr!=null)
      year = Integer.parseInt(yearStr);
   if(monthStr!=null)
      month = Integer.parseInt(monthStr);
   
   int pastYear = year;
   int pastMonth = month-1;
   
   int postYear = year;
   int postMonth = month+1;
   
   if(pastMonth < 1)
   {
      pastYear = year -1;
      pastMonth = 12;
   }
   
   if(postMonth > 12)
   {
      postYear = year+1;
      postMonth = 1;
   }
   
   cal.set(year,month-1,1);
   
   int yoil = cal.get(Calendar.DAY_OF_WEEK);
   int lastDay = cal.getActualMaximum(Calendar.DATE);
   
   String[] days = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};

   String newCal = "";
   
   // 달력테이블 그리기 시작
   newCal += "<table border=1>";
   newCal += "<tr>";
   
   // 요일 이름 넣기
   for(int i=0; i<days.length; i++)
      newCal += "<th>" + days[i] + "</th>";
   
   newCal += "</tr>";
   newCal += "<tr>";
      
   // 공백 넣기
   for(int i=1; i<yoil; i++)
      newCal += "<td></td>";
   
   // 일 채우기
   for(int i=1; i<=lastDay;i++)
   {
      yoil++;
       newCal += "<td>" + i + "</td>";   
       
       // 개행
       if(yoil%7==1)
          newCal += "</tr><tr>";
   }
   
   // 마지막 일 이후 공백 채우기
   for(int i=1; i<=yoil; i++, yoil++)
   {   
      if(yoil%7==1)
         break;
   
      newCal += "<td></td>";
   }
   
   
   newCal += "</tr>";
   newCal += "</table>";
   
   

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 
   ○ 데이터 송수신 실습 08
     - 달력을 출력하는 JSP 페이지를 구성한다.
     - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다
     - 단, submit 버튼 없이 이벤트 처리를 한다.
     - 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
     
     ◀ 2021년 10월 ▶      → a 태그
     
     -------------------
     -------------------
     
     ◀이나 ▶ 클릭 시
     
     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
     
     사용자 최초 요청 주소는
     http://loclahost:8090/WebApp07/SendAndReceive08.jsp로 한다
     
     ○ SendAndReceive08.jsp
     
     텍스트 박스로도... 바꿔볼 수 있도록

 -->

<div>
   <h1>데이터 송수신 실습 08</h1>
   <hr>
</div>

<div>
      <a href="SendAndReceive08.jsp?year=<%=pastYear %>&month=<%=pastMonth %>">◀</a>   
      <%=year %>년 <%=month %>월
      <a href="SendAndReceive08.jsp?year=<%=postYear %>&month=<%=postMonth %>">▶</a>   
</div>


<div>
<%=newCal %>
</div>

</body>
</html>
