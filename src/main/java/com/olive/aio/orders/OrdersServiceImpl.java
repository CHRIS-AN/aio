package com.olive.aio.orders;

import com.olive.aio.corp.Corp;
import com.olive.aio.corp.CorpRepository;
import com.olive.aio.domain.Empl;
import com.olive.aio.draft.Draft;
import com.olive.aio.draft.DraftList;
import com.olive.aio.draft.DraftRepository;
import com.olive.aio.employee.EmplRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Transactional
@Slf4j
@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersRepository ordersRepository;

    @Autowired
    private CorpRepository corpRepository;

    @Autowired
    private EmplRepository emplRepository;

    @Autowired
    private DraftRepository draftRepository;

    @Override
    public List<Orders> findAll(Orders orders) {
        return (List<Orders>) ordersRepository.findAll();
    }

    @Override
    public void insertOrders(Orders orders, Long corp_id, DraftList draftList) {
        log.info("야 insert 서비스 들어옴");
        Corp corp = corpRepository.findById(corp_id).get();
        log.info("야 insert 서비스 1");
        draftList.getDrafts().forEach(e -> {
            log.info("야 insert 서비스 2");
            Optional<Draft> byId = draftRepository.findById(e.getDraft_seq());
            orders.addDraft(byId.get());
            log.info("야 insert 서비스 3");
        });
        orders.setCorp(corp);
        log.info("야 insert 서비스 4");
        ordersRepository.save(orders);
        log.info("야 insert 서비스 나감");
    }

    @Override
    public Orders getOrders(Orders orders) {
        return ordersRepository.findById(orders.getOrdersid()).get();
    }

    @Override
    public void updateOrders(Orders orders, Long corp_id, Empl empl) {
        Orders beforeOrders = ordersRepository.findById(orders.getOrdersid()).get();
        Corp beforeCorp = corpRepository.findById(corp_id).get();
        Empl beforeEmpl = emplRepository.findByEmplId(empl.getEmplId());

        beforeOrders.setOrders_regdate(orders.getOrders_regdate());

        beforeOrders.setCorp(beforeCorp);
        beforeOrders.setEmpl(beforeEmpl);
        log.info("3");

        ordersRepository.save(beforeOrders);
    }

//    @Override
//    public Map<String, String> validateHandling(Errors errors) {
//        //제품등록시, 유효성 체크
//        Map<String, String> validatorResult = new HashMap<>();
//
//        for (FieldError error : errors.getFieldErrors()) {
//            String validKeyName = String.format("valid_%s", error.getField());
//            validatorResult.put(validKeyName, error.getDefaultMessage());
//        }
//
//        return validatorResult;
//    }

    @Override
    public void deleteById(Orders orders) {
        ordersRepository.deleteById(orders.getOrdersid());
    }
}
