package com.olive.aio.corp;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class CorpServiceImpl implements CorpService {

    @Autowired
    private CorpRepository corpRepository;

    //거래처 목록
    @Override
    public List<Corp> findAll(Corp corp) {
        return (List<Corp>) corpRepository.findAll();
    }

    //거래처 추가
    @Override
    public void insertCorp(Corp corp) {
        corpRepository.save(corp);
    }

    //거래처 수정
    @Override
    public void updateCorp(Corp corp) {
        log.info("insert 들어왓니?");
        Corp beforeCorp = corpRepository.findById(corp.getCorp_id()).get();
        log.info("insert 1");
        beforeCorp.setCorp_id(corp.getCorp_id());
        log.info("insert 2");
        beforeCorp.setCorp_name(corp.getCorp_name());
        beforeCorp.setCorp_num(corp.getCorp_num());
        beforeCorp.setCorp_ceo(corp.getCorp_ceo());
        beforeCorp.setCorp_call(corp.getCorp_call());
        beforeCorp.setCorp_address(corp.getCorp_address());
        log.info("insert 3");
        corpRepository.save(beforeCorp);
        log.info("insert 4");
    }

    //거래처 삭제
    @Override
    public void deleteById(Corp corp) {
        corpRepository.deleteById(corp.getCorp_id());
    }

}
