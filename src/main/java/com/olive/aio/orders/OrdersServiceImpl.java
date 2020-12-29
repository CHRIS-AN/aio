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

import javax.transaction.Transactional;
import java.util.List;
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
        Corp corp = corpRepository.findById(corp_id).get();
        draftList.getDrafts().forEach(e -> {
            Optional<Draft> byId = draftRepository.findById(e.getDraft_seq());
            orders.addDraft(byId.get());
        });
        orders.setCorp(corp);
        ordersRepository.save(orders);
    }

    @Override
    public Orders getOrders(Orders orders) {
        return ordersRepository.findById(orders.getOrders_id()).get();
    }

    @Override
    public void updateOrders(Orders orders, Long corp_id, Empl empl) {
        Orders beforeOrders = ordersRepository.findById(orders.getOrders_id()).get();
        Corp beforeCorp = corpRepository.findById(corp_id).get();
        Empl beforeEmpl = emplRepository.findByEmplId(empl.getEmplId());

        beforeOrders.setOrders_regdate(orders.getOrders_regdate());

        beforeOrders.setCorp(beforeCorp);
        beforeOrders.setEmpl(beforeEmpl);
        log.info("3");

        ordersRepository.save(beforeOrders);
    }

    @Override
    public void deleteById(Orders orders) {
        ordersRepository.deleteById(orders.getOrders_id());
    }
}
