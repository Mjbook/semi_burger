package board.knowhow;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class knowhowDAO {
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
	public ArrayList<knowhowDTO> knowhowList(int cp, int ls){
			
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="SELECT * FROM MY_KNOWHOW ORDER BY KNOWHOW_NO DESC";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				
				ArrayList<knowhowDTO> arr=new ArrayList<knowhowDTO>();
				
				while(rs.next()){
					knowhowDTO bdto = new knowhowDTO();
					bdto.setKnowhow_no(rs.getInt("knowhow_no"));
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
			String sql="SELECT COUNT(*) FROM MY_KNOWHOW";
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
	public int knowhowWrite(knowhowDTO dto){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql = "insert into MY_KNOWHOW values(my_knowhow_seq.nextval,?,?,?,sysdate,0,'')";

			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getSubject());
			ps.setString(3, dto.getContent());
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
	public knowhowDTO knowhowContent(int idx){
		
		knowhowCount(idx); // 조회수 1 증가
		
		try {
			conn=yb.db.YB_DB.getConn();
			String sql="SELECT * FROM MY_KNOWHOW WHERE knowhow_no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			knowhowDTO bdto = new knowhowDTO();
			if(rs.next()){
				
				bdto.setKnowhow_no(rs.getInt("knowhow_no"));
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
		public int knowhowDelete(int idx){
			
			try{
				conn=yb.db.YB_DB.getConn();
				
				String sql = "delete from MY_KNOWHOW where KNOWHOW_NO=?";

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
		public int knowhowUpdate(knowhowDTO dto){
			try{
				conn=yb.db.YB_DB.getConn();
				String sql = "UPDATE MY_KNOWHOW SET SUBJECT = ? , CONTENT = ? WHERE KNOWHOW_NO = ?";

				ps = conn.prepareStatement(sql);		
				ps.setString(1, dto.getSubject());
				ps.setString(2, dto.getContent());
				ps.setInt(3, dto.getKnowhow_no());  
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
	
	public void knowhowCount(int idx) {
		try{
			conn=yb.db.YB_DB.getConn();
			String sql = "UPDATE MY_KNOWHOW SET BOARD_COUNT =  BOARD_COUNT + 1 WHERE KNOWHOW_NO = ?";

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
