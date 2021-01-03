package com.olive.aio.logisticsManage.derivative;

import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.Derivativelist;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DerivativeListRepository extends JpaRepository<Derivativelist, Integer> {

}
