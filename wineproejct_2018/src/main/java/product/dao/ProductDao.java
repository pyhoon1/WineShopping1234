package product.dao;

import java.util.List;
import java.util.Map;

import product.vo.Product;

public interface ProductDao {
	public List<Product> getProductList(int startRow, int size);

	public Product getProduct(int productId);

	public int getProductCount();

	public List<Product> manySaleProduct();

	public List<Product> searchNation(String nation);

	public List<Product> searchWineKinds(String wine);

	public List<Product> searchMoney(int min, int max);

	public List<Product> searchProduct(String product);
} 
