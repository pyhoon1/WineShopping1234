package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import matchfood.vo.MatchFood;
import payment.vo.Payment;
import product.vo.Product;
import review.vo.Review;
import user.vo.User;

@Repository("adminDao")
public class AdminDaoImplJDBC implements AdminDao {

	@Autowired
	private AdminMapper adminMapper;

	public List<User> readUserAll(int startRow, int size) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("startRow", startRow);
		page.put("size", size);
		List<User> user = adminMapper.getUserList(page);
		return user;
	}

	public List<User> readSearchUserAll(String condition, int startRow, int size) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("condition", condition);
		page.put("startRow", startRow);
		page.put("size", size);
		List<User> user = adminMapper.getSearchUserList(page);

		return user;
	}

	public void deleteUser(int userId) {
		adminMapper.deleteUser(userId);
	}

	public List<Product> readProductAll(int startRow, int size) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("startRow", startRow);
		page.put("size", size);
		List<Product> product = adminMapper.getProductList(page);
		return product;
	}

	public Product readProduct(int productId) {
		Product product = adminMapper.getProductView(productId);
		return product;
	}

	public int updateProduct(Product product) {
		int check = adminMapper.updateProduct(product);
		return check;
	}

	public void deleteProduct(int productId) {
		adminMapper.deleteProduct(productId);
	}

	public void insertProduct(Product product) {
		adminMapper.insertProduct(product);
	}

	public List<Review> readReviewAll(int startRow, int size) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("startRow", startRow);
		page.put("size", size);
		List<Review> review = adminMapper.getReviewList(page);
		return review;
	}

	public void updateReviewWarning(Review review) {
		adminMapper.updateReviewWarning(review);

	}

	public void deleteReview(int reviewId) {
		adminMapper.deleteReview(reviewId);
	}

	public List<Payment> readPaymentAll(int startRow, int size) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("startRow", startRow);
		page.put("size", size);
		List<Payment> payment = adminMapper.getPaymentList(page);
		return payment;
	}

	public int updateUser(User user) {
		int update = adminMapper.updateUser(user);
		return update;

	}

	public List<Review> readReviewUser(int userId, int startRow, int size) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("userId", userId);
		page.put("startRow", startRow);
		page.put("size", size);
		List<Review> review = adminMapper.getReviewUser(page);
		return review;
	}

	public List<Payment> readPaymentUser(int userId, int startRow, int size) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("userId", userId);
		page.put("startRow", startRow);
		page.put("size", size);
		List<Payment> payment = adminMapper.getPaymentUser(page);
		return payment;
	}

	public User readUser(int userId) {
		User user = adminMapper.getUserView(userId);
		return user;
	}

	public int hasUserId(String loginId) {
		int hasUser = adminMapper.hasUserId(loginId);
		return hasUser;
	}

	public List<MatchFood> readMatchFoodPAll(int startRow, int size) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("startRow", startRow);
		page.put("size", size);
		List<MatchFood> matchfood = adminMapper.getMatchFoodPList(page);
		return matchfood;
	}

	public List<Product> readSearchProductFoodAll(String condition, int startRow, int size) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("condition", condition);
		page.put("startRow", startRow);
		page.put("size", size);
		List<Product> product = adminMapper.getSearchProductList(page);
		return product;
	}

	public List<MatchFood> readSearchMatchFoodAll(String condition, int startRow, int size) {
		Map<String, Object> page = new HashMap<String, Object>();
		page.put("condition", condition);
		page.put("startRow", startRow);
		page.put("size", size);

		List<MatchFood> matchfood = adminMapper.getSearchMatchFoodList(page);
		return matchfood;
	}

	public int hasMatchFood(String matchFoodName) {
		int hasMatchFood = adminMapper.hasMatchFood(matchFoodName);
		return hasMatchFood;
	}

	public void insertMatchFood(MatchFood matchFood) {
		adminMapper.insertMatchFood(matchFood);
	}

	public void deleteMatchFood(int matchFoodId) {
		adminMapper.deleteMatchFood(matchFoodId);
	}

	public int updateMatchFood(MatchFood matchFood) {
		int update = adminMapper.updateMatchFood(matchFood);
		return update;
	}

	public MatchFood readMatchFood(int matchFoodId) {
		MatchFood matchfood = adminMapper.getMatchFoodView(matchFoodId);
		return matchfood;
	}

	public int hasWine(String productName) {
		int check = adminMapper.hasWine(productName);
		return check;
	}



	public int paymentCount() {
		// TODO Auto-generated method stub
		return adminMapper.paymentCount();
	}

	public int matchFoodCount() {
		// TODO Auto-generated method stub
		return adminMapper.matchFoodCount();
	}

	public int productCount() {
		// TODO Auto-generated method stub
		return adminMapper.productCount();
	}

	public int reviewCount() {
		
		return adminMapper.reviewCount();
	}

	public int userCount() {
		// TODO Auto-generated method stub
		return adminMapper.userCount();
	}

	public int productSearch(String condition) {
		
		return adminMapper.productSearch(condition);
	}

	public int matchFoodSearch(String condition) {
		// TODO Auto-generated method stub
		return adminMapper.matchFoodSearch(condition);
	}

	public int userSearch(String condition) {

		return adminMapper.userSearch(condition);
	}

	public List<MatchFood> readMatchFoodAll() {
		List<MatchFood> matchfood = adminMapper.getMatchFoodList();
		return matchfood;
	}

}
