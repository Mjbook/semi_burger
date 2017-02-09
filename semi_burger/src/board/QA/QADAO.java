package board.QA;

import java.sql.*;
import java.util.*;

public class QADAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	// ref 최대값 구하기 ( 답변 글 사용 )
	public int getMaxRef() {
		try {
			conn=yb.db.YB_DB.getConn();
			String sql="SELECT MAX(REF) FROM QNA_BOARD";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int max=0;
			if(rs.next()) {
				max=rs.getInt(1);
			}
			return max;
		}catch(Exception e) {
			throw new RuntimeException(e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}catch(Exception e2) {}
		}
	}

	// 게시물 작성  작성 관련 
	public int QAWrite(QADTO dto)  {
		try {
			
			
			conn=yb.db.YB_DB.getConn();
			int maxref=getMaxRef();
			String sql="INSERT INTO QNA_BOARD VALUES(qna_board_seq.nextval,?,?,?,sysdate,0,?,0,0,?)";

			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getSubject());
			ps.setString(3, dto.getContent());
			ps.setInt(4,  maxref+1);
			ps.setString(5, dto.getPwd());

			int count=ps.executeUpdate();
			return count;

		}catch(Exception e){
			e.printStackTrace();
			return -1;

		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2) {}
		}
	}


	//순번 수정 메서드
	public void updateSun(int ref, int sun) {
		try {
			conn=yb.db.YB_DB.getConn();
			String sql="UPDATE QNA_BOARD SET SUNBUN=SUNBUN+1 WHERE REF=? AND SUNBUN>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sun);
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
			}catch(Exception e2) {}
		}
	}
	// 답변 글 쓰기 관련
	public int QAReWrite(QADTO dto) {
		try {
			conn=yb.db.YB_DB.getConn();
			updateSun(dto.getRef(), dto.getSunbun());
			String sql="INSERT INTO QNA_BOARD VALUES(QNA_BOARD_SEQ.NEXTVAL,?,?,?,sysdate,0,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getSubject());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getRef());
			ps.setInt(5, dto.getLev()+1);
			ps.setInt(6, dto.getSunbun()+1);
			ps.setString(7, dto.getPwd());
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}

	}

	// 목록 관련 
	public ArrayList<QADTO> QAList( int cp, int ls) {
		
		try {
			conn=yb.db.YB_DB.getConn();
			String sql="select * from "+
					"(select rownum as rnum, a.* from "+ 
					"(select * from QNA_BOARD order by ref desc,sunbun asc, lev asc)a)b "+
					"where rnum>=("+cp+"-1)*"+ls+"+1 and rnum<="+cp+"*"+ls;
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<QADTO> arr = new ArrayList<QADTO>();

			while(rs.next()) {
				int idx=rs.getInt("qna_no");
				String name=rs.getString("name");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				java.sql.Date insert_date=rs.getDate("insert_date");
				int board_count=rs.getInt("board_count");
				int ref=rs.getInt("ref");
				int lev=rs.getInt("lev");
				int sunbun=rs.getInt("sunbun");

				QADTO dto = new QADTO(idx, name, subject, content, insert_date, board_count, ref, lev, sunbun);
				arr.add(dto);
			}
			return arr; 
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	// 본문관련 
	public QADTO QAContent(int qna_no) {
		try {
			conn=yb.db.YB_DB.getConn();
			String sql="select * from QNA_BOARD where qna_no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, qna_no);
			rs=ps.executeQuery();
			QADTO dto = null;
			if(rs.next()) {
				String name = rs.getString("name");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				java.sql.Date insert_date=rs.getDate("insert_date");
				int board_count=rs.getInt("board_count");
				int ref=rs.getInt("ref");
				int lev=rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				dto = new QADTO(qna_no, name, subject, content, insert_date, board_count, ref, lev, sunbun);
			}
			return dto;

		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally { 
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();				
			}catch(Exception e2){}				
		}
	}	
	
	// 총 게시물 수 관련 
		public int getTotalCnt() {
			try {
				conn=yb.db.YB_DB.getConn();
				String sql="select count(*) from qna_board";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				rs.next();
				int count=rs.getInt(1);
				count=count==0?1:count;
				return count;
			}catch(Exception e) {
				e.printStackTrace();
				return 1;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
		
		/**qna 조회수 메서드*/
		public void qaCount(int idx) {
			try{
				conn=yb.db.YB_DB.getConn();
				String sql = "UPDATE QNA_BOARD SET BOARD_COUNT =  BOARD_COUNT + 1 WHERE QNA_NO = ?";

				ps = conn.prepareStatement(sql);		
				ps.setInt(1, idx);
				ps.executeUpdate();		

			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2){}
			}
		}
		
	}


















