package com.olive.aio.orders;

import com.olive.aio.domain.Empl;
import com.olive.aio.draft.DraftList;

import java.util.List;

public interface OrdersService {

    //발주 조회
    List<Orders> findAll(Orders orders);

    //발주서 등록
    void insertOrders(Orders orders, Long corp_id, DraftList draftList);

    //발주 삭제
    void deleteById(Orders orders);

    Orders getOrders(Orders orders);

    void updateOrders(Orders orders, Long corp_id, Empl empl);
}
