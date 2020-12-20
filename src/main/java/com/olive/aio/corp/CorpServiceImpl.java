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

//    //거래처 상세정보
//    @Override
//    public Corp getCorp(Corp corp) {
//        return corpRepository.findById(corp.getCorp_id()).get();
//    }
//
//    //거래처 수정
//    @Override
//    public void updateCorp(Corp corp) {
//
//    }
//
//    //거래처 삭제
//    @Override
//    public void deleteCorp(Corp corp) {
//
//    }

}
