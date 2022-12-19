package utill;

import java.util.ArrayList;

public class DBtest {

	public static void main(String[] args) {
	    GuideDAO dao = GuideDAO.getInstance();
	    System.out.println("DB연동 성공");
	    
	    ArrayList<GuideVO> volist = dao.listGuide();
	    GuideVO vo = volist.get(0);
	    String guideintro = vo.getGuide_intro();
		System.out.println(guideintro);

		String result = dao.listGuide().get(1).getGuide_intro();
		System.out.println(result);
	}

}
