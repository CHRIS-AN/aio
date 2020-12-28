package com.olive.aio.logisticsManage.derivative;

import com.olive.aio.domain.Testderivative;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface DerivativeRepository extends JpaRepository<Testderivative, Integer>{

    // 검수대기 리스트 조회
    List<Testderivative> findByDerivstate(String state);



}


