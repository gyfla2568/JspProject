package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.dto.MemberDto;
import mysql.db.Dbconnect;

public class MemberDao {
   
   Dbconnect db=new Dbconnect();
   
   // 아이디 중복 체크
   public boolean isIdCheck(String id) {
      boolean match=false;
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from member where id=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, id);
         rs=pstmt.executeQuery();
      
         if(rs.next()) {      // DB에서 일치하는 아이디가 발견될 경우
            match=true;
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         db.dbClose(rs, pstmt, conn);
      }
      return match;
   }
   
   
   // ID에 해당하는 name값 반환
   public String getName(String id) {
      String name="";
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from member where id=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, id);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            name=rs.getString("name");
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         db.dbClose(rs, pstmt, conn);
      }
      return name;
   }
   
   
   // 데이터 추가
   public void insertMember(MemberDto dto) {
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="insert into member values(null, ?, ?, ?, ?, ?, ?, now())";
      
      try {
         pstmt=conn.prepareStatement(sql);
      
         pstmt.setString(1, dto.getName());
         pstmt.setString(2, dto.getId());
         pstmt.setString(3, dto.getPass());
         pstmt.setString(4, dto.getHp());
         pstmt.setString(5, dto.getAddr());
         pstmt.setString(6, dto.getEmail());
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   
   // 단일 데이터 불러오기
   public MemberDto getData(String num) {
      MemberDto dto=new MemberDto();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from member where num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, num);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            dto.setName(rs.getString("name"));
            dto.setId(rs.getString("id"));
            dto.setPass(rs.getString("pass"));
            dto.setHp(rs.getString("hp"));
            dto.setAddr(rs.getString("addr"));
            dto.setEmail(rs.getString("email"));
            dto.setGaipday(rs.getTimestamp("gaipday"));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
    	  db.dbClose (rs, pstmt, conn);
      }
      return dto;
   }
   
   public List<MemberDto> getAllMembers() {
      
      List<MemberDto> list=new ArrayList<MemberDto>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;

      String sql="select * from member order by num desc";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            MemberDto dto=new MemberDto();
            dto.setNum(rs.getString("num"));
            dto.setName(rs.getString("name"));
            dto.setId(rs.getString("id"));
            dto.setPass(rs.getString("pass"));
            dto.setHp(rs.getString("hp"));
            dto.setEmail(rs.getString("email"));
            dto.setAddr(rs.getString("addr"));
            dto.setGaipday(rs.getTimestamp("gaipday"));
            
            list.add(dto);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         db.dbClose(rs, pstmt, conn);
      }
      return list;
   }
   
   //
   public void deleteMember(String num) {

      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="delete from member where num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, num);
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   // 비밀번호 검증
   public boolean isPassEqual(String num, String pass) {
      boolean match=false;
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from member where num=? and pass=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, num);
         pstmt.setString(2, pass);
         rs=pstmt.executeQuery();
      
         if(rs.next()) {      // DB에서 일치하는 아이디가 발견될 경우
            match=true;
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         db.dbClose(rs, pstmt, conn);
      }
      return match;
   }
   
   
   public void updateMember(MemberDto dto) {
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="update member set name=?, pass=?, hp=?, addr=?, email=? where num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
      
         pstmt.setString(1, dto.getName());
         pstmt.setString(2, dto.getPass());
         pstmt.setString(3, dto.getHp());
         pstmt.setString(4, dto.getAddr());
         pstmt.setString(5, dto.getEmail());
         pstmt.setString(6, dto.getNum());
         
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         db.dbClose(pstmt, conn);
      }
   }
   public boolean isIdPass(String id,String pass)
   {
	   
	   boolean flag=false;
	   
	   Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from member where id=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
				flag=true; //비밀번호가 맞는데이타가 있으면 true
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return flag;
   }
}