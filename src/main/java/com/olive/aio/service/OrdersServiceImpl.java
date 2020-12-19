package com.olive.aio.service;

import com.olive.aio.domain.Orders;
import com.olive.aio.repository.OrdersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersRepository ordersRepository;

    @Override
    public List<Orders> findAll(Orders orders) {
        return (List<Orders>) ordersRepository.findAll();
    }

//    @Override
//    public Orders findById(long orders_id) {
//        return null;
//    }
//
//    @Override
//    public void deleteById(long orders_id) {
//
//    }
//
//    @Override
//    public Orders save(Orders orders) {
//        return null;
//    }
//
//    @Override
//    public void updateById(long orders_id, Orders orders) {
//
//    }
}
