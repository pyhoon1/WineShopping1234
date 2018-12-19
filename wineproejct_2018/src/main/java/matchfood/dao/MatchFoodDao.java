package matchfood.dao;

import java.util.List;

import matchfood.vo.MatchFood;

public interface MatchFoodDao {
	public MatchFood getMatchFood(String matchFoodId);

	public List<MatchFood> getMatchFoodList(int startRow, int size);

	public int getMatchFoodCount();

	public List<MatchFood> searchNation(String nation);

	public List<MatchFood> searchWineKinds(String wine);

	public List<MatchFood> searchMoney(int min, int max);

	public List<MatchFood> searchProduct(String product);
}
