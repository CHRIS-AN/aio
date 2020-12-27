package com.olive.aio.logisticsManage.derivative;

import com.olive.aio.domain.Testderivative;
import com.olive.aio.domain.test.Testorders;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DerivativeService {

    private final DerivativeWaitRepository derivativeWaitRepository;
    private final DerivativeRepository derivativeRepository;


    public List<Testorders> findByOdersState(String state){
        return derivativeWaitRepository.findAllByTestordersstate(state);
    }

    public Testorders findByOrdersId(Integer odersid){
        return derivativeWaitRepository.findByTestordersid(odersid);
    }

    public List<Testderivative> findByDerivstate(String state){
        return  derivativeRepository.findByDerivstate(state);
    }
}
