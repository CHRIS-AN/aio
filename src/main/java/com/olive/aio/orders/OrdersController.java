package com.olive.aio.orders;

import com.olive.aio.corp.CorpService;
import com.olive.aio.domain.Empl;
import com.olive.aio.draft.DraftList;
import com.olive.aio.draft.DraftService;
import com.olive.aio.employee.CurrentEmpl;
import com.olive.aio.product.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
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

    @Autowired
    private DraftService draftService;

    // 발주 목록
    @GetMapping("ordersList")
    public String ordersList(Model model, Orders orders){
        List<Orders> ordersList = ordersService.findAll(orders);
        model.addAttribute("orders", ordersList);

        return "yeonji/ordersList";
    }

    // 발주서 등록
    @PostMapping("ordersInsert")
    public String ordersInsert(Orders orders, Errors errors, Model model, @CurrentEmpl Empl empl, Long corp_id, DraftList draftList){

        log.info("orderstate{}", orders.getOrdersstate());
        orders.setEmpl(empl);
        System.out.println("야 draftList.getDrafts() : " + draftList.getDrafts());
        ordersService.insertOrders(orders, corp_id, draftList);
        log.info("야 insert컨트롤러 나감");
        return "redirect:ordersList";
    }

//    // 발주 수정페이지에 값 넣기
//    @GetMapping("ordersUpdate")
//    public String orderUpdatePage(Orders orders, Model model){
//        List<Draft> draftList = draftService.findByOrders(orders.getOrdersid());
//        model.addAttribute("nulldraft", draftList);
//
//        model.addAttribute("orders", ordersService.getOrders(orders));
//        return "yeonji/ordersUpdate";
//    }
//
//    // 발주 수정 submit
//    @PostMapping("ordersUpdate")
//    public String orderUpdate(@Valid Orders orders, Errors errors, @CurrentEmpl Empl empl, Long corp_id){
//
//        ordersService.updateOrders(orders, corp_id, empl);
//
//        return "redirect:ordersList";
//    }

    // 발주 삭제
    @PostMapping("ordersDelete")
    public String ordersDelete(Orders orders){
        ordersService.deleteById(orders);
        return "redirect:ordersList";
    }


}
