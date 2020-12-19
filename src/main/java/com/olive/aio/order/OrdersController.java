package com.olive.aio.order;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("yeonji/")
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    //모든 사원 조회
    @GetMapping("ordersList")
    public String getAllOrdersList(Model model, Orders orders) {
        List<Orders> ordersList = ordersService.findAll(orders); //발주목록 가져오기
        model.addAttribute("ordersList", ordersList);
        return "yeonji/ordersList";
    }

//    // 발주 전체 조회
//    @GetMapping
//    public static ResponseEntity<List<Orders>> findAll(){
//        return null;
//    }

//    @GetMapping("/orders")
//    public List<Orders> getAllOders(){
////        Orders orders = new Orders();
////        orders.setOrders_cnt(100);
////        orders.setOrders_totsum(100,000);
////        orders.setOrders_regdate("2020년12월20일");
////        orders.setOrders_state("결제대기상태");
//        return ordersRepository.findAll();
//    }

//    @GetMapping("/oders/{orders_id}")
//    public Orders getOders(@PathVariable String orders_id){ //@PathVariable을 이용해서 URL를 통해 id 값을 받아와서, repository의 메소드에 넘겨주게 된다.
//        Long oders_id = Long.parseLong(orders_id);
//
//        Optional<Orders> orders = ordersRepository.findById(oders_id);
//
//        return oders.get();
//    }
}
