package payment.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("Payment")
public class Payment {
	private int paymentId;
	private int userId;
	private int productId;
	private String productName;
	private int productPrice;
	private int productCount;
	private String productImg;
	private String matchFoodIdList;
	private String matchFoodCount;
	private String method;
	private LocalDateTime pDay;
	private int total;

	public Payment() {

	}

	public Payment(int paymentId, int userId, int productId, String productName, int productPrice, int productCount,
			String productImg, String matchFoodIdList, String matchFoodCount, String method, LocalDateTime pDay,
			int total) {
		super();
		this.paymentId = paymentId;
		this.userId = userId;
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productCount = productCount;
		this.productImg = productImg;
		this.matchFoodIdList = matchFoodIdList;
		this.matchFoodCount = matchFoodCount;
		this.method = method;
		this.pDay = pDay;
		this.total = total;
	}

	public Payment(int userId, int productId, String productName, int productPrice, int productCount, String productImg,
			String matchFoodIdList, String matchFoodCount, String method, int total) {
		super();
		this.userId = userId;
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productCount = productCount;
		this.productImg = productImg;
		this.matchFoodIdList = matchFoodIdList;
		this.matchFoodCount = matchFoodCount;
		this.method = method;
		this.total = total;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public String getMatchFoodIdList() {
		return matchFoodIdList;
	}

	public void setMatchFoodIdList(String matchFoodIdList) {
		this.matchFoodIdList = matchFoodIdList;
	}

	public String getMatchFoodCount() {
		return matchFoodCount;
	}

	public void setMatchFoodCount(String matchFoodCount) {
		this.matchFoodCount = matchFoodCount;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public LocalDateTime getpDay() {
		return pDay;
	}

	public void setpDay(LocalDateTime pDay) {
		this.pDay = pDay;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}