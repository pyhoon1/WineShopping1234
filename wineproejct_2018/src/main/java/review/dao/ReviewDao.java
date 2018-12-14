package review.dao;

import java.util.List;

import review.vo.Review;

public interface ReviewDao {
	public List<Review> reviewList(int userId, int startRow, int size);

	public void reviewDelete(int userId, int reviewId);

	public void reviewWrite(Review review);

	public int reviewSize(int userId);
}
