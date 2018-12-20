package basket.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import basket.vo.Basket;

@Repository("basketDao")
public class BasketDaoImplJDBC implements BasketDao {
	@Autowired
	private BasketMapper basketMapper;



	public void insertProductMatchFood(Basket basket) {
		basketMapper.insertProductMatchFood(basket);

	}

	public void deleteAll(int userId) {
		basketMapper.deleteAll(userId);

	}

	public void deleteProduct(Basket basket) {
		basketMapper.deleteProduct(basket);

	}

	public List<Basket> getBasketList(int userId) {

		List<Basket> basketList = basketMapper.getBasketList(userId);
		return basketList;
	}

	public int getBasketCount(int userId) {
		int count = basketMapper.getBasketCount(userId);
		return count;
	}

	public Basket getBasket(Basket basket) {
		return basketMapper.getBasket(basket);
	}

	public List<Basket> selectByUserId(int userId) {
		List<Basket> basketList = basketMapper.selectByUserId(userId);
		return basketList;
	}



	public int basketTotal(int userId) {
		return basketMapper.basketTotal(userId);
	}

	public void deleteOne(int basketId) {
		basketMapper.deleteOne(basketId);
		
	}

}
