package com.olive.aio.draft;

import com.olive.aio.minjong.Product;
import com.olive.aio.minjong.ProductRepository;
import com.olive.aio.orders.Orders;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class DraftServiceImpl implements DraftService {

    @Autowired
    private DraftRepository draftRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Draft> findAll(Draft draft) {
        return (List<Draft>) draftRepository.findAll();
    }

    @Override
    public void insertDraft(Draft draft, Long prod_id) {
        Product product = productRepository.findById(prod_id).get();
        draft.setProduct(product);
        draftRepository.save(draft);
    }

    @Override
    public void updateDraft(Draft draft, Long prod_id) {
        Draft beforeDraft = draftRepository.findById(draft.getDraft_seq()).get();
        Product product = productRepository.findById(prod_id).get();
        beforeDraft.setDraft_cnt(draft.getDraft_cnt());
        beforeDraft.setDraft_prod_price(draft.getDraft_prod_price());
        beforeDraft.setProduct(product);
        draftRepository.save(beforeDraft);
    }

    @Override
    public void deleteDraft(Draft draft) {
        draftRepository.deleteById(draft.getDraft_seq());
    }

    public List<Draft> findByOrders(Orders orders){

        return draftRepository.findByOrders(orders);
    }

    @Override
    public List<Draft> findByOrders(Long orders_id) {
        return (List<Draft>) draftRepository.findByOrders(orders_id);
    }

    @Override
    public Map<String, String> validateHandling(Errors errors) {
        //제품등록시, 유효성 체크
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }

        return validatorResult;
    }

}
