package basket.controller;

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
import product.service.ProductService;
import product.vo.Product;
import user.service.UserService;
import user.vo.User;

@Controller
public class BasketController {
	@Autowired
	private BasketService basketService;
	@Autowired
	private MatchFoodService matchFoodService;
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;

	@RequestMapping("/userBasket.do")
	public String goUserbasket() {
		return "user/userBasket";
	}

	@RequestMapping("/getBasketList.do")
	public String getBasketList(Model model, @RequestParam("userId") int userId) {
		List<Basket> basketList = basketService.getBasketList(userId);
		if (basketList.isEmpty()) {
			return "user/userBasket";
		}
		List<Product> productList = new ArrayList<Product>();
		int total = basketService.basketTotal(userId);
		for (int i = 0; i < basketList.size(); i++) {
			productList.add(productService.getProduct(basketList.get(i).getProductId()));
			if (basketList.get(i).getMatchFoodIdList() != null) {
				String[] matchFoodId = basketList.get(i).getMatchFoodIdList().split(",");
				String[] matchFoodCount = basketList.get(i).getMatchFoodCount().split(",");
				List<MatchFood> matchFoodList = new ArrayList<MatchFood>();
				for (int j = 0; j < matchFoodId.length; j++) {
					if (!matchFoodCount.equals("0")) {
						MatchFood matchFood = matchFoodService.getMatchFood(matchFoodId[j]);
						matchFood.setCount(matchFoodCount[j]);
						matchFoodList.add(matchFood);
					}
					model.addAttribute("matchFoodList" + basketList.get(i).getBasketId(), matchFoodList);
				}
			}
		}

		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		model.addAttribute("errors", errors);

		User userCheck = userService.selectByUserId(userId);

		if (userCheck == null) {
			errors.put("NotFoundUser", true);
			return "error/myPageErrorPage";
		}
		if (!errors.isEmpty()) {
			errors.put("badError", true);
			return "error/myPageErrorPage";
		}

		model.addAttribute("total", total);
		model.addAttribute("basketList", basketList);
		return "user/userBasket";
	}

	@RequestMapping("/insertProductMatchFood.do")
	public String insertProductMatchFood(@RequestParam("userId") int userId, @RequestParam("productId") int productId,
			@RequestParam("productName") String productName, @RequestParam("productPrice") int productPrice,
			@RequestParam("productCount") int productCount, @RequestParam("productImg") String productImg,
			@RequestParam("matchFoodIdList") String matchFoodIdList,
			@RequestParam("matchFoodCount") String matchFoodCount, @RequestParam("total") int total) {
		basketService.insertProductMatchFood(new Basket(userId, productId, productName, productPrice, productCount,
				productImg, matchFoodIdList, matchFoodCount, total));
		return "redirect:/main.do";
	}

	@RequestMapping("/deleteOne")
	public String deleteOne(@RequestParam("basketId") int basketId, @RequestParam("userId") int userId) {
		basketService.deleteOne(basketId);
		return "redirect:/getBasketList.do?userId=" + userId;
	}

	@RequestMapping("/deleteAll.do")
	public String deleteAll(@RequestParam("userId") int userId) {
		basketService.deleteAll(userId);
		return "productListView";
	}
	/*
	 * @RequestMapping("/deleteProduct.do") public String
	 * deleteProduct(@RequestParam("userId") int userId, @RequestParam("productId")
	 * int productId) { basketService.deleteProduct(new Basket(userId, productId));
	 * return "productListView";
	 * 
	 * }
	 */

}
