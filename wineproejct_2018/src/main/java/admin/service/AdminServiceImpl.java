package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.AdminDao;
import basket.vo.Basket;
import basket.vo.BasketPage;
import matchfood.vo.MatchFood;
import matchfood.vo.MatchFoodPage;
import payment.vo.Payment;
import payment.vo.PaymentPage;
import product.vo.Product;
import product.vo.ProductPage;
import review.vo.Review;
import review.vo.ReviewtPage;
import user.vo.User;
import user.vo.UsertPage;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao admin;
	private int size = 5;
	private int blockSize = 5;

	public UsertPage getUserList(int pageNum) {
		List<User> user = admin.readUserAll((pageNum - 1) * size, size);
		int count = admin.userCount();
		UsertPage usertPage = new UsertPage(user, pageNum, count, size, blockSize);
		return usertPage;
	}

	public void deleteUser(int userId) {
		admin.deleteUser(userId);

	}

	public ProductPage tProductList(int pageNum) {
		List<Product> produdct = admin.readProductAll((pageNum - 1) * size, size);
		int count = admin.productCount();
		ProductPage productPage = new ProductPage(produdct, pageNum, count, size, blockSize);
		return productPage;
	}

	public UsertPage getSearchUserList(String condition, int pageNum) {
		List<User> user = admin.readSearchUserAll(condition, (pageNum - 1) * size, size);
		int count = admin.userSearch(condition);
		UsertPage usertPage = new UsertPage(user, pageNum, count, size, blockSize);
		return usertPage;
	}

	public Product getProductView(int productId) {
		return admin.readProduct(productId);
	}

	public int updateProduct(Product product) {
		int check = admin.updateProduct(product);
		return check;
	}

	public void deleteProduct(int productId) {
		admin.deleteProduct(productId);
	}

	public void insertProduct(Product product) {
		admin.insertProduct(product);

	}

	public MatchFoodPage getMatchFoodList(int pageNum) {
		List<MatchFood> matchFoods = admin.readMatchFoodAll((pageNum - 1) * size, size);
		int count = admin.matchFoodCount();
		MatchFoodPage matchFoodPage = new MatchFoodPage(matchFoods, pageNum, count, size, blockSize);
		return matchFoodPage;
	}

	public ReviewtPage getReviewList(int pageNum) {
		List<Review> review = admin.readReviewAll((pageNum - 1) * size, size);
		int count = admin.reviewCount();
		ReviewtPage reviewtPage = new ReviewtPage(review, pageNum, count, size, blockSize);
		return reviewtPage;
	}

	public void updateReviewWarning(Review review) {
		admin.updateReviewWarning(review);

	}

	public void deleteReview(int reviewId) {
		admin.deleteReview(reviewId);
	}

	public PaymentPage getPaymentList(int pageNum) {
		List<Payment> payment = admin.readPaymentAll((pageNum - 1) * size, size);
		int count = admin.paymentCount();
		PaymentPage paymentPage = new PaymentPage(payment, pageNum, count, size, blockSize);
		return paymentPage;
	}

	public int updateUser(User user) {
		int update = admin.updateUser(user);
		return update;

	}

	public User getUserView(int userId) {
		User user = admin.readUser(userId);
		return user;
	}

	public ProductPage getProductList(int pageNum) {
		List<Product> products = admin.readProductAll((pageNum - 1) * size, size);
		int count = admin.productCount();
		ProductPage productPage = new ProductPage(products, pageNum, count, size, blockSize);
		return productPage;
	}

	public ReviewtPage getReviewUser(int userId, int pageNum) {
		List<Review> review = admin.readReviewUser(userId, (pageNum - 1) * size, size);
		int count = admin.reviewCount();
		ReviewtPage reviewtPage = new ReviewtPage(review, pageNum, count, size, blockSize);
		return reviewtPage;
	}

	public PaymentPage getPaymentUser(int userId, int pageNum) {
		List<Payment> payment = admin.readPaymentUser(userId, (pageNum - 1) * size, size);
		int count = admin.paymentCount();
		PaymentPage paymentPage = new PaymentPage(payment, pageNum, count, size, blockSize);
		return paymentPage;
	}

	public int hasUserId(String loginId) {
		int hasUserId = admin.hasUserId(loginId);
		return hasUserId;
	}

	public ProductPage getSearchProductList(String condition, int pageNum) {
		List<Product> product = admin.readSearchProductFoodAll(condition, (pageNum - 1) * size, size);
		int count = admin.productSearch(condition);
		ProductPage productPage = new ProductPage(product, pageNum, count, size, blockSize);
		return productPage;
	}

	public MatchFoodPage getSearchMatchFoodList(String condition, int pageNum) {
		List<MatchFood> matchfood = admin.readSearchMatchFoodAll(condition, (pageNum - 1) * size, size);
		int count = admin.matchFoodSearch(condition);
		MatchFoodPage matchFoodPage = new MatchFoodPage(matchfood, pageNum, count, size, blockSize);
		return matchFoodPage;
	}

	public int hasMatchFood(String matchFoodName) {
		int hasMatchFood = admin.hasMatchFood(matchFoodName);
		return hasMatchFood;
	}

	public void insertMatchFood(MatchFood matchfood) {
		admin.insertMatchFood(matchfood);

	}

	public void deleteMatchFood(int matchFoodId) {
		admin.deleteMatchFood(matchFoodId);

	}

	public int updateMatchFood(MatchFood matchFood) {
		int update = admin.updateMatchFood(matchFood);
		return update;
	}

	public MatchFood getMatchFoodView(int matchFoodId) {
		MatchFood matchfood = admin.readMatchFood(matchFoodId);
		return matchfood;
	}

	public int hasWine(String productName) {
		int check = admin.hasWine(productName);
		return check;
	}

}
