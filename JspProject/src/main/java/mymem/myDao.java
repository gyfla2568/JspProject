package mymem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import ajaxbox.AjaxboardDto;
import mysql.db.Dbconnect;

public class myDao {

	Dbconnect db=new Dbconnect();
	//insert
	public void insertMy(myDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		
		String sql="insert into mymem values (null,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getGaip());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	//수정하려는 하나의 데이터
	public myDto getData(String num)
	{
		myDto dto=new myDto();
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from mymem where num="+num;
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setHp(rs.getString("hp"));
				dto.setEmail(rs.getString("email"));
				dto.setGaip(rs.getString("gaip"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs,stmt ,conn);
		}
		
		return dto;
		
	}
	
	//전체출력
	public Vector<myDto> getAllDatas() 
	{
		Vector<myDto> list=new Vector<myDto>();
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select * from mymem order by num desc";
		
		try {
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		
		while(rs.next())
		{
			myDto dto=new myDto();
			dto.setNum(rs.getString("num"));
			dto.setName(rs.getString("name"));
			dto.setId(rs.getString("id"));
			dto.setPass(rs.getString("pass"));
			dto.setHp(rs.getString("hp"));
			dto.setEmail(rs.getString("email"));
			dto.setGaip(rs.getString("gaip"));
			
			list.add(dto);
			
		}
		
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
		return list;
	}
	//삭제
	public void deleteMy(String num)
	{
		Connection conn=db.getConnection();
		Statement stmt=null;
		
		String sql="delete from mymem where num="+num;
		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
		
	}
	//최종수정
	public void updateMy(myDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update mymem set name=?,id=?,pass=?,hp=?,email=?,gaip=? where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getGaip());
			pstmt.setString(7, dto.getNum());
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
}
