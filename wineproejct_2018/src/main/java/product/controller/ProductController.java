package product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import matchfood.service.MatchFoodService;
import matchfood.vo.MatchFood;
import product.service.ProductService;
import product.vo.Product;
import product.vo.ProductPage;
import product.vo.ProductSearch;
import review.service.ReviewService;
import review.vo.ReviewtPage;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;

	@Autowired
	private MatchFoodService matchFoodservice;
	@Autowired
	private ReviewService reviewService;

	@RequestMapping(value = "/productList.do", method = RequestMethod.GET)
	public String getProductList(Model model, @RequestParam(value = "pageNum", required = false) int pageNum) {
		ProductPage productList = productService.getProductList(pageNum);
		model.addAttribute("productPage", productList);
		return "productListView";
	}

	@RequestMapping(value = "/productView.do", method = RequestMethod.GET)
	public String getProduct(Model model, HttpServletRequest req, @RequestParam("productId") int productId,
			@RequestParam("pageNum") int pageNum) {
		Product product = productService.getProduct(productId);
		ReviewtPage reviewtPage = reviewService.reviewList(productId, pageNum);
		String[] matchFoodId = product.getMatchFoodId().split(",");
		for (String string : matchFoodId) {
			System.out.println(string);
		}
		if (matchFoodId != null) {
			List<MatchFood> matchFoodList = new ArrayList<MatchFood>();
			for (int i = 0; i < matchFoodId.length; i++) {
				matchFoodList.add(matchFoodservice.getMatchFood(matchFoodId[i]));
			}

			req.getSession().setAttribute("matchFoodList", matchFoodList);
		}
		model.addAttribute("reviewPage", reviewtPage);
		model.addAttribute("product", product);
		return "product/productDetail";
	}

	@RequestMapping("/main.do")
	public String goMain(Model model) {
		List<Product> products = productService.manySaleProduct();
		model.addAttribute("products", products);
		return "main"; 
	}

	@RequestMapping("/searchList.do")
	public String searchList(Model model, @RequestParam(value = "condition", required = false) String condition,
			@RequestParam(value = "conditionType", required = false) String conditionType,
			@RequestParam(value = "startPrice", required = false) String startPrice,
			@RequestParam(value = "endPrice", required = false) String endPrice,
			@RequestParam(value = "arrangement", required = false) String arrangement,
			@RequestParam(value = "pageNum", required = false) int pageNum) {
		
		
		ProductPage productpage= productService.searchWine(pageNum, new ProductSearch(condition, conditionType, startPrice, endPrice, arrangement));
		
		ProductSearch search = new ProductSearch(condition, conditionType, startPrice, endPrice, arrangement);

		model.addAttribute("productPage", productpage);
		model.addAttribute("search", search);

		return "/product/searchList";
	}
}
