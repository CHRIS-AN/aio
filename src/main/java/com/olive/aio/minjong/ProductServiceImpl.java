package com.olive.aio.minjong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepo;

    public List<Product> getProductList(Product product) {

        return (List<Product>) productRepo.findAll();
    }


    public void insertProduct(Product product) {

        productRepo.save(product);
    }

    public Product getProduct(Product product) {

        return productRepo.findById(product.getProd_id()).get();
    }


    public void updateProduct(Product product) {
        Product beforeProduct = productRepo.findById(product.getProd_id()).get();
        beforeProduct.setProdName(product.getProdName());
        beforeProduct.setProd_bundle(product.getProd_bundle());
        beforeProduct.setSell_price(product.getSell_price());
        beforeProduct.setBuy_price(product.getBuy_price());
        beforeProduct.setProd_catag(product.getProd_catag());
        beforeProduct.setProd_explain(product.getProd_explain());
        productRepo.save(beforeProduct);
    }


    public void deleteProduct(Product product) {

        productRepo.deleteById(product.getProd_id());
    }

    @Override
    public Map<String, String> validateHandling(Errors errors) {
        //제품등록시, 유효성 체크
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()){
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }

        return validatorResult;
    }
}
