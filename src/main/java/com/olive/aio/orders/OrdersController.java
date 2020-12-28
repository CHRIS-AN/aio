package com.olive.aio.orders;

import com.olive.aio.corp.CorpService;
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
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CorpService corpService;

    // 발주 목록
    @GetMapping("ordersList")
    public String ordersList(Model model, Orders orders){
        List<Orders> ordersList = ordersService.findAll(orders);
        model.addAttribute("orders", ordersList);
        return "yeonji/ordersList";
    }

    // 발주서 등록
    @PostMapping("ordersInsert")
    public String ordersInsert(Orders orders, Long corp_id){
        ordersService.insertOrders(orders, corp_id);
        return "redirect:ordersList";
    }

    // 발주 상세정보
    @GetMapping("orderDraft")
    public String orderDraft(){
        return "yeonji/orderDraft";
    }

}
