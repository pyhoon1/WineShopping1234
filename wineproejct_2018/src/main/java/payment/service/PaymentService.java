package payment.service;

import java.util.List;

import payment.vo.Payment;
import payment.vo.PaymentPage;

public interface PaymentService {
	public PaymentPage getPaymentList(int pageNum, int userId);

	public int getPaymentCount(int userId);

	public List<Payment> paymentList(int userId);

	public void payment(Payment payment);

	public int getUserTotal(int userId);
}
