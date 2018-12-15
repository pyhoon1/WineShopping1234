package product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import product.vo.Product;

@Repository("productDao")
public class ProductDaoImplJDBC implements ProductDao {

	@Autowired
	private ProductMapper productMapper;

	public Product getProduct(int productId) {
		Product product = productMapper.getProduct(productId);
		return product;
	}

	public List<Product> getProductList(int startRow, int size) {
		Map<String, Integer> page = new HashMap<String, Integer>();
		page.put("startRow", startRow);
		page.put("size", size);
		List<Product> productList = productMapper.getProductList(page);
		return productList;
	}

	public int getProductCount() {
		return productMapper.getProductCount();
	}

	public List<Product> manySaleProduct() {
		List<Product> productList = productMapper.manySaleProduct();
		return productList;
	}

	public List<Product> searchNation(String nation) {
		// TODO Auto-generated method stub
		List<Product> productList = productMapper.searchNation(nation);
		return productList;
	}

	public List<Product> searchWineKinds(String wine) {
		// TODO Auto-generated method stub
		List<Product> productList = productMapper.searchWineKinds(wine);
		return productList;
	}

	public List<Product> searchMoney(int min, int max) {
		// TODO Auto-generated method stub
		Map<String, Integer> price = new HashMap<String, Integer>();
		price.put("min", min);
		price.put("max", max);
		List<Product> productList = productMapper.searchMoney(price);
		return productList;
	}

	public List<Product> searchProduct(String product) {
		// TODO Auto-generated method stub
		List<Product> productList = productMapper.searchProduct(product);
		return productList;
	}

}
