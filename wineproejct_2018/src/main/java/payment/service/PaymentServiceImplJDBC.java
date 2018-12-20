package payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import payment.dao.PaymentDao;
import payment.vo.Payment;
import payment.vo.PaymentPage;

@Service("paymentService")
public class PaymentServiceImplJDBC implements PaymentService {
	private int size = 10;
	private int blockSize = 5;
	@Autowired
	private PaymentDao paymentDao;

	public int getPaymentCount(int userId) {
		int count = paymentDao.getPaymentCount(userId);
		return count;
	}

	public List<Payment> paymentList(int userId) {
		List<Payment> paymentList = paymentDao.paymentList(userId);
		return paymentList;
	}

	public PaymentPage getPaymentList(int pageNum, int userId) {

		List<Payment> paymentList = paymentDao.getPaymentList((pageNum - 1) * size, size, userId);
		int count = paymentDao.getPaymentCount(userId);
		PaymentPage paymentPage = new PaymentPage(paymentList, pageNum, count, size, blockSize);
		return paymentPage;
	}


	public int getUserTotal(int userId) {
		
		return paymentDao.getUserTotal(userId);
	}

	public void payment(Payment payment) {
		paymentDao.payment(payment);
		
	}

}
