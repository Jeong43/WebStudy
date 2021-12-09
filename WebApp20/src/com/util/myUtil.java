/*=========================
	MyUtil.java
	- 게시판 페이징 처리
=========================*/

/*
check~!!!

지금 같이 확인해보고자 하는 페이징 처리 기법은
다양한 방법들 중 한 가지(그나마 쉬운 것....)이다.
학습을 마친 후에... 꼭 추가적으로 개념을 정리하고
확장시키고, 다른 방법들도 찾아보고 공부해야 한다~!!!
*/

package com.util;

public class myUtil
{
	// ■ 전체 페이지 수를 구하는 메소드
	// numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
	// dataCount : 전체 데이터(게시물) 수
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;
		
		pageCount = dataCount/numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;		
		
		return pageCount;
	}
	//-- 한 페이지에 10개의 게시물을 출력할 때
	//   총 32 개의 게시물을 페이지로 구성하기 위해서는
	//   『32 / 10』의 연산을 수행하여 결과 3을 얻을 수 있다.
	//   → 『pageCount = dataCount/numPerPage;』
	//   그런데 이때, 나머지 2개의 게시물을 출력해주기 위해서는
	//   페이지가 하나 더 필요하다.
	

	// ■ 페이징 처리 기능의 메소드
	// currentPage : 현재 표시할 페이지
	// totalPage : 전체 페이지 수
	// listUrl : 링크를 설정할 url
	public String pageIndexList(int currentPage, int totalPage, String listUrl)
	{
		// 실제 페이징을 저장할 String Buffer 변수
		StringBuffer strList = new StringBuffer();
		
		int numPerBlock = 10;
		//-- 실제 페이징 처리 시 게시물 리스트 하단의 숫자를 10개씩 보여주겠다.
		int currentPageSetUp;
		//-- 현재 페이지(이 페이지를 기준으로 보여주는 숫자가 달라져야 하기 때문...)
		//   예) (1~10 중) 6 → next 버튼 누름 → (11~20 중) 16
		//   @현재 보여주는 페이지의 단위...?
		//   @예) 현재 16페이지면... 10, 26페이지면... 20
		int page;
		int n;
		//-- 이전 페이지 블럭과 같은 처리에서 이동하기 위한 변수
		//   (얼마만큼 이동해야 하는지...)
		
		// 페이징 처리가 별도로 필요하지 않은 경우
		//-- 데이터가 존재하지 않거나 데이터의 수가 1페이지도 못 채우는 경우에는
		//   별도로 페이징 처리를 할 필요가 없다.
		if(currentPage==0)
			return "";
		
		// ※ 페이지 요청을 처리하는 과정에서 URL 경로의 패턴에 대한 처리
		/*
			- List.jps → List.jps + 『?』

			- 클라이언트의 요청형태 → List.jsp → (가공) → List.jsp?
			- 클라이언트의 요청형태 → List.jsp?subject=study → (가공) → List.jsp?subject=study&
		*/
		
		// ○ 링크를 설정할 URL 에 대한 선가공 처리~!!!
		if(listUrl.indexOf("?") != -1)	// 링크를 설정할 URL에 『?』가 있으면...
		{
			listUrl = listUrl + "&";	// listUrl += "&";
		}
		else							// 링크를 설정할 URL에 『?』가 없으면...
		{
			listUrl = listUrl + "?";	// listUrl += "?";
		}
		//-- 예를 들어, 검색값이 존재하면
		//   이미 request 값에 searchKey 값과 searchValue 값이 들어있는 상황이므로
		//   『&』를 붙여서 추가해주어야 한다.
		
		// currentPageSetUp = 표시할 첫 페이지 -1
		currentPageSetUp = (currentPage / numPerBlock) * numPerBlock;
		//-- 만약 현재 페이지가 5페이지고
		//   리스트 하단에 보여줄 페이지 갯수가 10이면
		//   『5 / 10 = 0』이며... 여기에 『* 10』(10을 곱해도) 0이다.
		//   하지만, 현재 페이지가 11페이지라면(currentPage=11)
		//   『11 / 10 = 1』이며... 여기에 『* 10』(10을 곱하면) 10이다.
		//   그러면 currentPageSetUp 은 10이 되는 것이다.
		
		if(currentPage % numPerBlock == 0)
		{
			currentPageSetUp = currentPageSetUp - numPerBlock;
			// currentPageSetUp -= numPerBlock;
		}
		//-- 만약 위 처리에서(라인 88)
		//   현재 페이지가 20페이지였다면(currentPage=20)
		//   『20 / 10 = 2』 이며... 여기에 『* 10』 (10을 곱해서)
		//   20이 되는데
		//   이와 같은 상황이라면... 다시 10을 빼서 10으로 만들어주기 위한 구문.
		
		
		// ○ 1페이지
		if ( (totalPage>numPerBlock) && (currentPageSetUp>0) )
		{
			strList.append(" <a href='" + listUrl + "pageNum=1'>1</a>");
		}
		//-- listUrl 은 위에서(라인 73) 이미 전처리가 끝난 상황이기 때문에
		//   『...?』 또는 『...?...&』 인 상태이다.
		//   이로 인해 결과는 
		//   『...?pageNum=1』이거나 『...&pageNum=1』가 되는 상황이다.
		
		
		// ○ Prev
		n = currentPage - numPerBlock;
		//-- n: 해당 페이지 만큼 앞으로 가기 위한 변수
		if ( (totalPage>numPerBlock) && (currentPageSetUp>0) )
		{
			strList.append(" <a href='" + listUrl + "pageNum=" + n + "'>Prev</a>");
		}
		//-- currentPageSetUp 이 0보다 큰 경우는
		//   이미 페이지가 10 이상이라는 의미이며
		//   이때, 현재 페이지(currentPage)가 11 이상일 경우
		//   『Prev』를 붙이기 위한 구문
		//-- 『Prev』를 클릭할 경우
		//    n 변수 페이지로 이동하는데, 12 에서 『Prev』할 경우
		//    2 페이지가 되고, 22에서 『Prev』할 경우 12페이지가 될 수 있도록 처리하는 방식이다.
		
		
		// ○ 각 페이지 바로가기
		page = currentPageSetUp + 1;
		//-- 『+1』을 수행하는 이유는
		//   앞에서 currentPageSetUp 에서 10을 가져왔다면
		//   10에서부터 시작하는 것이 아니라
		//   바로가기 페이지는 11부터 시작해야 하기 때문이다.
		
		while ( (page<=totalPage) && (page<=currentPageSetUp+numPerBlock))
		{
			if(page==currentPage)
			{
				strList.append(" <span style='color:orange; font-weight:bold;'>" + page + "</span>");
			}
			else
			{
				strList.append(" <a href='" + listUrl + "pageNum=" + page + "'>" + page + "</a>");
			}
			
			page++;
		}
		
		
		// ○ Next
		n = currentPage + numPerBlock;
		if ( (totalPage-currentPageSetUp) > numPerBlock)
		{
			strList.append(" <a href='" + listUrl + "pageNum=" + n + "'>Next</a>");
		}
		
		
		// ○ 마지막 페이지
		if ( (totalPage>numPerBlock) && (currentPageSetUp+numPerBlock<totalPage) )
		{
			strList.append(" <a href='" + listUrl + "pageNum=" + totalPage + "'>" + totalPage + "</a>");
		}
	
		
		// 최종 결과값 반환
		return strList.toString();
	
	}//end public String pageIndexList(int currentPage, int totalPage, String listUrl)
	

}
