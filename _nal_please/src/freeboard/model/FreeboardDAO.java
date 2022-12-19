package freeboard.model;

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
	
	
	
}
