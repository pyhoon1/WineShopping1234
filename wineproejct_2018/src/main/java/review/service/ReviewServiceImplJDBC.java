package review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import review.dao.ReviewDao;
import review.vo.Review;
import review.vo.ReviewtPage;

@Service("reviewService")
public class ReviewServiceImplJDBC implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;
	private int size = 4;
	private int blockSize = 5;

	public void reviewWrite(Review review) {
		reviewDao.reviewWrite(review);

	}

	public void reviewDelete(int userId, int reviewId) {
		reviewDao.reviewDelete(userId, reviewId);

	}

	public ReviewtPage userReviewList(int userId, int pageNum) {
		List<Review> reviewList = reviewDao.userReviewList(userId, (pageNum - 1) * size, size);
		int count = reviewDao.userReviewSize(userId);
		ReviewtPage reviewtPage = new ReviewtPage(reviewList, pageNum, count, size, blockSize);
		return reviewtPage;
	}

	public ReviewtPage reviewList(int productId, int pageNum) {
		List<Review> reviewList = reviewDao.reviewList(productId, (pageNum - 1) * size, size);
		int count = reviewDao.productReviewSize(productId);
		ReviewtPage reviewtPage = new ReviewtPage(reviewList, pageNum, count, size, blockSize);
		return reviewtPage;
	}

}
