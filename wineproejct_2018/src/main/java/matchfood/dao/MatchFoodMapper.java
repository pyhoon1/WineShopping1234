package matchfood.dao;

import java.util.List;
import java.util.Map;

import matchfood.vo.MatchFood;
import product.vo.Product;

@MatchFoodAnnotMapper
public interface MatchFoodMapper {
	public MatchFood getMatchFood(String matchFoodId);

	public List<MatchFood> getMatchFoodList(Map<String, Integer> page);

	public int getMatchFoodCount();

	public List<MatchFood> searchNation(String nation);

	public List<MatchFood> searchWineKinds(String wine);

	public List<MatchFood> searchMoney(Map<String, Integer> price);

	public List<MatchFood> searchProduct(String product);
}
