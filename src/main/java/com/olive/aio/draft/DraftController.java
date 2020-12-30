package com.olive.aio.draft;

import com.olive.aio.corp.Corp;
import com.olive.aio.corp.CorpService;
import com.olive.aio.minjong.Product;
import com.olive.aio.minjong.ProductService;
import com.olive.aio.orders.Orders;
import com.olive.aio.orders.OrdersService;
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

    @Autowired
    private CorpService corpService;

    @Autowired
    private OrdersService ordersService;

    // 발주물품 목록
    @GetMapping("draftList")
    public String DraftList(Model model, Orders orders){
        List<Draft> draftList = draftService.findByOrders(orders.getOrders_id());
        model.addAttribute("nulldraft", draftList);
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
    public String draftUpdate(Draft draft, Long prod_id) {
        draftService.updateDraft(draft, prod_id);
        return "redirect:draftList";
    }

    // 발주물품 삭제
    @PostMapping("draftDelete")
    public String draftDelete(Draft draft){
        draftService.deleteDraft(draft);
        return "redirect:draftList";
    }

    // 발주물품 검색
    @GetMapping("productSearch")
    public String productList(Model model, Product product){
        List<Product> productImport = productService.productList(product);
        model.addAttribute("productImport", productImport);
        return "yeonji/productSearch";
    }

    // 거래처 검색
    @GetMapping("corpSearch")
    public String corpSearch(Model model, Corp corp){
        List<Corp> corpsList = corpService.findAll(corp);
        model.addAttribute("corpsList", corpsList);
        return "yeonji/corpSearch";
    }


    //

}
