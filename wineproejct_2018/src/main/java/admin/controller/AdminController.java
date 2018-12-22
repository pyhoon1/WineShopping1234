package admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.service.AdminService;
import admin.upload.AdminUpload;
import matchfood.service.MatchFoodService;
import matchfood.vo.MatchFood;
import matchfood.vo.MatchFoodPage;
import payment.service.PaymentService;
import payment.vo.Payment;
import payment.vo.PaymentPage;
import product.service.ProductService;
import product.vo.Product;
import product.vo.ProductPage;
import review.service.ReviewService;
import review.vo.Review;
import review.vo.ReviewtPage;
import user.service.UserService;
import user.vo.User;
import user.vo.UsertPage;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;
	@Autowired
	private PaymentService paymentSevice;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MatchFoodService matchFoodService;

	@RequestMapping("/adminHome.do")
	public String adminHome() {
		return "admin";
	}

	@RequestMapping("/adminMakeMatchFoodForm.do")
	public ModelAndView getMakeMatchFoodForm() {
		return new ModelAndView("/admin/adminMakeMatchFoodForm");
	}

	@RequestMapping("/adminMakeWineForm.do")
	public ModelAndView getMakeWineForm(Model model) {
		List<MatchFood> matchfood = adminService.getMatchFoodList();
		model.addAttribute("matchFood", matchfood);
		return new ModelAndView("/admin/adminMakeWineForm");
	}

	@RequestMapping("/admin.do")
	public String admin(Model model, @RequestParam(value = "pageNum", required = false) int pageNum) {
		UsertPage user = adminService.getUserList(pageNum);
		ProductPage product = adminService.getProductList(pageNum);
		MatchFoodPage matchfood = adminService.getMatchFoodPList(pageNum);
		ReviewtPage review = adminService.getReviewList(pageNum);
		PaymentPage payment = adminService.getPaymentList(pageNum);
		model.addAttribute("paymentPage", payment);

		return "/admin/admin";
	}

	@RequestMapping("/userPaymentPopup.do")
	public String adminPaymentPopup(Model model, @RequestParam("userId") int userId,
			@RequestParam("pageNum") int pageNum) {

		PaymentPage payment = paymentSevice.getPaymentList(pageNum, userId);

		model.addAttribute("paymentPage", payment);
		model.addAttribute("userId", userId);

		return "admin/userPopup";
	}

	@RequestMapping("/userReviewPopup.do")
	public String adminReviewPopup(Model model, @RequestParam("userId") int userId,
			@RequestParam("pageNum") int pageNum) {

		ReviewtPage review = reviewService.userReviewList(userId, pageNum);

		model.addAttribute("reviewPage", review);
		model.addAttribute("userId", userId);

		return "admin/userPopup";
	}

	@RequestMapping("/adminUser.do")
	public String adminUser(Model model, @RequestParam(value = "pageNum", required = false) int pageNum) {
		UsertPage user = adminService.getUserList(pageNum);
		model.addAttribute("usertPage", user);

		return "/admin/adminUser";
	}

	@RequestMapping("/adminProduct.do")
	public String adminProduct(Model model, @RequestParam(value = "pageNum", required = false) int pageNum) {
		ProductPage product = adminService.getProductList(pageNum);
		model.addAttribute("productPage", product);

		return "/admin/adminProduct";
	}

	@RequestMapping("/adminMatchFood.do")
	public String adminMatchFood(Model model, @RequestParam(value = "pageNum", required = false) int pageNum) {
		MatchFoodPage matchfood = adminService.getMatchFoodPList(pageNum);
		model.addAttribute("matchFoodPage", matchfood);

		return "/admin/adminMatchFood";
	}

	@RequestMapping("/adminReview.do")
	public String adminReview(Model model, @RequestParam(value = "pageNum", required = false) int pageNum) {
		ReviewtPage review = adminService.getReviewList(pageNum);
		model.addAttribute("reviewPage", review);

		return "/admin/adminReview";
	}

	@RequestMapping("/adminPayment.do")
	public String adminPayment(Model model, @RequestParam(value = "pageNum", required = false) int pageNum) {
		PaymentPage payment = adminService.getPaymentList(pageNum);
		for (int i = 0; i < payment.getPaymentList().size(); i++) {
			String[] matchFoodIdList = payment.getPaymentList().get(i).getMatchFoodIdList().split(",");
			List<MatchFood> matchFoodList = new ArrayList<MatchFood>();
			for (int j = 0; j < matchFoodIdList.length; j++) {

				MatchFood matchFood = matchFoodService.getMatchFood(matchFoodIdList[j]);

				matchFoodList.add(matchFood);
			}
			model.addAttribute("matchFoodList" + payment.getPaymentList().get(i).getPaymentId(), matchFoodList);
		}
		model.addAttribute("paymentPage", payment);

		return "/admin/adminPayment";
	}

	@RequestMapping("/hasUser.do")
	@ResponseBody
	public String hasUser(@RequestParam("loginId") String loginId) {
		int hasUser = adminService.hasUserId(loginId);
		String result = "";
		if (hasUser > 0) {
			result = "Y";
			return result;
		} else {
			result = "N";
			return result;
		}
	}

	@RequestMapping("/hasMatchFood.do")
	@ResponseBody
	public String hasMatchFood(@RequestParam(name = "matchFoodName", required = false) String matchFoodName) {
		int hasMatchFood = adminService.hasMatchFood(matchFoodName);
		String result = "";
		if (hasMatchFood > 0) {
			result = "Y";
			return result;
		} else {
			result = "N";
			return result;
		}
	}

	@RequestMapping("/hasWine.do")
	@ResponseBody
	public String hasWine(@RequestParam(name = "productName", required = false) String productName) {
		int hasWine = adminService.hasWine(productName);
		String result = "";
		if (hasWine > 0) {
			result = "Y";
			return result;
		} else {
			result = "N";
			return result;
		}
	}

	@RequestMapping("/warningReview.do")
	@ResponseBody
	public ModelAndView warningReview(@RequestParam("state") String state, @RequestParam("reviewId") int reviewId,
			int userId, Model model, @RequestParam("pageNum") int pageNum) {

		ReviewtPage review = adminService.getReviewUser(userId, pageNum);

		model.addAttribute("reviewList", review);

		adminService.updateReviewWarning(new Review(reviewId, state));

		return new ModelAndView("/admin/adminUserReviewView");
	}

	@RequestMapping("/userReviewView.do")
	@ResponseBody
	public ModelAndView userReviewView(@RequestParam("userId") String userId, Model model,
			@RequestParam("pageNum") int pageNum) {
		int Id = Integer.parseInt(userId);

		ReviewtPage review = adminService.getReviewUser(Id, pageNum);

		model.addAttribute("reviewList", review);

		return new ModelAndView("/admin/adminUserReviewView");

	}

	@RequestMapping("/userPaymentView.do")
	@ResponseBody
	public ModelAndView userPaymentView(@RequestParam("userId") String userId, Model model,
			@RequestParam("pageNum") int pageNum) {
		int Id = Integer.parseInt(userId);
		PaymentPage payment = adminService.getPaymentUser(Id, pageNum);
		model.addAttribute("paymentList", payment);

		return new ModelAndView("/admin/adminUserPaymentView");

	}

	@RequestMapping("/deleteReview.do")
	@ResponseBody
	public ModelAndView deleteReview(@RequestParam("reviewId") String reviewId, @RequestParam("userId") String userId,
			Model model, @RequestParam("pageNum") int pageNum) {

		int rId = Integer.parseInt(reviewId);

		int uId = Integer.parseInt(userId);

		System.out.println("deleteReivew 1" + rId);
		System.out.println("deleteReview 2" + uId);

		adminService.deleteReview(rId);

		ReviewtPage review = adminService.getReviewUser(uId, pageNum);

		model.addAttribute("reviewList", review);

		return new ModelAndView("/admin/adminUserReviewView");
	}

	@RequestMapping(value = "/updateMatchFood.do")
	@ResponseBody
	public String updateMatchFood(HttpServletRequest hsr,
			@RequestParam(value = "uploadFile", required = false) MultipartFile file,
			@RequestParam HashMap<String, String> prm) {
		AdminUpload upload = new AdminUpload();

		String nationpath = "resources/img/nationImg/";

		String minipath = "resources/img/miniWineImg/";

		String png = ".png";
		if (!file.isEmpty()) {

			int price = Integer.parseInt(prm.get("price"));

			int matchFoodId = Integer.parseInt(prm.get("matchFoodId"));

			String rname = upload.Update(hsr, file, prm, "matchFood");

			int check = adminService.updateMatchFood(new MatchFood(matchFoodId, prm.get("matchFoodName"), price,
					prm.get("nation"), nationpath + prm.get("nation") + png, rname, prm.get("wineImg"),
					minipath + prm.get("wineImg") + png, prm.get("weight"), prm.get("ex")));

			if (check > 0) {
				String result = "Y";
				return result;
			} else {
				String result = "N";
				return result;
			}

		} else {
			int matchFoodId = Integer.parseInt(prm.get("matchFoodId"));
			int price = Integer.parseInt(prm.get("price"));
			int check = adminService.updateMatchFood(new MatchFood(matchFoodId, prm.get("matchFoodName"), price,
					prm.get("nation"), nationpath + prm.get("nation") + png, prm.get("originalImg"), prm.get("wineImg"),
					minipath + prm.get("wineImg") + png, prm.get("weight"), prm.get("ex")));
			if (check > 0) {
				String result = "Y";
				return result;
			} else {
				String result = "N";
				return result;
			}
		}

	}

	@RequestMapping(value = "/adminUpdateWine.do")
	@ResponseBody
	public String updateWine(HttpServletRequest hsr,
			@RequestParam(value = "uploadFile", required = false) MultipartFile file,
			@RequestParam HashMap<String, String> prm) {

		AdminUpload upload = new AdminUpload();

		String nationpath = "resources/img/nationImg/";

		String png = ".png";

		String matchFoodName = prm.get("matchFoodName");

		String matchFoodId = "";

		System.out.println(matchFoodName);
		System.out.println(matchFoodName.equals(""));
		System.out.println(matchFoodName == " ");
		System.out.println(matchFoodName == null);
		if (!matchFoodName.equals("")) {
			matchFoodName = prm.get("matchFoodName").substring(0, prm.get("matchFoodName").length() - 1);
			matchFoodId = prm.get("matchFoodId").substring(0, prm.get("matchFoodId").length() - 1);
		} else {
			matchFoodName = prm.get("matchFoodName");
			matchFoodId = prm.get("matchFoodId");
		}

		if (!file.isEmpty()) {

			int price = Integer.parseInt(prm.get("price"));

			int productId = Integer.parseInt(prm.get("productId"));

			String rname = upload.Update(hsr, file, prm, "wine");

			int check = adminService.updateProduct(new Product(productId, prm.get("producer"), prm.get("variety"),
					prm.get("wineKinds"), prm.get("productName"), prm.get("wineEx"), prm.get("brandEx"), price,
					prm.get("nation"), nationpath + prm.get("nation") + png, prm.get("year"), matchFoodId,
					matchFoodName, prm.get("alcohol"), prm.get("weight"), prm.get("temperature"), rname));

			if (check > 0) {
				String result = "Y";
				return result;
			} else {
				String result = "N";
				return result;
			}

		} else {
			int productId = Integer.parseInt(prm.get("productId"));
			int price = Integer.parseInt(prm.get("price"));

			if (!prm.get("matchFoodName").equals("")) {
				matchFoodName = prm.get("matchFoodName").substring(0, prm.get("matchFoodName").length() - 1);
				matchFoodId = prm.get("matchFoodId").substring(0, prm.get("matchFoodId").length() - 1);
			} else {
				matchFoodName = prm.get("matchFoodName");
				matchFoodId = prm.get("matchFoodId");
			}

			int check = adminService
					.updateProduct(new Product(productId, prm.get("producer"), prm.get("variety"), prm.get("wineKinds"),
							prm.get("productName"), prm.get("wineEx"), prm.get("brandEx"), price, prm.get("nation"),
							nationpath + prm.get("nation") + png, prm.get("year"), matchFoodId, matchFoodName,
							prm.get("alcohol"), prm.get("weight"), prm.get("temperature"), prm.get("originalImg")));

			if (check > 0) {
				String result = "Y";
				return result;
			} else {
				String result = "N";
				return result;
			}

		}

	}

	@RequestMapping(value = "/adminInsertWine.do")
	@ResponseBody
	public String insertWine(HttpServletRequest hsr, @RequestParam("uploadFile") MultipartFile file,
			@RequestParam HashMap<String, String> prm) {
		AdminUpload upload = new AdminUpload();

		String rname = upload.Upload(hsr, prm, file, "wine");

		String nationpath = "resources/img/nationImg/";

		String matchFoodName = prm.get("matchFoodName");

		String matchFoodId = "";

		int price = Integer.parseInt(prm.get("price"));

		if (!matchFoodName.equals("")) {
			matchFoodName = prm.get("matchFoodName").substring(0, prm.get("matchFoodName").length() - 1);
			matchFoodId = prm.get("matchFoodId").substring(0, prm.get("matchFoodId").length() - 1);

		} else {
			matchFoodName = prm.get("matchFoodName");
			matchFoodId = prm.get("matchFoodId");
		}

		adminService.insertProduct(new Product(prm.get("producer"), prm.get("variety"), prm.get("wineKinds"),
				prm.get("productName"), prm.get("wineEx"), prm.get("brandEx"), price, prm.get("nation"),
				nationpath + prm.get("nation") + ".png", prm.get("year"), matchFoodId, matchFoodName,
				prm.get("alcohol"), prm.get("weight"), prm.get("temperature"), rname));

		String result = "Y";
		return result;

	}

	@RequestMapping(value = "/adminInsertMatchFood.do")
	@ResponseBody
	public String insertMatchFood(HttpServletRequest hsr, @RequestParam("uploadFile") MultipartFile file,
			@RequestParam HashMap<String, String> prm) {
		AdminUpload upload = new AdminUpload();

		String rname = upload.Upload(hsr, prm, file, "matchFood");

		String nationpath = "resources/img/nationImg/";

		String miniwinepath = "resources/img/miniWineImg/";

		int price = Integer.parseInt(prm.get("price"));

		adminService.insertMatchFood(new MatchFood(prm.get("matchFoodName"), price, prm.get("nation"),
				nationpath + prm.get("nation") + ".png", rname, prm.get("wineImg"),
				miniwinepath + prm.get("wineImg") + ".png", prm.get("weight"), prm.get("ex")));

		return "/admin/adminProductList";
	}

	@RequestMapping("/deleteMatchFood.do")
	@ResponseBody
	public String deleteMatchFood(@RequestParam("matchFoodId") int matchFoodId, @RequestParam("img") String img,
			HttpServletRequest hsr) {

		AdminUpload upload = new AdminUpload();

		upload.Delete(hsr, matchFoodId, img);

		adminService.deleteMatchFood(matchFoodId);
		return "admin/adminMatchFood";
	}

	@RequestMapping("/deleteWine.do")
	public String deleteWine(@RequestParam("productId") int productId, @RequestParam("img") String img,
			HttpServletRequest hsr) {
		AdminUpload upload = new AdminUpload();

		upload.Delete(hsr, productId, img);

		adminService.deleteProduct(productId);

		return "admin/adminProduct";
	}

	@RequestMapping("/adminmatchFoodUpdateForm.do")
	public String matchFoodView(@RequestParam("matchFoodId") int matchFoodId, Model model) {
		MatchFood matchfood = adminService.getMatchFoodView(matchFoodId);
		model.addAttribute("matchFood", matchfood);
		return "/admin/adminMatchFoodUpdateForm";
	}

	@RequestMapping("/adminWineUpdateForm.do")
	public String wineView(@RequestParam("productId") int productId, Model model) {
		Product product = adminService.getProductView(productId);
		List<MatchFood> matchfood = adminService.getMatchFoodList();
		model.addAttribute("matchFood", matchfood);
		model.addAttribute("product", product);
		return "/admin/adminWineUpdateForm";
	}

	@RequestMapping("/adminUserView.do")
	public String getUser(Model model, @RequestParam("userId") int userId) {
		User user = adminService.getUserView(userId);
		model.addAttribute("user", user);
		return "/admin/adminUserView";
	}

	@RequestMapping("/admindeleteUser.do")
	public String deleteUser(@RequestParam("userId") int userId) {
		adminService.deleteUser(userId);
		return "/admin/adminUserList";
	}

	/*
	 * @RequestMapping("/adminProductList.do") public String
	 * getAdminProductList(@RequestParam(value = "condition", required = false)
	 * String condition,
	 * 
	 * @RequestParam(value = "type", required = false) String type,
	 * 
	 * @RequestParam(value = "productorigin", required = false) String sproduct,
	 * 
	 * @RequestParam(value = "matchfoodorigin", required = false) String smatchfood,
	 * Model model,
	 * 
	 * @RequestParam("pageNum") int pageNum) { if (type != null && condition !=
	 * null) { if (type.equals("product") && condition != null && smatchfood !=
	 * null) { ProductPage product = adminService.getSearchProductList(condition,
	 * pageNum); MatchFoodPage matchfood =
	 * adminService.getSearchMatchFoodList(smatchfood, pageNum);
	 * model.addAttribute("productList", product); model.addAttribute("matchfood",
	 * matchfood); model.addAttribute("productorigin", condition);
	 * 
	 * } else if (type.equals("matchFood") && condition != null && sproduct != null)
	 * { System.out.println("matchFood on "); ProductPage product =
	 * adminService.getSearchProductList(sproduct, pageNum); MatchFoodPage matchfood
	 * = adminService.getSearchMatchFoodList(condition, pageNum);
	 * model.addAttribute("productList", product); model.addAttribute("matchfood",
	 * matchfood); model.addAttribute("matchfoodorigin", condition); } } else {
	 * ProductPage product = adminService.getProductList(pageNum); MatchFoodPage
	 * matchfood = adminService.getMatchFoodList(pageNum);
	 * model.addAttribute("productList", product); model.addAttribute("matchfood",
	 * matchfood); }
	 * 
	 * return "/admin/adminProductList"; }
	 * 
	 * @RequestMapping("/adminUserList.do") public String
	 * getAdminUserList(@RequestParam(value = "condition", required = false) String
	 * condition, Model model,
	 * 
	 * @RequestParam("pageNum") int pageNum) {
	 * 
	 * System.out.println("condition === " + condition); if (condition == null) {
	 * UsertPage user = adminService.getUserList(pageNum);
	 * model.addAttribute("userList", user); } else { UsertPage user =
	 * adminService.getSearchUserList(condition, pageNum);
	 * model.addAttribute("userList", user); } return "/admin/adminUserList"; }
	 * 
	 * 
	 * 
	 * @RequestMapping("/adminReviewList.do") public String adminReviewList(Model
	 * model, @RequestParam("pageNum") int pageNum) { ReviewtPage review =
	 * adminService.getReviewList(pageNum); model.addAttribute("reviewList",
	 * review); return "/admin/adminReviewList"; }
	 * 
	 * @RequestMapping("/adminPaymentList.do") public String adminPaymentList(Model
	 * model, @RequestParam("pageNum") int pageNum) { PaymentPage payment =
	 * adminService.getPaymentList(pageNum); model.addAttribute("paymentList",
	 * payment); return "/admin/adminPaymentList"; }
	 * 
	 * 
	 * @RequestMapping("/updateAdmin.do")
	 * 
	 * @ResponseBody public String updateAdmin(@RequestParam("userId") String
	 * Id, @RequestParam("loginId") String loginId,
	 * 
	 * @RequestParam("password") String password, @RequestParam("userName") String
	 * userName,
	 * 
	 * @RequestParam("email") String email, @RequestParam("address") String address,
	 * 
	 * @RequestParam("phone") String phone, @RequestParam("birth") String birth) {
	 * 
	 * int userId = Integer.parseInt(Id); int check = adminService .updateUser(new
	 * User(userId, loginId, password, userName, email, address, phone, birth));
	 * System.out.println("check" + check); if (check > 0) { String result = "Y";
	 * return result; } else { String result = "N"; return result; }
	 * 
	 * }
	 * 
	 */

}