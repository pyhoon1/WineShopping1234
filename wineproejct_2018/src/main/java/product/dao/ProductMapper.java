package product.dao;

import java.util.List;
import java.util.Map;

import product.vo.Product;

@ProductAnnotMapper
public interface ProductMapper {

	public Product getProduct(int productId);

	public List<Product> getProductList(Map<String, Integer> page);

	public int getProductCount();

	public List<Product> manySaleProduct();
	
	public List<Product> searchNation(String nation);
	
	public List<Product> searchWineKinds(String wine);
	
	public List<Product> searchMoney(Map<String, Integer> price);
	
	public List<Product> searchProduct(String product);
	  
	

}
