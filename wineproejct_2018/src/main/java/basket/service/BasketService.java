package basket.service;

import java.util.List;

import basket.vo.Basket;

public interface BasketService {


	// 잘 맞는 음식 같이 추가
	public void insertProductMatchFood(Basket basket);

	// 장바구니 비우기
	public void deleteAll(int userId);

	// 장바구니 안에 하나만 지우기
	public void deleteProduct(Basket basket);

	// 장바구니 리스트 가져오기
	public List<Basket> getBasketList(int userId);

	public Basket getBasket(Basket basket);

	public List<Basket> selectByUserId(int userId);

	public int basketTotal(int userId);

	public void deleteOne(int basketId);

}
