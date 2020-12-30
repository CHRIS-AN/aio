package com.olive.aio.corp;


import com.olive.aio.domain.Empl;
import com.olive.aio.employee.EmplRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class CorpServiceImpl implements CorpService {

    @Autowired
    private CorpRepository corpRepository;

    @Autowired
    private EmplRepository emplRepository;

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
    public void updateCorp(Corp corp, Empl empl) {
        Corp beforeCorp = corpRepository.findById(corp.getCorp_id()).get();
        Empl beforeEmpl = emplRepository.findByEmplId(empl.getEmplId());
        beforeCorp.setCorpName(corp.getCorpName());
        beforeCorp.setCorp_num(corp.getCorp_num());
        beforeCorp.setCorp_ceo(corp.getCorp_ceo());
        beforeCorp.setCorp_call(corp.getCorp_call());
        beforeCorp.setCorp_address(corp.getCorp_address());
        beforeCorp.setEmpl(beforeEmpl);
        corpRepository.save(beforeCorp);
    }

    //거래처 삭제
    @Override
    public void deleteById(Corp corp) {
        corpRepository.deleteById(corp.getCorp_id());
    }

}
