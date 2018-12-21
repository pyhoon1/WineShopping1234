package payment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import basket.service.BasketService;
import basket.vo.Basket;
import matchfood.service.MatchFoodService;
import matchfood.vo.MatchFood;
import payment.service.PaymentService;
import payment.vo.Payment;
import payment.vo.PaymentPage;
import product.service.ProductService;
import product.vo.Product;
import user.service.UserService;
import user.vo.User;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private UserService userService;
	@Autowired
	private BasketService basketService;
	@Autowired
	private MatchFoodService matchFoodService;
	@Autowired
	private ProductService productService;

	// 이름 결제시간 수단 금액
	@RequestMapping("/payment.do")
	public String payment(Model model, @RequestParam("name") String name, @RequestParam("paymentType") String method,
			@RequestParam("total") int total, @RequestParam("userId") int userId) {
		Map<String, Object> receipt = new HashMap<String, Object>();

		model.addAttribute("receipt", receipt);
		List<Basket> basketList = basketService.selectByUserId(userId);
		for (int i = 0; i < basketList.size(); i++) {
			paymentService
					.payment(new Payment(userId, basketList.get(i).getProductId(), basketList.get(i).getProductName(),
							basketList.get(i).getProductPrice(), basketList.get(i).getProductCount(),
							basketList.get(i).getProductImg(), basketList.get(i).getMatchFoodIdList(),
							basketList.get(i).getMatchFoodCount(), method, basketList.get(i).getTotal()));
		}
		userService.totalAmountUpdate(userId, total);
		int userTotal = paymentService.getUserTotal(userId);

		if (userTotal > 600000) {
			userService.RatingUpdate(userId, "A");
		} else if (userTotal > 400000) {
			userService.RatingUpdate(userId, "B");
		} else if (userTotal > 200000) {
			userService.RatingUpdate(userId, "C");
		} else {

		}
		receipt.put("name", name);
		receipt.put("method", method);
		receipt.put("total", total);
		model.addAttribute("receipt", receipt);
		basketService.deleteAll(userId);
		return "redirect:/mai	n.do";
	}

	@RequestMapping("/billingPage.do")
	public String billingPage(Model model, @RequestParam("userId") int userId) {
		List<Basket> basketList = basketService.getBasketList(userId);
		List<Product> productList = new ArrayList<Product>();
		int total = basketService.basketTotal(userId);
		for (int i = 0; i < basketList.size(); i++) {
			productList.add(productService.getProduct(basketList.get(i).getProductId()));
			if (basketList.get(i).getMatchFoodIdList() != null) {
				String[] matchFoodId = basketList.get(i).getMatchFoodIdList().split(",");
				String[] matchFoodCount = basketList.get(i).getMatchFoodCount().split(",");
				List<MatchFood> matchFoodList = new ArrayList<MatchFood>();
				for (int j = 0; j < matchFoodId.length; j++) {
					if (!matchFoodId.equals("0")) {
						MatchFood matchFood = matchFoodService.getMatchFood(matchFoodId[j]);
						matchFood.setCount(matchFoodCount[j]);
						matchFoodList.add(matchFood);
					}
					model.addAttribute("matchFoodList" + basketList.get(i).getBasketId(), matchFoodList);
				}
			}
		}
		model.addAttribute("total", total);
		model.addAttribute("basketList", basketList);
		return "product/billingPage";
	}

	@RequestMapping("/myPage.do")
	public String paymentPage(Model model, @RequestParam("pageNum") int pageNum, @RequestParam("userId") int userId) {
		User user = userService.selectByUserId(userId);

		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		model.addAttribute("errors", errors);

		if (user == null) {
			errors.put("NotFoundUser", true);
			return "error/myPageErrorPage";
		}
		if (!errors.isEmpty()) {
			errors.put("badError", true);
			return "error/myPageErrorPage";
		}
		PaymentPage paymentPage = paymentService.getPaymentList(pageNum, userId);
		if (paymentPage.equals("") || paymentPage.equals(null)) {
			return "user/paymentView";
		}
		for (int i = 0; i < paymentPage.getPaymentList().size(); i++) {
			if (paymentPage.getPaymentList().get(i).getMatchFoodIdList() != null) {
				String[] matchFoodId = paymentPage.getPaymentList().get(i).getMatchFoodIdList().split(",");
				String[] matchFoodCount = paymentPage.getPaymentList().get(i).getMatchFoodCount().split(",");
				List<MatchFood> matchFoodList = new ArrayList<MatchFood>();
				for (int j = 0; j < matchFoodId.length; j++) {
					MatchFood matchFood = matchFoodService.getMatchFood(matchFoodId[j]);
					matchFood.setCount(matchFoodCount[j]);
					matchFoodList.add(matchFood);
				}
				model.addAttribute("matchFoodList" + paymentPage.getPaymentList().get(i).getPaymentId(), matchFoodList);
			}

		}
		model.addAttribute("paymentPage", paymentPage);
		return "user/myPage";
	}
}
