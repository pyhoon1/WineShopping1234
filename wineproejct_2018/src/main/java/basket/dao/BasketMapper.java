package basket.dao;

import java.util.List;

import basket.vo.Basket;

@BasketAnnotMapper
public interface BasketMapper {

	// 잘 맞는 음식 같이 추가
	public void insertProductMatchFood(Basket basket);

	// 장바구니 비우기
	public void deleteAll(int userId);

	// 장바구니 안에 하나만 지우기
	public void deleteProduct(Basket basket);

	// 장바구니 카운트
	public int getBasketCount(int userId);

	// 장바구니 리스트
	public List<Basket> getBasketList(int userId);

	public Basket getBasket(Basket basket);
	
	public List<Basket> selectByUserId(int userId);
	
	public int productTotal(int userId);
	
	public int matchFoodTotal(String matchFoodId);
	
	public int basketTotal(int userId);
	
	public void deleteOne(int basketId);

}
