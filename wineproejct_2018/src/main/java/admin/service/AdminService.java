package admin.service;

import matchfood.vo.MatchFood;
import matchfood.vo.MatchFoodPage;
import payment.vo.PaymentPage;
import product.vo.Product;
import product.vo.ProductPage;
import review.vo.Review;
import review.vo.ReviewtPage;
import user.vo.User;
import user.vo.UsertPage;

public interface AdminService {

	// 회원 목록을 출력
	public UsertPage getUserList(int page);

	// 관리자 계정만 수정
	public int updateUser(User user);

	// 유저 검색 기능
	public UsertPage getSearchUserList(String condition, int page);

	// 유저 한명을 봄
	public User getUserView(int userId);

	// 회원 을 삭제함
	public void deleteUser(int userId);

	// 회원 수정 확인
	public int hasUserId(String loginId);

	// 상품 목록을 출력

	// 잘 맞는 음식 목록 출력
	public MatchFoodPage getMatchFoodList(int page);

	// 잘 맞는 음식이 이미 등록 됬었는지 출력
	public int hasMatchFood(String matchFoodName);

	// 와인이 이미 등록 되었는지 출력
	public int hasWine(String productName);

	// 검색한 상품만 출력
	public ProductPage getSearchProductList(String condition, int page);
	
	public ProductPage getProductList(int page);

	// 검색한 잘 맞는 음식 목록 출력
	public MatchFoodPage getSearchMatchFoodList(String condition, int page);

	// 잘 맞는 음식 삭제
	public void deleteMatchFood(int matchFoodId);

	// 잘 맞는 음식 수정
	public int updateMatchFood(MatchFood matchFood);

	// 상품 하나를 봄
	public Product getProductView(int productId);

	// 상품 하나를 수정함
	public int updateProduct(Product product);

	// 상품 하나를 삭제함
	public void deleteProduct(int productId);

	// 상품 하나를 등록함
	public void insertProduct(Product product);

	// 잘 맞는 음식을 하나 등록함
	public void insertMatchFood(MatchFood matchFood);

	// 잘 맞는 음식 하나를 봄
	public MatchFood getMatchFoodView(int matchFoodId);

	// 리뷰 목록을 봄
	public ReviewtPage getReviewList(int page);

	// 유저 하나의 리뷰 현황을 봄
	public ReviewtPage getReviewUser(int userId, int page);

	// 리뷰에 경고를 줌
	public void updateReviewWarning(Review review);

	// 리뷰를 삭제함
	public void deleteReview(int reviewId);

	// 결제 현황을 볼수 있음
	public PaymentPage getPaymentList(int page);

	// 유저 하나의 결제 현황을 봄
	public PaymentPage getPaymentUser(int userId, int page);

}
