package com.olive.aio.logisticsManage.derivative;

import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.test.Testorders;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DerivativeService {

    private final DerivativeWaitRepository derivativeWaitRepository;
    private final DerivativeRepository derivativeRepository;


    public List<Testorders> findByOdersState(String state){
        return derivativeWaitRepository.findAllByTestordersstate(state);
    }

    public List<Derivative> findByDerivstateA(String state){
        return  derivativeRepository.findByDerivstateOrderByDerividAsc(state);
    }

    public List<Derivative> findByDerivstateD(String state){
        return  derivativeRepository.findByDerivstateOrderByDerividDesc(state);
    }

    public void saveDerivChk(Derivative derivative) { derivativeRepository.save(derivative); }

    public void updateOdersState(Integer ordersid, String state) {
        Testorders select = derivativeWaitRepository.findByTestordersid(ordersid);
        select.setTestordersstate(state);
        derivativeWaitRepository.save(select);
    }
}
