package com.olive.aio.logisticsManage.derivative;

import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.Derivativelist;
import com.olive.aio.domain.test.Testorders;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Transactional
@Service
@RequiredArgsConstructor
public class DerivativeService {

    private final DerivativeOrdersRepository derivativeOrdersRepository;
    private final DerivativeRepository derivativeRepository;
    private final DerivativeListRepository derivativeListRepository;


    public List<Testorders> findByOdersState(String state){
        return derivativeOrdersRepository.findAllByTestordersstate(state);
    }

    public List<Derivative> findByDerivstateA(String state){
        return  derivativeRepository.findByDerivstateOrderByDerividAsc(state);
    }

    public List<Derivative> findByDerivstateD(String state){
        return  derivativeRepository.findByDerivstateOrderByDerividDesc(state);
    }

    public void saveDerivChk(Derivative derivative) { derivativeRepository.save(derivative); }

    public void updateOdersState(Integer ordersid, String state) {
        Testorders select = derivativeOrdersRepository.findByTestordersid(ordersid);
        select.setTestordersstate(state);
        derivativeOrdersRepository.save(select);
    }

    public Derivative derivChkList(Integer derivId){
        return derivativeRepository.findByDerivid(derivId);
    }

    public void derivOkSave(ConfirmCnt confirmCnt, Derivative derivative, String state) throws Exception{

        Derivative select = derivativeRepository.findByDerivid(derivative.getDerivid());

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(date);

        select.setDerivokconfirmdate(format);
        select.setDerivstate(state);
        select.setEmplid(derivative.getEmplid());

        Set<Derivativelist> derivProds = new HashSet<>();
        for (Derivativelist derivativelist : confirmCnt.confirmCnt) {
            int num = 1;
            Derivativelist prod = new Derivativelist();
            prod.setDerivativeid(select);
            prod.setDerivokconfirmcnt(derivativelist.getDerivokconfirmcnt());
            derivProds.add(prod);
            derivativeListRepository.save(prod);
            System.out.println("여기서 확인해라" + num + ", " + prod);
            System.out.println("이거는 set " + derivProds.toString());

            num++;
        }
        select.setDerivlistid(derivProds);
        derivativeRepository.save(select);


    }
}
