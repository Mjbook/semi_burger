package board.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class noticeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public void dbConnect() {
		try {			
			conn=yb.db.YB_DB.getConn();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//공지사항 목록 보기
	public ArrayList<noticeDTO> noticeList(int cp, int ls){
			
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="SELECT * FROM  NOTICE_BOARD ORDER BY NOTICE_NO DESC";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				
				ArrayList<noticeDTO> arr=new ArrayList<noticeDTO>();
				
				while(rs.next()){
					noticeDTO bdto = new noticeDTO();
					bdto.setNotice_no(rs.getInt("notice_no"));
					bdto.setName(rs.getString("name"));
					bdto.setSubject(rs.getString("subject"));
					bdto.setContent(rs.getString("content"));
					bdto.setInsert_date(rs.getDate("insert_date"));
					bdto.setBoard_count(rs.getInt("board_count"));
					arr.add(bdto);
				} return arr;
				

			}catch(Exception e){
				e.printStackTrace();
				return null;
			}finally{
				try{
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2){}
			}	
		}
	
	/**페이징 할떄 쓰기위한*/
	public int getTotalCnt(){
		try {
			conn=yb.db.YB_DB.getConn();
			String sql="SELECT COUNT(*) FROM NOTICE_BOARD";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			count=count==0?1:count;
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
		
	}
	

	//공지사항 글쓰기
	public int noticeWrite(noticeDTO dto){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql = "insert into NOTICE_BOARD values(notice_seq.nextval,'admin',?,?,sysdate,0)";

			ps = conn.prepareStatement(sql);		
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			int count = ps.executeUpdate();		
			return count;		

		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}	
	}
	
	/**본문 관련 메서드*/
	public noticeDTO noticeContent(int idx){
		
		noticeCount(idx); // 조회수 1 증가
		
		try {
			conn=yb.db.YB_DB.getConn();
			String sql="SELECT * FROM  NOTICE_BOARD WHERE NOTICE_NO=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			noticeDTO bdto = new noticeDTO();
			if(rs.next()){
				
				bdto.setNotice_no(rs.getInt("notice_no"));
				bdto.setName(rs.getString("name"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setContent(rs.getString("content"));
				bdto.setInsert_date(rs.getDate("insert_date"));
				bdto.setBoard_count(rs.getInt("board_count"));
				
			}
			return bdto;
		} catch (Exception e) {
		e.printStackTrace();
		return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	
	//글 삭제 관련 메서드
		public int noticeDelete(int idx){
			
			try{
				conn=yb.db.YB_DB.getConn();
				
				String sql = "delete from NOTICE_BOARD where NOTICE_NO=?";

				ps = conn.prepareStatement(sql);		
				ps.setInt(1, idx);			
				int count=ps.executeUpdate();		
				return count;		

			}catch(Exception e){
				e.printStackTrace();
				return -1;
			}finally{
				try{
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2){}
			}	
		} 
	
		//공지사항 업데이트
		public int noticeUpdate(noticeDTO dto){
			try{
				conn=yb.db.YB_DB.getConn();
				String sql = "UPDATE NOTICE_BOARD SET SUBJECT = ? , CONTENT = ? WHERE NOTICE_NO = ?";

				ps = conn.prepareStatement(sql);		
				ps.setString(1, dto.getSubject());
				ps.setString(2, dto.getContent());
				ps.setInt(3, dto.getNotice_no());  
				int count = ps.executeUpdate();		
				return count;		

			}catch(Exception e){
				e.printStackTrace();
				return -1;
			}finally{
				try{
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2){}
			}	
		}
	
	public void noticeCount(int idx) {
		try{
			conn=yb.db.YB_DB.getConn();
			String sql = "UPDATE NOTICE_BOARD SET BOARD_COUNT =  BOARD_COUNT + 1 WHERE NOTICE_NO = ?";

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
