package com.olive.aio.draft;

import java.util.List;

public interface DraftService {

    //발주품목 리스트 조회
    List<Draft> findAll(Draft draft);

    //발주품목 등록
    void insertDraft(Draft draft, Long prod_id);;

    //발주품목 수정
    void updateDraft(Draft draft);

    //발주품목 삭제
    void deleteDraft(Draft draft);
}
