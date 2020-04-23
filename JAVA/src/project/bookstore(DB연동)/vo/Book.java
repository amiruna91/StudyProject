package bookstore.vo;

import java.util.Date;

public class Book {

	private int no;
	private String title;
	private String writer;
	private String genre;
	private String publisher;
	private int price;
	private int discountPrice;
	private Date registeredDate;
	
	public Book() {}

	public int getNo() {
		return no;
	}

	public String getTitle() {
		return title;
	}

	public String getWriter() {
		return writer;
	}

	public String getGenre() {
		return genre;
	}

	public String getPublisher() {
		return publisher;
	}

	public int getPrice() {
		return price;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}
	
	
}
