package payment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import payment.vo.Payment;

@Repository("paymentDao")
public class PaymentDaoImplJDBC implements PaymentDao {

	@Autowired
	private PaymentMapper paymentMapper;

	public List<Payment> getPaymentList(int startRow, int size, int userId) {
		Map<String, Integer> page = new HashMap<String, Integer>();
		page.put("startRow", startRow);
		page.put("size", size);
		page.put("userId", userId);
		System.out.println("asdf");
		List<Payment> paymentList = paymentMapper.getPaymentList(page);
		return paymentList;
	}

	public int getPaymentCount(int userId) {
		int count = paymentMapper.getPaymentCount(userId);
		return count;
	}

	public List<Payment> paymentList(int userId) {
		List<Payment> paymentList = paymentMapper.paymentList(userId);
		return paymentList;
	}

	public int getUserTotal(int userId) {

		return paymentMapper.getUserTotal(userId);
	}

	public void payment(Payment payment) {
		paymentMapper.payment(payment);

	}

}
