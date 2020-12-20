package com.olive.aio.minjong;

import org.springframework.validation.Errors;

import java.util.List;
import java.util.Map;


public interface ProductService {

    List<Product> getProductList(Product product);

    void insertProduct(Product product);

    Product getProduct(Product product);

    void updateProduct(Product product);

    void deleteProduct(Product product);

    Map<String, String> validateHandling(Errors errors);


}
