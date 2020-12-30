package com.olive.aio.draft;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DraftRepository extends JpaRepository<Draft,Long> {
    List<Draft> findByOrders(Long orders_id);
}
