package com.olive.aio.orders;

import java.util.List;

public interface OrdersService {

    //발주 조회
    List<Orders> findAll(Orders orders);

    //발주서 등록
    void insertOrders(Orders orders, Long corp_id);
}
