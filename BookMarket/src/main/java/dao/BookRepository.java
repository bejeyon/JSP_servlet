package dao;

import dto.Book;

import java.util.ArrayList;

public class BookRepository {
	private ArrayList<Book> listOfBooks = new ArrayList<Book>();

	public BookRepository() {
		Book b0001 = new Book("B0001", "Hello Coding HTML5+CSS3", 19800);
		b0001.setAuthor("황재호");
		b0001.setDescription("워드나 PPT 문서를 만들 수 있나요? 그러면 문제 없습니다. 지금 바로 웹페이지 제작에 도전해보세요."
				+ " 지금 당장 컴퓨터가 없어도 괜찮습니다. 코드와 실행화면이 바로 보여서 눈으...");
		b0001.setPublisher("한빛미디어");
		b0001.setCategory("[IT모바일]");
		b0001.setUnitsInStock(100);
		b0001.setTotalPages(288);
		b0001.setReleaseDate("2018년 03월 02일");
		b0001.setCondition("New");

		
		Book b0002 = new Book("B0002", "쉽게 배우는 자바 프로그래밍", 29000);
		b0002.setAuthor("우종정");
		b0002.setDescription("객체 지향의 핵심과 자바의 현대적 기능을 충실히 다루면서도 초보자가 쉽게 학습할 수 있게 구성했습니다."
				+ " 시각화 도구를 활용한 개념 설명과 군더더기 없는 핵심 코들르 통해 개념과 구현...");
		b0002.setPublisher("한빛아카데미");
		b0002.setCategory("[IT모바일]");
		b0002.setUnitsInStock(200);
		b0002.setTotalPages(780);
		b0002.setReleaseDate("2020년 11월 22일");
		b0002.setCondition("New");

		
		Book b0003 = new Book("B0003", "스프링4 입문", 30000);
		b0003.setAuthor("하세가와 유이치, 오오노 와타루, 토키 코헤이(권은철, 전민수)");
		b0003.setDescription("스프링은 단순히 사용 방법만 익히는 것보다 아키텍처를 어떻게 이해하고 설계하는지가 더 중요합니다."
				+ " 예제를 복사해 붙여넣는 식으로는 실제 개발에서 스프링을 제대로 활용할 수 없습니다...");
		b0003.setPublisher("한빛미디어");
		b0003.setCategory("[IT모바일]");
		b0003.setUnitsInStock(300);
		b0003.setTotalPages(520);
		b0003.setReleaseDate("2017년 11월 01일");
		b0003.setCondition("Old");

		
		listOfBooks.add(b0001);
		listOfBooks.add(b0002);
		listOfBooks.add(b0003);
	}
	
	public ArrayList<Book> getAllBooks() {
		return listOfBooks;
	}
	
	public Book getBookById(String productId) {
		Book bookById = null;
		
		for (int i = 0; i < listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if (book != null && book.getBookId() != null && book.getBookId().equals(productId)) {
				bookById = book;
				break;
			}
		}
		
		return bookById;
	}
	
}
