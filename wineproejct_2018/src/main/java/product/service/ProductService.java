package product.service;

import java.util.List;

import product.vo.Product;
import product.vo.ProductPage;

public interface ProductService {

	public Product getProduct(int productId);

	public ProductPage getProductList(int pageNum);

	public List<Product> manySaleProduct();

	public List<Product> searchNation(String nation);

	public List<Product> searchWineKinds(String wine);

	public List<Product> searchMoney(int min, int max);

	public List<Product> searchProduct(String product);

} 
