package user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import user.service.UserService;
import user.vo.User;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/loginErrorPage.do")
	public String loginErroPage() {
		return "redirect:/main.do";
	}
 
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/main.do";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginUser(HttpServletRequest req, Model model, @RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		model.addAttribute("errors", errors);
		User user = userService.selectByLoginId(loginId);
		if (user == null) {
			errors.put("noLoginId", true);
			return "error/loginErrorPage";
		}
		User user1 = userService.loginUser(new User(loginId, password));
		if (user1 == null) {
			errors.put("wrongPassword", true);
			return "error/loginErrorPage";
		}
		if (user.getUserState() == false) {
			errors.put("noConfirm", true);
			return "error/loginErrorPage";
		}
		if (!errors.isEmpty()) {
			errors.put("badError", true);
			return "error/loginErrorPage";
		}
		req.getSession().setAttribute("user", user);
		return "redirect:/main.do";
	}

	@RequestMapping("/signUpForm.do")
	public String joinForm() {
		return "user/signUp";
	}

	@RequestMapping("/signUpErrorPage.do")
	public String signErrorPage() {
		return "user/signUpForm";
	}

	@RequestMapping(value = "/signUp.do", method = RequestMethod.POST)
	public String insertUser(Model model, @RequestParam("loginId") String loginId,
			@RequestParam("password") String password, @RequestParam("userName") String userName,
			@RequestParam("email") String email, @RequestParam("address") String address,
			@RequestParam("phone") String phone, @RequestParam("birth") String birth) throws Exception {

		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		model.addAttribute("errors", errors);
		User userId = userService.selectByLoginId(loginId);
		if (userId != null) {
			errors.put("duplicateLoginId", true);
			return "error/signUpErrorPage";
		}
		User userEmail = userService.selectByEmail(email);
		if (userEmail != null) {
			errors.put("duplicateEmail", true);
			return "error/signUpErrorPage";
		}
		if (!errors.isEmpty()) {
			errors.put("badError", true);
			return "error/signUpErrorPage";
		}
		userService.inserUser(new User(loginId, password, userName, email, address, phone, birth));
		return "user/checkMail";
	}

	@RequestMapping("/updateForm.do")
	public String updateForm(Model model, @RequestParam("userId") int userId) {
		User user = userService.selectByUserId(userId);
		model.addAttribute("user", user);
		return "user/userUpdateForm";
	}

	@RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)
	public String updateUser( @RequestParam("userId") int userId, @RequestParam("password") String password,
			@RequestParam("address") String address) {

		userService.updateUser(new User(userId, password, address));
		
		return "redirect:/myPage.do?userId="+userId+"&pageNum=1";
				
	}

	// 회원 탈퇴 수정해야됨!!!!!
	@RequestMapping(value = "/deleteUser.do", method = RequestMethod.POST)
	public String deleteUser(int userId) {
		userService.deleteUser(userId);
		return "redirect:main";
		// 탈퇴하면 어디론가 감
	}

	

	
	
	@RequestMapping("/userLoginIdFindForm.do")
	public String userLoginIdFindForm() {
		return "user/userLoginIdFindForm";
	}

	@RequestMapping("/userLoginIdFindErrorPage.do")
	public void userLoginIdFindErrorPage() {

	}

	@RequestMapping("/userLoginIdFind.do")
	public String userLoginIdFind(Model model, @RequestParam("userName") String name,
			@RequestParam("email") String email) throws Exception {
		User user = new User();
		user.setUserName(name);
		user.setEmail(email);
		User user1 = userService.userLoginIdFind(user);
		User user2 = userService.selectByEmail(email);
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		model.addAttribute("errors", errors);
		if (user1 == null) {
			errors.put("noUserInformation", true);
			return "error/userLoginIdFindErrorPage";
		}
		if (user2 == null) {
			errors.put("noEmail", true);
			return "error/userLoginIdFindErrorPage";
		}
		if (!errors.isEmpty()) {
			errors.put("badError", true);
			return "error/userLoginIdFindErrorPage";
		}
		userService.sendLoginId(user1);
		return "loginForm";

	}

	@RequestMapping("/userPasswordFindForm.do")
	public String userPasswordFindForm() {
		return "user/userPasswordFindForm";
	}

	@RequestMapping("/userPasswordFindErrorPage.do")
	public void userPasswordFindErrorPage() {
	}

	@RequestMapping("userPasswordFind.do")
	public String userPasswordFind(Model model, @RequestParam("loginId") String loginId,
			@RequestParam("userName") String name, @RequestParam("email") String email) throws Exception {

		User user = userService.userPasswordFind(new User(loginId, name, email));
		User user1 = userService.selectByEmail(email);
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		model.addAttribute("errors", errors);

		if (user == null) {
			errors.put("noUserInformation", true);
			return "error/userPasswordFindErrorPage";
		}
		if (user1 == null) {
			errors.put("noEmail", true);
			return "error/userPasswordFindErrorPage";
		}
		if (!errors.isEmpty()) {
			errors.put("badError", true);
			return "error/userPasswordFindErrorPage";
		}
		userService.sendPassword(user);
		return "loginForm";

	}

	@RequestMapping(value = "/emailConfirm.do", method = RequestMethod.GET)
	public String emailConfirm(Model model, @RequestParam("email") String email) throws Exception { // 이메일인증
		userService.userStateUpdate(email);
		model.addAttribute("userEmail", email);

		return "redirect:/main.do";
	}

}
