package com.olive.aio.logisticsManage.release;

import com.olive.aio.domain.Requestdummy;
import com.olive.aio.orders.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface RequestDummyRepository extends JpaRepository<Requestdummy, Integer>{

    // 출고요청 발주리스트 조회
    List<Requestdummy> findByRequeststate(String state);

    Requestdummy findByRequestid(Integer requestid);

}


