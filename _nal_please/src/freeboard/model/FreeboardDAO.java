package freeboard.model;

import java.util.ArrayList;

public class FreeboardDAO {
	
	private static FreeboardDAO instance;

	private FreeboardDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	private static FreeboardDAO getInstance() {
		if(instance == null) {
			instance = new FreeboardDAO();
		}
		return instance;
	}
	
	public int getFreeboardListCount() {
		int freeboardlistcnt = 0;
		
		return freeboardlistcnt;
	}
	
	public ArrayList<FreeboardVO> getFreeboardList() {
		ArrayList<FreeboardVO> volist = null;
		
		return volist;
	}
	
	public void updateHit(int articleno) {
		
	}
	
	public FreeboardVO getArticleByArticleno(int articleno, int page) {
		FreeboardVO vo = new FreeboardVO();
		
		return vo;
	}

	public String getLoginNameById(String id) {
		String loginname = null;
		
		return loginname;
	}
	
	public void insertArticle(FreeboardVO vo) {
		
	}
		
	public void updateArticle(FreeboardVO vo) {
		
	}
	
	public void deleteArticle(int articleno) {
		
	}
	
}
