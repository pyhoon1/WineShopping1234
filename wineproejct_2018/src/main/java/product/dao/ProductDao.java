package product.dao;

import java.util.List;

import product.vo.Product;
import product.vo.ProductSearch;

public interface ProductDao {
	public List<Product> getProductList(int startRow, int size);

	public Product getProduct(int productId);

	public int getProductCount();

	public List<Product> manySaleProduct();

	public List<Product> searchWine(ProductSearch search);



}
