package com.olive.aio.draft;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class DraftServiceImpl implements DraftService {

    @Autowired
    private DraftRepository draftRepository;

    @Override
    public List<Draft> findAll(Draft draft) {
        return (List<Draft>) draftRepository.findAll();
    }

    @Override
    public void insertDraft(Draft draft) {
        draftRepository.save(draft);
    }

    @Override
    public void updateDraft(Draft draft) {
        log.info("수정서비스 들어옴");
        Draft beforeDraft = draftRepository.findById(draft.getDraft_seq()).get();
        log.info("수정서비스 1");
        beforeDraft.setDraft_cnt(draft.getDraft_cnt());
        log.info("수정서비스 2");
        beforeDraft.setDraft_prod_price(draft.getDraft_prod_price());
        log.info("수정서비스 3");
        draftRepository.save(beforeDraft);
        log.info("수정서비스 나감");
    }

    @Override
    public void deleteDraft(Draft draft) {
        draftRepository.deleteById(draft.getDraft_seq());
    }
}
