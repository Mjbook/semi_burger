package board.img;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class imgDAO {
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
	public ArrayList<imgDTO> imgList(int cp, int ls){
			
		try{
			conn=yb.db.YB_DB.getConn();
			String sql="SELECT * FROM  IMG_BOARD ORDER BY IMG_BOARD_NO DESC";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				
				ArrayList<imgDTO> arr=new ArrayList<imgDTO>();
				
				while(rs.next()){
					imgDTO bdto = new imgDTO();
					bdto.setImg_board_no(rs.getInt("Img_board_no"));
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
			String sql="SELECT COUNT(*) FROM IMG_BOARD";
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
	public int imgWrite(imgDTO dto){
		try{
			conn=yb.db.YB_DB.getConn();
			String sql = "insert into IMG_BOARD values(img_seq.nextval,'admin',?,?,sysdate,0)";

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
	public imgDTO imgContent(int idx){
		
		imgCount(idx); // 조회수 1 증가
		
		try {
			conn=yb.db.YB_DB.getConn();
			String sql="SELECT * FROM  IMG_BOARD WHERE IMG_BOARD_NO=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			imgDTO bdto = new imgDTO();
			if(rs.next()){
				
				bdto.setImg_board_no(rs.getInt("Img_board_no"));
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
		public int imgDelete(int idx){
			
			try{
				conn=yb.db.YB_DB.getConn();
				
				String sql = "delete from IMG_BOARD where IMG_BOARD_NO=?";

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
		public int imgUpdate(imgDTO dto){
			try{
				conn=yb.db.YB_DB.getConn();
				String sql = "UPDATE IMG_BOARD SET SUBJECT = ? , CONTENT = ? WHERE IMG_BOARD_NO = ?";

				ps = conn.prepareStatement(sql);		
				ps.setString(1, dto.getSubject());
				ps.setString(2, dto.getContent());
				ps.setInt(3, dto.getImg_board_no());  
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
	
	public void imgCount(int idx) {
		try{
			conn=yb.db.YB_DB.getConn();
			String sql = "UPDATE IMG_BOARD SET BOARD_COUNT =  BOARD_COUNT + 1 WHERE IMG_BOARD_NO = ?";

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
