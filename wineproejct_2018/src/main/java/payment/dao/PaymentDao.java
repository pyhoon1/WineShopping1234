package payment.dao;

import java.util.List;

import payment.vo.Payment;

public interface PaymentDao {
	public List<Payment> getPaymentList(int startRow, int size, int userId);

	public int getPaymentCount(int userId);

	// 결제 리스트 보여줌
	public List<Payment> paymentList(int userId);

	public void payment(Payment payment);

	public int getUserTotal(int userId);
}
