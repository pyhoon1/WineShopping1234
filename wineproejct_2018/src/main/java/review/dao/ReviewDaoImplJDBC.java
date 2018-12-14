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
		// TODO Auto-generated method stub

	}

	public void reviewDelete(int userId, int reviewId) {
		// TODO Auto-generated method stub

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
