
package product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.dao.ProductDao;
import product.vo.Product;
import product.vo.ProductPage;

@Service("productService")
public class ProductServiceImplJDBC implements ProductService {

	@Autowired
	private ProductDao productDao;
	int size = 10;
	int blockSize = 5;

	public ProductPage getProductList(int pageNum) {
		List<Product> productList = productDao.getProductList((pageNum - 1) * size, size);
		int count = productDao.getProductCount();
		ProductPage productPage = new ProductPage(productList, pageNum, count, size, blockSize);
		return productPage;
	}

	public Product getProduct(int productId) {
		return productDao.getProduct(productId);
	}

	public List<Product> manySaleProduct() {
		List<Product> productList = productDao.manySaleProduct();
		return productList;
	}

	public List<Product> searchNation(String nation) {
		// TODO Auto-generated method stub
		List<Product> productList = productDao.searchNation(nation);
		return productList;
	}

	public List<Product> searchWineKinds(String wine) {
		// TODO Auto-generated method stub
		List<Product> productList = productDao.searchWineKinds(wine);
		return productList;
	}

	public List<Product> searchMoney(int min, int max) {

		List<Product> productList = productDao.searchMoney(min, max);
		return productList;
	}

	public List<Product> searchProduct(String product) {
		// TODO Auto-generated method stub
		List<Product> productList = productDao.searchProduct(product);
		return productList;
	}

}
