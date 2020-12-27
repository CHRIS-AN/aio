package com.olive.aio.logisticsManage.derivative;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.olive.aio.domain.test.Testorders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface DerivativeWaitRepository extends JpaRepository<Testorders, Integer>{

    // 결제완료 발주리스트 조회
    List<Testorders> findAllByTestordersstate(String state);
    Testorders findByTestordersid(Integer odersiid);

}


