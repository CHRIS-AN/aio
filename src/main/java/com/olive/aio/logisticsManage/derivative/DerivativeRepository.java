package com.olive.aio.logisticsManage.derivative;

import com.olive.aio.domain.Derivative;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface DerivativeRepository extends JpaRepository<Derivative, Integer>{

    // 검수대기 리스트 조회
    List<Derivative> findByDerivstateOrderByDerividAsc(String state);
    List<Derivative> findByDerivstateOrderByDerividDesc(String state);

    Derivative findByDerivid(Integer derivativeid);

}


