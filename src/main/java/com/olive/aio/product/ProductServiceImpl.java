package com.olive.aio.product;

import com.olive.aio.corp.Corp;
import com.olive.aio.corp.CorpRepository;
import com.olive.aio.domain.Empl;
import com.olive.aio.employee.EmplRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepo;

    @Autowired
    private CorpRepository corpRepo;

    @Autowired
    private EmplRepository emplRepo;


    public List<Product> productList(Product product) {
        return (List<Product>) productRepo.findAll();
    }


    public void insertProduct(Product product, Long corp_id) {

        Corp corp = corpRepo.findById(corp_id).get();
        product.setCorp(corp);
        productRepo.save(product);

    }

    public Product getProduct(Product product) {

        return productRepo.findById(product.getProd_id()).get();
    }


    public void updateProduct(Product product, Long corp_id, Empl empl) {
        Product beforeProduct = productRepo.findById(product.getProd_id()).get();
        Corp beforeCorp = corpRepo.findById(corp_id).get();
        Empl beforeEmpl = emplRepo.findByEmplId(empl.getEmplId());


        beforeProduct.setProdName(product.getProdName());
        beforeProduct.setProd_bundle(product.getProd_bundle());
        beforeProduct.setSell_price(product.getSell_price());
        beforeProduct.setBuy_price(product.getBuy_price());
        beforeProduct.setProd_catag(product.getProd_catag());
        beforeProduct.setProd_explain(product.getProd_explain());
        beforeProduct.setProd_image(product.getProd_image());

        beforeProduct.setCorp(beforeCorp);
        beforeProduct.setEmpl(beforeEmpl);

        productRepo.save(beforeProduct);
    }


    public void deleteProduct(Product product) {

        productRepo.deleteById(product.getProd_id());
    }

    @Override
    public Map<String, String> validateHandling(Errors errors) {
        //제품등록시, 유효성 체크
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }

        return validatorResult;
    }

    @Override
    public List<Corp> corpsList() {
        return corpRepo.findAll();
    }

}
