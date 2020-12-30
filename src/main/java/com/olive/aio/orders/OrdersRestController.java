package com.olive.aio.orders;

import com.olive.aio.draft.DraftService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@Slf4j
@RequestMapping("/yeonji/")
public class OrdersRestController {

    @Autowired
    private DraftService draftService;

    @Autowired
    private OrdersRepository ordersRepository;

    @GetMapping("{orders_id}")
    public Orders ordersId (@PathVariable Long orders_id){
        return ordersRepository.findById(orders_id).get();
    }

}
