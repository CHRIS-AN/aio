package com.olive.aio.slip;


import com.olive.aio.domain.Slip;
import com.olive.aio.slip.form.SlipForm;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
@RequiredArgsConstructor
public class SlipService {

    private final SlipRepository repository;
    private final ModelMapper modelMapper;


    // 유효성검증
    public static Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }
        return validatorResult;
    }

    // 상세보기 수정
    public Slip viewSlip(Long slipId) {
        Slip slipList = repository.findBySlipId(slipId);
        checkIfExistingStudy(slipId, slipList);
        return slipList;
    }

    // 전표관리 수정
    public Slip viewSlip(String slipId) {
        Slip slipList = repository.findBySlipId(slipId);
        return slipList;
    }

    public void saveSlip(Slip slip) {
        repository.save(slip);
    }

    public List<Slip> listSlip() {
        List<Slip> slipList = repository.findByPayStatementntType("대기");
        return slipList;
    }

    private void checkIfExistingStudy(Long slipId, Slip slip) {
        if (slip == null) {
            throw new IllegalArgumentException(slipId + "에 해당하는 전표가 없습니다.");
        }
    }


    // 상세보기 수정 submit
    public void updateSlip(SlipForm newForm, Long slipId) {
        Slip bySlipId = repository.findBySlipId(slipId);
        modelMapper.map(newForm, bySlipId);
        //SlipForm.builder().slipId().build()
    }

    // 전표관리 수정 submit
    public void updateSlip(SlipForm newForm, String slipId) {
        Slip bySlipId = repository.findBySlipId(slipId);
        modelMapper.map(newForm, bySlipId);
    }

    public void deleteSlip(SlipForm slipId) {
        Slip slip = repository.findBySlipId(slipId.getSlipId());
        repository.delete(slip);
    }


    public Slip paymentApprove(Long slipId) {
        Slip bySlipId = repository.findBySlipId(slipId);
        bySlipId.setPayStatementntType("승인");
        return bySlipId;
    }


    public Slip paymentRemove(Long slipId) {
        Slip bySlipId = repository.findBySlipId(slipId);
        bySlipId.setPayStatementntType("거절");
        return bySlipId;
    }

}
