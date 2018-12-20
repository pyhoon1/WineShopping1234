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
import user.service.UserService;

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

	// 이름 결제시간 수단 금액
	@RequestMapping("/payment.do")
	public String payment(Model model, @RequestParam("name") String name, @RequestParam("method") String method,
			@RequestParam("total") int total, @RequestParam("userId") int userId) {
		Map<String, Object> receipt = new HashMap<String, Object>();

		model.addAttribute("receipt", receipt);
		List<Basket> basketList = basketService.selectByUserId(userId);
		for (int i = 0; i < basketList.size(); i++) {
			paymentService.payment(new Payment(userId, basketList.get(i).getProductId(),
					basketList.get(i).getProductName(), basketList.get(i).getProductPrice(),
					basketList.get(i).getProductCount(), basketList.get(i).getProductImg(),
					basketList.get(i).getMatchFoodIdList(), basketList.get(i).getMatchFoodCount(), method));
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
		return null;
	}

	@RequestMapping("/paymentView.do")
	public String paymentPage(Model model, @RequestParam("pageNum") int pageNum, @RequestParam("userId") int userId) {
		PaymentPage paymentPage = paymentService.getPaymentList(pageNum, userId);

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
		return "user/paymentView";
	}
}
