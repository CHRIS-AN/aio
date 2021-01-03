package com.olive.aio.product;

import com.olive.aio.corp.Corp;
import com.olive.aio.corp.CorpService;
import com.olive.aio.domain.Empl;
import com.olive.aio.employee.CurrentEmpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("product")
public class ProductController {

    private final InsertFormValidator insertFormValidator;

    @InitBinder("product")
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.addValidators(insertFormValidator);
    }

    @Autowired
    private ProductService productService;

    @Autowired
    private CorpService corpService;


    @RequestMapping("/productList")
    public String productList(Model model, Product product) {
        List<Product> productsList = productService.productList(product);
        model.addAttribute("productList", productsList);
        return "product/productList";
    }

    @GetMapping("/insertProduct")
    public String insertProductView(@CurrentEmpl Empl empl, Product product, Model model) {
        model.addAttribute("empl", empl);

        return "product/insertProduct";
    }

    @PostMapping("/insertProduct")
    public String insertProduct(Long corp_id, @CurrentEmpl Empl empl, @Valid Product product, Errors errors, Model model) {       //Long corp_id
        log.info("1");
        if (errors.hasErrors()) {
            log.info("2");
            //제품 등록 실패시, 입력 데이터를 유지
            model.addAttribute("product", product);
            model.addAttribute("empl", empl);
            //유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorResult = productService.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
            log.info("4");
            return "product/insertProduct";

        }
        // 제품명 중복 검사
//        insertFormValidator.validate(product,errors);
//        if(errors.hasErrors()){
//            return "/insertProduct";
//        }

        product.setEmpl(empl);
        productService.insertProduct(product, corp_id);

        return "redirect:productList";
    }

    @GetMapping("/getProduct")
    public String getProduct(Product product, Model model) {
        model.addAttribute("product", productService.getProduct(product));
        return "product/getProduct";
    }

    @GetMapping("/updateProduct")
    public String updateProduct(@CurrentEmpl Empl empl, Product product, Model model) {
        model.addAttribute("empl", empl);
        model.addAttribute("product", productService.getProduct(product));
        return "product/updateProduct";
    }

    @PostMapping("/updateProduct")
    public String updateProduct(Long corp_id, @CurrentEmpl Empl empl, @Valid Product product, Errors errors, Model model) {


        if (errors.hasErrors()) {
            //제품 등록 실패시, 입력 데이터를 유지
            model.addAttribute("product", product);
            model.addAttribute("empl", empl);

            //유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorResult = productService.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
            return "product/updateProduct";

        }

        productService.updateProduct(product, corp_id, empl);
        return "redirect:productList";
    }

    @GetMapping("/deleteProduct")
    public String deleteProduct(Product product) {
        productService.deleteProduct(product);
        return "forward:productList";
    }

    @GetMapping("/searchCorp")
    public String searchCorp(Model model, Corp corp) {

        List<Corp> corpsList = corpService.findAll(corp);
        model.addAttribute("corpsList", corpsList);


        return "product/searchCorp";
    }
}
