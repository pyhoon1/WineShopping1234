package admin.dao;

import java.util.List;
import java.util.Map;

import matchfood.vo.MatchFood;
import payment.vo.Payment;
import product.vo.Product;
import review.vo.Review;
import user.vo.User;

@AdminAnnotMapper
public interface AdminMapper {
	
	//유저 맵퍼 
	List<User> getUserList(Map<String, Object> page); 
	void deleteUser(int userId);
	// int updateUser(User user);
	User getUserView(int userId);
	int hasUserId(String loginId);
	List<User> getSearchUserList(Map<String, Object> page);/*String condition*/
	
	//상품 맵퍼
	List<Product> getProductList(Map<String, Object> page);
	List<Product> getSearchProductList(Map<String, Object> page);/*String condition*/
	void insertProduct(Product product);
	int updateProduct(Product product);
	void deleteProduct(int productId);
	Product getProductView(int productId);
	List<MatchFood> getMatchFoodPList(Map<String, Object> page); 
	List<MatchFood> getMatchFoodList();
	List<MatchFood> getSearchMatchFoodList(Map<String, Object> page);/*String condition*/
	int hasMatchFood(String matchFoodName);
	void insertMatchFood(MatchFood matchFood);
	void deleteMatchFood(int matchFoodId);
	int updateMatchFood(MatchFood matchFood);
	MatchFood getMatchFoodView(int matchFoodId);
	int hasWine(String productName);
	 
	//리뷰 관련
	List<Review> getReviewList(Map<String, Object> page);
	void updateReviewWarning(Review review);
	void deleteReview(int reviewId);
	List<Review> getReviewUser(Map<String, Object> page);
	
	//결제 관련
	List<Payment> getPaymentList(Map<String, Object> page);
	List<Payment> getPaymentUser(Map<String, Object> page);	/*int userId*/
	
	int paymentCount();
	int matchFoodCount();
	int productCount();
	int reviewCount();
	int userCount();
	
	int productSearch(String condition);
	int matchFoodSearch(String condition);
	int userSearch(String condition);
}
