package product.service;

import java.util.List;

import product.vo.Product;
import product.vo.ProductPage;
import product.vo.ProductSearch;

public interface ProductService {

	public Product getProduct(int productId);

	public ProductPage getProductList(int pageNum);

	public List<Product> manySaleProduct();

	public List<Product> newOpenProduct();
	
	
	public ProductPage searchWine(int pageNum, ProductSearch search);
	 


}
