package com.olive.aio.draft;

import com.olive.aio.orders.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DraftRepository extends JpaRepository<Draft,Long> {
    List<Draft> findByOrders(Orders orders_id);

    List<Draft> findByOrders(Long orders_id);
}
