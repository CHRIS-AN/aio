package com.olive.aio.corp;

import java.util.List;

public interface CorpService {
    //거래처 리스트 조회
    List<Corp> findAll(Corp corp);

    //거래터 등록
    void insertCorp(Corp corp);;

    //거래처 수정
    void updateCorp(Corp corp);

    //거래처 삭제
    void deleteCorp(Corp corp);


}
