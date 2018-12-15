package review.dao;

import java.util.List;
import java.util.Map;

import review.vo.Review;

@ReviewAnnotMapper
public interface ReviewMapper {

	public List<Review> userReviewList(Map<String, Integer> reviewPage);

	public void reviewDelete(Map<String, Integer> review);

	public void reviewWrite(Review review);

	public int userReviewSize(int userId);

	public int productReviewSize(int productId);

	public List<Review> reviewList(Map<String, Integer> reviewPage);

}
