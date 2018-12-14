package review.service;

import review.vo.Review;
import review.vo.ReviewtPage;

public interface ReviewService {
	public ReviewtPage reviewList(int userId, int pageNum);

	public void reviewDelete(int userId, int reviewId);

	public void reviewWrite(Review review);

}
