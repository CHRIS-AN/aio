package com.olive.aio.logisticsManage.derivative;

import com.olive.aio.orders.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface DerivativeOrdersRepository extends JpaRepository<Orders, Long>{

    // 결제완료 발주리스트 조회
    List<Orders> findByOrdersstateOrderByOrdersidAsc(String state);

    Orders findByOrdersid(Long ordersid);

}