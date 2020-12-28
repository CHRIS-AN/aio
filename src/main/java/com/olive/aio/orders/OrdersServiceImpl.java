package com.olive.aio.orders;

import com.olive.aio.corp.Corp;
import com.olive.aio.corp.CorpRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersRepository ordersRepository;

    @Autowired
    private CorpRepository corpRepository;

    @Override
    public List<Orders> findAll(Orders orders) {
        return (List<Orders>) ordersRepository.findAll();
    }

    @Override
    public void insertOrders(Orders orders, Long corp_id) {
        Corp corp = corpRepository.findById(corp_id).get();
        orders.setCorp(corp);
        ordersRepository.save(orders);
    }
}
