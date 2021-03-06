package vo;

import java.util.Date;

public class Product {
	
	private int no;
	private String name;
	private String maker;
	private int price;
	private Date createDate;
	
	public Product() {}

	public Product(int no, String name, String maker, int price) {
		super();
		this.no = no;
		this.name = name;
		this.maker = maker;
		this.price = price;
		this.createDate = new Date();
	}

	public int getNo() {
		return no;
	}

	public String getName() {
		return name;
	}

	public String getMaker() {
		return maker;
	}

	public int getPrice() {
		return price;
	}
	
	public void setNo(int no) {
		this.no = no;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public void setPrice(int price) {
		this.price = price;
	};
	
	public Date getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + no;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (no != other.no)
			return false;
		return true;
	}
	
	
}
