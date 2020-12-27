package com.olive.aio.draft;

import com.olive.aio.minjong.Product;
import com.olive.aio.minjong.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@AllArgsConstructor
@Slf4j
@RequestMapping("/yeonji/")
public class DraftController {

    @Autowired
    private DraftService draftService;

    @Autowired
    private ProductService productService;

    // 발주물품 목록
    @GetMapping("draftList")
    public String DraftList(Model model, Draft draft){
        List<Draft> draftList = draftService.findAll(draft);
        model.addAttribute("draft", draftList);
        return "yeonji/draftList";
    }

    // 발주물품 등록
    @PostMapping("draftInsert")
    public String draftInsert(Draft draft, Long prod_id){
        draftService.insertDraft(draft, prod_id);
        return "redirect:draftList";
    }

    // 발주물품 수정
    @PostMapping("draftUpdate")
    public String draftUpdate(Draft draft) {
        log.info("수정컨트롤러 들어옴");
        draftService.updateDraft(draft);

        log.info("수정컨트롤러 나간다!");
        return "redirect:draftList";
    }

    // 발주물품 삭제
    @PostMapping("draftDelete")
    public String draftDelete(Draft draft){
        draftService.deleteDraft(draft);
        return "redirect:draftList";
    }

    // 발주물품 검색
    @GetMapping("productImport")
    public String productList(Model model, Product product){
        List<Product> productImport = productService.productList(product);
        model.addAttribute("productImport", productImport);
        return "yeonji/productImport";
    }

}
