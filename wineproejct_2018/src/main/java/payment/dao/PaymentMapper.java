package payment.dao;

import java.util.List;
import java.util.Map;

import payment.vo.Payment;

@PaymentAnnotMapper
public interface PaymentMapper {
	public List<Payment> getPaymentList(Map<String, Integer> page);

	public int getPaymentCount(int userId);

	// 결제 리스트 보여줌
	public List<Payment> paymentList(int userId);

	public int getUserTotal(int userId);
	
	public void payment(Payment payment);

}
