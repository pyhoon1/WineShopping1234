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
	private int size = 10;
	private int blockSize = 5;

	public void reviewWrite(Review review) {
		reviewDao.reviewWrite(review);

	}

	public void reviewDelete(int userId, int reviewId) {
		reviewDao.reviewDelete(userId, reviewId);

	}

	public ReviewtPage reviewList(int userId, int pageNum) {
		List<Review> reviewList = reviewDao.reviewList(userId, (pageNum - 1) * size, size);
		int count = reviewDao.reviewSize(userId);
		ReviewtPage reviewtPage = new ReviewtPage(reviewList, pageNum, count, size, blockSize);
		return reviewtPage;
	}

}
