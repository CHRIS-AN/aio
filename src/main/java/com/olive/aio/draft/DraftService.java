package com.olive.aio.draft;

import org.springframework.validation.Errors;

import java.util.List;
import java.util.Map;

public interface DraftService {



    //발주품목 리스트 조회
    List<Draft> findAll(Draft draft);

    //발주품목 등록
    void insertDraft(Draft draft, Long prod_id);

    //발주품목 수정
    void updateDraft(Draft draft, Long prod_id);

    //발주품목 삭제
    void deleteDraft(Draft draft);

    //발주품목 리스트 뽑기

    List<Draft> findByOrders(Long orders_id);

    Map<String, String> validateHandling(Errors errors);

}
