/*===================
    BoardDAO.java
 ===================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO
{
	// 주요 속성 구성
	public Connection conn;
	
	// 생성자 정의
	// 디폴트 생성자가 만들어지지 않으므로
	// BoardDAO dao = new BoardDAO(conn); 로 해야 한다.
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	// 게시물 번호의 최대값 얻어내는 메소드 정의
	public int getMaxNum()
	{
		int result = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
				result = rs.getInt(1);
			// rs에 결과값이 있다면 첫 번째 결과값을 result에 넣으라는 얘기
			
			rs.close();
			stmt.close();

		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}// end getMaxNum()
	
	// 게시물 작성 → 데이터 입력 하는 메소드 정의
	public int insertData(BoardDTO dto)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			// hitCount는 기본값 0 또는 default 또는 입력항목 생략 사능
			// created는 기본값 sysdate 또는 default 또는 입력항목 생략 가능
			sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL,"
					+ " SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,	dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIpAddr());
			// pstmt.setInt(8, dto.getHitCount());
			// pstmt.setString(9, dto.getCreated());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}// end insertData(BoardDTO dto)
	
	
	// DB 레코드의 개수를 가져오는 메소드 정의 
	// → 검색기능을 작업하게 되면 수정하게 될 메소드
	/*
	public int getDataCount()
	{
		int result = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				result = rs.getInt(1);	// "COUNT"로 해도 되고~
			}
					
			rs.close();
			stmt.close();
					
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	
	}// getDataCount()
	*/
	
	
	//						제목/작성자/내용
	public int getDataCount(String searchKey, String searchValue)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			// check~!!!
			searchValue = "%" + searchValue + "%";
			
			sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD WHERE " + searchKey + " LIKE ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchValue);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt("COUNT");
				
			rs.close();
			pstmt.close();

			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}

	
	
	// 특정 영역의(시작번호 - 끝번호) 게시물의 목록을 읽어오는 메소드 정의
	// → 검색기능을 작업하게 되면 수정하게 될 메소드
	/*
	public List<BoardDTO> getLists(int start, int end)
	{
		// List는 인터페이스이다. 객체 생성구문 주의!
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED "
		               + "FROM ( SELECT ROWNUM RNUM, DATA.* "
		               + "FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED "
		               + "FROM TBL_BOARD ORDER BY NUM DESC ) DATA ) WHERE RNUM>=? AND RNUM<=?";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}// end getLists(int start, int end)
	*/
	public List<BoardDTO> getLists(int start, int end, String searchKey, String searchValue)
	{
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			searchValue = "%" + searchValue + "%";
			
			sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED ";
			sql += " FROM ";
			sql += " ( ";
			sql += " 	SELECT ROWNUM RNUM, DATA.* ";
			sql += " 	FROM ";
			sql += " 	( ";
			sql += " 		SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED ";
			sql += " 		FROM TBL_BOARD ";
			sql += " 		WHERE " + searchKey + " LIKE ?";		// 추가 구문~!!!
			sql += " 		ORDER BY NUM DESC ";
			sql += " 	) DATA ";
			sql += " ) ";
			sql += " WHERE RNUM>=? AND RNUM<=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}// end getLists(int start, int end, String searchKey, String searchValue)
	
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의
	public int updateHitCount(int num)
	{
		int result = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql = "UPDATE TBL_BOARD"
					+ " SET HITCOUNT = HITCOUNT + 1"
					+ " WHERE NUM =?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	
	}// end updateHitCount();
	
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	public BoardDTO getReadData(int num)
	{
		BoardDTO result = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT"
					+ ", CONTENT, IPADDR, HITCOUNT"
					+ ", TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
					+ " FROM TBL_BOARD"
					+ " WHERE NUM = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				result = new BoardDTO();
				
				result.setNum(rs.getInt("NUM"));
				result.setName(rs.getString("NAME"));
				result.setPwd(rs.getString("PWD"));
				result.setEmail(rs.getString("EMAIL"));
				result.setSubject(rs.getString("SUBJECT"));
				result.setContent(rs.getString("CONTENT"));
				result.setIpAddr(rs.getString("IPADDR"));
				result.setHitCount(rs.getInt("HITCOUNT"));
				result.setCreated(rs.getString("CREATED"));
				
			}
			
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return result;
	
	}// getReadData(int num)
	
	
	// 특정 게시물을 삭제하는 메소드 정의
	public int deleteData(int num)
	{
		int result = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql = "DELETE FROM TBL_BOARD WHERE NUM = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	
	}// end deleteData(int num)
	
	
	// 특정 게시물을 수정하는 메소드 정의
	public int updateData(BoardDTO dto)
	{
		int result = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql = "UPDATE TBL_BOARD"
					+ " SET NAME = ?, PWD= ?, EMAIL= ?"
					+ ", SUBJECT= ?, CONTENT= ?"
					+ " WHERE NUM= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}// updateData(BoardDTO dto)
	
	
	// 특정 게시물의 이전 게시물 번호 얻어내는 메소드 정의
	// 이전 게시물이 존재하지 않을 경우 -1 반환
	public int getBeforeNum(int num)
	{
		int result = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NVL(MAX(NUM), -1) AS BEFORENUM"
					+ " FROM TBL_BOARD"
					+ " WHERE NUM< ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			while (rs.next())
				result = rs.getInt("BEFORENUM");

			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	
	}//end getBeforeNum(int num)
	
	
	
	// 특정 게시물의 다음 게시물 번호 얻어내는 메소드 정의
	// 이전 게시물이 존재하지 않을 경우 -1 반환
	public int getNextNum(int num)
	{
		int result = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NVL(MIN(NUM), -1) AS NEXTNUM"
					+ " FROM TBL_BOARD"
					+ " WHERE NUM> ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			while (rs.next())
				result = rs.getInt("NEXTNUM");
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	
	}// end getNextNum(int num)     
	
	
	
	
	
	
	
	
	
	
	
	

}

















