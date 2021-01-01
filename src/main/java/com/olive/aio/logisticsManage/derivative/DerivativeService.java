package com.olive.aio.logisticsManage.derivative;

import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.Derivativelist;
import com.olive.aio.orders.Orders;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

@Transactional
@Service
@RequiredArgsConstructor
public class DerivativeService {

    private final DerivativeOrdersRepository derivativeOrdersRepository;
    private final DerivativeRepository derivativeRepository;
    private final DerivativeListRepository derivativeListRepository;


    public List<Orders> findByOdersState(String state){
        return derivativeOrdersRepository.findByOrdersstateOrderByOrdersidAsc(state);
    }

    public List<String> makeDerivTitleList(String state) {
        List<Orders> select = derivativeOrdersRepository.findByOrdersstateOrderByOrdersidAsc(state);

        List<String> title  = new ArrayList<>();
        for (Orders orders: select) {

            int orderProds = orders.getDraft().size() - 1;
            String prodName = "";

            while (orders.getDraft().iterator().hasNext()){

                prodName = orders.getDraft().iterator().next().getProduct().getProdName();
                break;
            }
            if (orderProds >0)
                prodName += " 외 " + orderProds + "개";
            String derivTitle = prodName;

            title.add(derivTitle);
        }

        return title;
    }

    public List<Derivative> findByDerivstateA(String state){
        return  derivativeRepository.findByDerivstateOrderByDerividAsc(state);
    }

    public List<Derivative> findByDerivstateD(String state){
        return  derivativeRepository.findByDerivstateOrderByDerividDesc(state);
    }

    public void saveDerivChk(Derivative derivative, Long ordersid, String state) {

        Orders select = derivativeOrdersRepository.findByOrdersid(ordersid);

        int orderProds = select.getDraft().size() - 1;
        String prodName = "";

        while (select.getDraft().iterator().hasNext()){

            prodName = select.getDraft().iterator().next().getProduct().getProdName();
            break;
        }
        if (orderProds >0)
            prodName += " 외 " + orderProds + "개";
        String derivTitle = prodName;

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String derivDate = sdf.format(date);

        derivative.setDerivstate(state);
        derivative.setDerivtitle(derivTitle);
        derivative.setDerivregdate(derivDate);

        derivativeRepository.save(derivative);
    }

    public void updateOdersState(Long ordersid, String state) {
        Orders select = derivativeOrdersRepository.findByOrdersid(ordersid);
        select.setOrdersstate(state);
        derivativeOrdersRepository.save(select);
    }

    public Derivative derivChkList(Integer derivId){
        return derivativeRepository.findByDerivid(derivId);
    }

    public void derivOkSave(ConfirmCnt confirmCnt, Derivative derivative, String state) throws Exception{

        Derivative select = derivativeRepository.findByDerivid(derivative.getDerivid());

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String derivConfirmDate = sdf.format(date);

        select.setDerivokconfirmdate(derivConfirmDate);
        select.setDerivstate(state);
        select.setEmplid(derivative.getEmplid());

        Set<Derivativelist> derivProds = new HashSet<>();
        for (Derivativelist derivativelist : confirmCnt.confirmCnt) {

            Derivativelist prod = new Derivativelist();
            prod.setDerivativeid(select);
            prod.setDerivokconfirmcnt(derivativelist.getDerivokconfirmcnt());
            derivProds.add(prod);
            derivativeListRepository.save(prod);
        }

        select.setDerivlistid(derivProds);
        derivativeRepository.save(select);
    }

}
