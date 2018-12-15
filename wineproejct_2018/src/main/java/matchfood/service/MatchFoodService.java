package matchfood.service;

import java.util.List;

import matchfood.vo.MatchFood;
import matchfood.vo.MatchFoodPage;

public interface MatchFoodService {

	public MatchFood getMatchFood(String matchFoodId);

	public MatchFoodPage getMatchFoodList(int pageNum);

	public List<MatchFood> searchNation(String nation);

	public List<MatchFood> searchWineKinds(String wine);

	public List<MatchFood> searchMoney(int min, int max);

	public List<MatchFood> searchProduct(String product);

}
