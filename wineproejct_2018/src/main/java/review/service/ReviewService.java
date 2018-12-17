package review.service;

import review.vo.Review;
import review.vo.ReviewtPage;

public interface ReviewService {
	public ReviewtPage userReviewList(int userId, int pageNum);

	public void reviewUpdate(int userId, int reviewId);

	public void reviewWrite(Review review);
	
	public ReviewtPage reviewList(int productId, int pageNum);

}
