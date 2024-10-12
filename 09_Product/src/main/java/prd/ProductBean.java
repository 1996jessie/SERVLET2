package prd;

public class ProductBean {
	private int id;
	private String name;
	private int price;
	private String company;
	private String regdate;
	
	public ProductBean() {
		
	}
	public ProductBean(int id, String name, int price, String company, String regdate) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.company = company;
		this.regdate = regdate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
