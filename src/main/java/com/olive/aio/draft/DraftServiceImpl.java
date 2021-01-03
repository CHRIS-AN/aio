package com.olive.aio.draft;

import com.olive.aio.product.Product;
import com.olive.aio.product.ProductRepository;
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
        log.info("5");
        Product product = productRepository.findById(prod_id).get();
        draft.setProduct(product);
        draftRepository.save(draft);
        log.info("6");
    }

    @Override
    public void updateDraft(Draft draft, Long prod_id) {
        log.info("야 update 서비스 들어옴");
        Draft beforeDraft = draftRepository.findById(draft.getDraft_seq()).get();
        Product product = productRepository.findById(prod_id).get();
        log.info("야 update 서비스 1");
        beforeDraft.setDraft_cnt(draft.getDraft_cnt());
        log.info("야 update 서비스 2");
        beforeDraft.setDraft_prod_price(draft.getDraft_prod_price());
        log.info("야 update 서비스 3");
        beforeDraft.setProduct(product);
        log.info("야 update 서비스 4");
        draftRepository.save(beforeDraft);
        log.info("야 update 서비스 나감");
    }

    @Override
    public void deleteDraft(Draft draft) {
        draftRepository.deleteById(draft.getDraft_seq());
    }

    @Override
    public List<Draft> findByOrders(Long ordersid) {
        return (List<Draft>) draftRepository.findByOrders(ordersid);
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
