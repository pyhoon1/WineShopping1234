package review.dao;

import java.util.List;

import review.vo.Review;

public interface ReviewDao {
	public List<Review> userReviewList(int userId, int startRow, int size);

	public void reviewUpdate(int userId, int reviewId);

	public void reviewWrite(Review review);

	public int userReviewSize(int userId);

	public int productReviewSize(int productId);

	public List<Review> reviewList(int productId, int startRow, int size);
}
