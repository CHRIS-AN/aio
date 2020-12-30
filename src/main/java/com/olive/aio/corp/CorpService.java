package com.olive.aio.corp;

import com.olive.aio.domain.Empl;
import com.olive.aio.employee.CurrentEmpl;
import org.springframework.validation.Errors;

import java.util.List;
import java.util.Map;

public interface CorpService {
    //거래처 리스트 조회
    List<Corp> findAll(Corp corp);

    //거래터 등록
    void insertCorp(Corp corp);

    //거래처 수정
    void updateCorp(Corp corp, @CurrentEmpl Empl empl);

    //거래처 삭제
    void deleteById(Corp corp);

    Map<String, String> validateHandling(Errors errors);



}
