package basket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import basket.dao.BasketDao;
import basket.vo.Basket;

@Service("basketService")
public class BasketServiceImplJDBC implements BasketService {
	private int size = 10;
	private int blockSize = 5;
	@Autowired
	private BasketDao basketDao;



	public void insertProductMatchFood(Basket basket) {
		// TODO Auto-generated method stub
		basketDao.insertProductMatchFood(basket);

	}

	public void deleteAll(int userId) {
		basketDao.deleteAll(userId);

	}

	public void deleteProduct(Basket basket) {
		// TODO Auto-generated method stub
		basketDao.deleteProduct(basket);

	}

	public List<Basket> getBasketList(int userId) {
		List<Basket> basketList = basketDao.getBasketList(userId);

		return basketList;
	}

	public Basket getBasket(Basket basket) {
		return basketDao.getBasket(basket);
	}

	public List<Basket> selectByUserId(int userId) {
		List<Basket> basketList = basketDao.selectByUserId(userId);
		return basketList;
	}

	public int basketTotal(int userId) {
		return basketDao.basketTotal(userId);
	}

	public void deleteOne(int basketId) {
		basketDao.deleteOne(basketId);
	}

}
