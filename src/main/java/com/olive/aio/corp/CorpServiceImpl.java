package com.olive.aio.corp;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CorpServiceImpl implements CorpService {

    private CorpRepository corpRepository;


    @Override
    public List<Corp> findAll(Corp corp) {
        return (List<Corp>) corpRepository.findAll();
    }
}
