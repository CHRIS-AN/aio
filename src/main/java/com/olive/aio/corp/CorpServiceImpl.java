package com.olive.aio.corp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
        Corp beforeCorp = corpRepository.findById(corp.getCorp_id()).get();
        beforeCorp.setCorp_name(corp.getCorp_name());
        beforeCorp.setCorp_num(corp.getCorp_num());
        beforeCorp.setCorp_ceo(corp.getCorp_ceo());
        beforeCorp.setCorp_call(corp.getCorp_call());
        beforeCorp.setCorp_address(corp.getCorp_address());
        corpRepository.save(beforeCorp);
    }

    //거래처 삭제
    @Override
    public void deleteCorp(Corp corp) {
        corpRepository.deleteById(corp.getCorp_id());
    }

}
