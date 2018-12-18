package product.vo;

import org.apache.ibatis.type.Alias;

@Alias("ProductSearch")
public class ProductSearch {
	private String condition;
	private String conditionType;
	private String startPrice;
	private String endPrice;
	private String arrangement;
	
	
	
	public ProductSearch() {}



	public ProductSearch(String condition, String conditionType, String startPrice, String endPrice,
			String arrangement) {
		this.condition = condition;
		this.conditionType = conditionType;
		this.startPrice = startPrice;
		this.endPrice = endPrice;
		this.arrangement = arrangement;
	}



	public String getCondition() {
		return condition;
	}



	public void setCondition(String condition) {
		this.condition = condition;
	}



	public String getConditionType() {
		return conditionType;
	}



	public void setConditionType(String conditionType) {
		this.conditionType = conditionType;
	}



	public String getStartPrice() {
		return startPrice;
	}



	public void setStartPrice(String startPrice) {
		this.startPrice = startPrice;
	}



	public String getEndPrice() {
		return endPrice;
	}



	public void setEndPrice(String endPrice) {
		this.endPrice = endPrice;
	}



	public String getArrangement() {
		return arrangement;
	}



	public void setArrangement(String arrangement) {
		this.arrangement = arrangement;
	}
	
	
	
}
