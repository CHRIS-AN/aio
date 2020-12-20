package com.olive.aio.minjong;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final InsertFormValidator insertFormValidator;

    @InitBinder("product")
    public void initBinder(WebDataBinder webDataBinder){
        webDataBinder.addValidators(insertFormValidator);
    }

    @Autowired
    private ProductService productService;

    @RequestMapping("/getProductList")
    public String getProductList(Model model, Product product){
        List<Product> productsList = productService.getProductList(product);
        model.addAttribute("productList", productsList);
        return "productList";
    }

    @GetMapping("/insertProduct")
    public String insertProductView(Product product){
        return "insertProduct";
    }
    @PostMapping("/insertProduct")
    public String insertProduct(@Valid Product product, Errors errors, Model model) {
        if(errors.hasErrors()) {
            //제품 등록 실패시, 입력 데이터를 유지
            model.addAttribute("product", product);

            //유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorResult = productService.validateHandling(errors);
            for (String key : validatorResult.keySet()){
                model.addAttribute(key, validatorResult.get(key));
            }
            return "/insertProduct";

        }
        // 제품명 중복 검사
//        insertFormValidator.validate(product,errors);
//        if(errors.hasErrors()){
//            return "/insertProduct";
//        }

        productService.insertProduct(product);
        return "redirect:getProductList";
    }

    @GetMapping("/getProduct")
    public String getProduct(Product product, Model model){
        model.addAttribute("product", productService.getProduct(product));
        return "getProduct";
    }

    @PostMapping("/updateProduct")
    public String updateProduct(@Valid Product product, Errors errors, Model model){

        if(errors.hasErrors()) {
            //제품 등록 실패시, 입력 데이터를 유지
            model.addAttribute("product", product);

            //유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorResult = productService.validateHandling(errors);
            for (String key : validatorResult.keySet()){
                model.addAttribute(key, validatorResult.get(key));
            }
            return "/getProduct";

        }

        productService.updateProduct(product);
        return "forward:getProductList";
    }

    @GetMapping("/deleteProduct")
    public String deleteProduct(Product product) {
        productService.deleteProduct(product);
        return "forward:getProductList";
    }


}
