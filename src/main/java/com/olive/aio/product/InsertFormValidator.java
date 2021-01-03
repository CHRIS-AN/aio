package com.olive.aio.product;



import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
@RequiredArgsConstructor
public class InsertFormValidator implements Validator {

    private final ProductRepository productRepository;


    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.isAssignableFrom(Product.class);
    }

    @Override
    public void validate(Object object, Errors errors) {
        //TODO 제품명 중복 검사
        Product product = (Product)object;
        if(productRepository.existsByProdName(product.getProdName())){
            errors.rejectValue("prodName", "invalid.prodName", new Object[]{product.getProdName()},"제품명이 중복됩니다.");
        }
    }
}
