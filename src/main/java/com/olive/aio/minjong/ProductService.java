package com.olive.aio.minjong;

import com.olive.aio.corp.Corp;
import com.olive.aio.domain.Empl;
import com.olive.aio.employee.CurrentEmpl;
import org.springframework.validation.Errors;

import java.util.List;
import java.util.Map;


public interface ProductService {

    List<Product> productList(Product product);

    void insertProduct(Product product, Long corp_id);

    Product getProduct(Product product);

    void updateProduct(Product product, Long corp_id, @CurrentEmpl Empl empl);

    void deleteProduct(Product product);

    Map<String, String> validateHandling(Errors errors);

    List<Corp> corpsList();
}
