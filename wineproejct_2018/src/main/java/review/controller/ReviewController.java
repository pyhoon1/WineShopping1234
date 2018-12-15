package review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import review.service.ReviewService;
import review.vo.Review;
import review.vo.ReviewtPage;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@RequestMapping("/form.do")
	public String form(@RequestParam("productId") int productId) {
		return "redirect:/productView.do?productId="+productId;
	}
	@RequestMapping("/reviewWrite.do")
	public String reviewWrite(@RequestParam("productId") int productId, @RequestParam("userId") int userId,
			@RequestParam("loginId") String loginId, @RequestParam("productName") String productName,
			@RequestParam("content") String content) {
		reviewService.reviewWrite(new Review(productId, userId, loginId, productName, content));
		return "redirect:/form.do?productId="+productId;
	}

	@RequestMapping("/reviewDelete.do")
	public String reviewDelete(@RequestParam("userId") int userId, @RequestParam("reviewId") int reviewId) {
		reviewService.reviewDelete(userId, reviewId);
		return null;
	}

	@RequestMapping("/reviewList.do")
	public String reviewList(Model model, @RequestParam("userId") int userId, @RequestParam("pageNum") int pageNum) {
		ReviewtPage reviewtPage = reviewService.reviewList(userId, pageNum);
		model.addAttribute("reviewtPage", reviewtPage);
		return null;
	}
}
