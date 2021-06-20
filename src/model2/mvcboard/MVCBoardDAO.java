package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;


import common.ConnectionPool;


public class MVCBoardDAO extends ConnectionPool{
	
	
	public MVCBoardDAO(){
		super();
	}
	
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = " SELECT COUNT(*) FROM multiMVCBoard ";
		
		if(map.get("searchWord")!=null) {
			query += " WHERE " +map.get("searchField") + " " 
					+ " LIKE '%" +map.get("searchWord") + "%' "; 	
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1); 
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외발생");
			e.printStackTrace();
		}
		
		return totalCount;
		
	}
	
	
	
	public int flagCount(Map<String, Object> map) {
		int flagcount = 0;
		
		String query = " SELECT COUNT(*) FROM multiMVCBoard ";
		
		query += " WHERE flag " 
				+ " LIKE '%" +map.get("flag") + "%' "; 	
		
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			flagcount = rs.getInt(1); 
			System.out.println("flagcount :"+flagcount);
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외발생");
			e.printStackTrace();
		}
		
		return flagcount;
		
	}
	
	
	
	
	
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map){
		List<MVCBoardDTO> bbs = new Vector<MVCBoardDTO>();
		
		

		String query = " " +
				"select * from multiMVCBoard where ";
		
		if(map.get("searchWord")!=null) {
			query += " " + map.get("searchField") 
					+ " like '%" + map.get("searchWord") + "%' and ";
					
		}
		query += " flag like '%"+map.get("flag")+"%' "+
				" order by idx desc limit ?, ? "; 
		System.out.println("페이지 쿼리 : "+query);
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setPhotoflag(rs.getString("photoflag"));
				dto.setId(rs.getString("id"));
				dto.setFlag(rs.getString("flag"));
				bbs.add(dto);
				
				
			}
		} catch (Exception e) {
			System.out.println("게시물 조회중 예외발생");
			e.printStackTrace();
			
		}	
		return bbs;
	
	}
	
	
	
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;
		try {
			String query = " INSERT INTO multiMVCBoard ( "
				 +  "id, name, title, content, ofile,sfile,pass,flag ) "
				 + " VALUES ( "
				 + " ? ,?, ?, ?, ?, ?, ?,? ) ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getOfile());
			psmt.setString(6, dto.getSfile());
			psmt.setString(7, dto.getPass());
			psmt.setString(8, dto.getFlag());
			
			System.out.println("insert-sfile :"+dto.getSfile());
			
			result = psmt.executeUpdate();
		
		}catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	
	public int insertPhotoWrite(MVCBoardDTO dto) {
		int result = 0;
		try {
			String query = " INSERT INTO multiMVCBoard ( "
				 +  "id, name, title, content, ofile,sfile,pass,flag,photoflag ) "
				 + " VALUES ( "
				 + " ? ,?, ?, ?, ?, ?, ?,?,? ) ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getOfile());
			psmt.setString(6, dto.getSfile());
			psmt.setString(7, dto.getPass());
			psmt.setString(8, dto.getFlag());
			psmt.setString(9, dto.getPhotoflag());
			
			System.out.println("insert-sfile :"+dto.getSfile());
			
			result = psmt.executeUpdate();
		
		}catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	
	
	public MVCBoardDTO selectView(String idx) {
		MVCBoardDTO dto = new MVCBoardDTO();
		String query = " select * from multiMVCBoard where idx=? ";
		
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setId(rs.getString("id"));
				dto.setFlag(rs.getString("flag"));
				dto.setPhotoflag(rs.getString("photoflag"));
				
				System.out.println("rs.getString(sfile):"+rs.getString("sfile"));
				System.out.println("selectview-selectview-photoflag :"+rs.getString("photoflag"));
			
			}

		
		}catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
		
	}	
	
	
	
	public void updateVisitCount(String idx) {
		String query = " update multiMVCBoard set "
				+ " visitcount = visitcount+1 "
				+ " where idx=? ";
		
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, idx);
				psmt.executeQuery();
				
			}catch (Exception e) {
				System.out.println("게시물 조회수 증가 중 예외발생");
				e.printStackTrace();
			}
		
		
		
	}
	
	
	public boolean confirmPassword(String pass, String idx) {
		
		boolean isCorr = true;
		try {
			// 일련번호와 패스워드가 일치하는 게시물이 있는지 확인
			String sql = " select count(*) from multiMVCBoard where pass=? and idx=? ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) {
				// 패스워드가 일치하는 게시물이 없으므로  false
				isCorr = false;
			}
			
			
		} catch (Exception e) {
			// 예외가 발생하여 확인이 불가하므로 false
			isCorr = false;
			e.printStackTrace();
		}
		
		return isCorr;
		
		
		
	}
	
	
	// 수정 처리
	public int updatePost(MVCBoardDTO dto) {
		
		int result = 0;
		try {
			// 비회원제 게시판이므로 패스워드까지 where절에 추가함
			String query = " update multiMVCBoard set "
					+ " title=?, name=?, content=?, ofile=?, sfile=? ,photoflag=? "
					+ " where idx=? and pass=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPhotoflag());
			psmt.setString(7, dto.getIdx());
			psmt.setString(8, dto.getPass());
			
			result = psmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외발생");
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
public int adminUpdatePost(MVCBoardDTO dto) {
		
		int result = 0;
		try {
			// 비회원제 게시판이므로 패스워드까지 where절에 추가함
			String query = " update multiMVCBoard set "
					+ " title=?, name=?, content=?, ofile=?, sfile=? ,photoflag=? "
					+ " where idx=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPhotoflag());
			psmt.setString(7, dto.getIdx());
			//psmt.setString(8, dto.getPass());
			
			result = psmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외발생");
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	
	
	// 삭제처리
	public int deletePost(String idx) {
		int result = 0;
		try {
			// 비밀번호 검증 후 즉시 삭제되므로 비밀번호는 조건에서 제외한다.
			String query= " delete from multiMVCBoard where idx=? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	public void downCountPlus(String idx) {
		
		String sql = " update multiMVCBoard set "
				+ " downcount = downcount+1 "
				+ " where idx=? ";
		
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
			
		} catch (Exception e) {
		}
		
		
		
		
	}
	
	
	
	
}
