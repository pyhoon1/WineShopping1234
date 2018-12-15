package review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import review.vo.Review;

@Repository("reviewDao")
public class ReviewDaoImplJDBC implements ReviewDao {

	@Autowired
	private ReviewMapper reviewMapper;

	public void reviewWrite(Review review) {
		reviewMapper.reviewWrite(review);

	}

	public void reviewDelete(int userId, int reviewId) {
		Map<String, Integer> review = new HashMap<String, Integer>();
		review.put("userId", userId);
		review.put("reviewId", reviewId);
		reviewMapper.reviewDelete(review);

	}

	public List<Review> reviewList(int userId, int startRow, int size) {
		Map<String, Integer> reviewPage = new HashMap<String, Integer>();
		reviewPage.put("userId", userId);
		reviewPage.put("startRow", startRow);
		reviewPage.put("size", size);
		List<Review> reviewList = reviewMapper.reviewList(reviewPage);
		return reviewList;
	}

	public int reviewSize(int userId) {
		int count = reviewMapper.reviewSize(userId);
		return count;
	}

}
