package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import mysql.db.Dbconnect;
import member.MemberDto;

public class MemberDao {
	Dbconnect db=new Dbconnect();
	
	//insert
	public void memberInsert(MemberDto dto) {
		
		String sql="insert into member (num,name,hp,sdate) values(null,?,?,now())";
		

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			// 바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			
			// 실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}

	//select
	public Vector<MemberDto> getAllDatas() {
		Vector<MemberDto> list=new Vector<MemberDto>();
	      
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select * from member order by num asc";
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         
	         while(rs.next()) {
	            MemberDto dto=new MemberDto();
	            
	            dto.setNum(rs.getString("num"));
	            dto.setName(rs.getString("name"));
	            dto.setHp(rs.getString("hp"));
	            dto.setSdate(rs.getTimestamp("sdate"));
	            
	            // 벡터에 추가
	            list.add(dto);
	         }
	      } catch (SQLException e) {
	         // TODO: handle exception
	         e.printStackTrace();
	      } finally {
	         db.dbClose(rs, pstmt, conn);
	      }
	      return list;
	   }
		//삭제
	public void memberDelete(String num) {
		Connection conn=db.getConnection();
		Statement pstmt=null;
		
		String sql="delete from member where num="+num;
		
		try {
			pstmt=conn.createStatement();
			pstmt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//수정하려는 하나의 데이터
	public MemberDto getData(String num)
	{
		MemberDto dto=new MemberDto();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member order by num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setHp(rs.getString("hp"));
				dto.setSdate(rs.getTimestamp("sdate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs,pstmt, conn);
		}
		return dto;
	}

	
}
