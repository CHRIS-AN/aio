package com.olive.aio.slip;


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

    public static Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }

        return validatorResult;
    }


    public Slip viewSlip(Long slipId) {
        Slip slipList = repository.findBySlipId(slipId);
        checkIfExistingStudy(slipId, slipList);
        return slipList;
    }

    public void saveSlip(Slip slip) {
        repository.save(slip);
    }

    public List<Slip> listSlip() {
        List<Slip> slipList = repository.findAll();
        return slipList;
    }

    private void checkIfExistingStudy(Long slipId, Slip slip) {
        if (slip == null) {
            throw new IllegalArgumentException(slipId + "에 해당하는 스터디가 없습니다.");
        }
    }

    public void updateSlip(SlipForm newForm, Long slipId) {
        Slip bySlipId = repository.findBySlipId(slipId);
        System.out.println("##############################");
        System.out.println("bySlipId : " + bySlipId);
        modelMapper.map(newForm, bySlipId);
        System.out.println("여긴아니고?");
    }

    public void deleteSlip(SlipForm slipId) {
        Slip slip = repository.findBySlipId(slipId.getSlipId());
        repository.delete(slip);
    }
}
