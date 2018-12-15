package matchfood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import matchfood.dao.MatchFoodDao;
import matchfood.vo.MatchFood;
import matchfood.vo.MatchFoodPage;

@Service("matchFoodService")
public class MatchFoodServiceImplJDBC implements MatchFoodService {
	int size = 10;
	int blockSize = 5;

	@Autowired
	private MatchFoodDao matchFoodDao;

	public MatchFood getMatchFood(String matchFoodId) {
		// TODO Auto-generated method stub
		return matchFoodDao.getMatchFood(matchFoodId);
	}

	public MatchFoodPage getMatchFoodList(int pageNum) {
		List<MatchFood> matchFoodList = matchFoodDao.getMatchFoodList((pageNum - 1) * size, size);

		int count = matchFoodDao.getMatchFoodCount();
		MatchFoodPage matchFoodPage = new MatchFoodPage(matchFoodList, pageNum, count, size, blockSize);
		return matchFoodPage;
	}

	public List<MatchFood> searchNation(String nation) {
		List<MatchFood> matchFoodList = matchFoodDao.searchNation(nation);
		return matchFoodList;
	}

	public List<MatchFood> searchWineKinds(String wine) {
		List<MatchFood> matchFoodList = matchFoodDao.searchWineKinds(wine);
		return matchFoodList;
	}

	public List<MatchFood> searchMoney(int min, int max) {
		List<MatchFood> matchFoodList = matchFoodDao.searchMoney(min, max);
		return matchFoodList;
	}

	public List<MatchFood> searchProduct(String product) {
		// TODO Auto-generated method stub
		List<MatchFood> matchFoodList = matchFoodDao.searchProduct(product);
		return matchFoodList;
	}

}
