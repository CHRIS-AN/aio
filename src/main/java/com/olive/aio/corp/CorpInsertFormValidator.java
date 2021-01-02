package com.olive.aio.corp;



import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
@RequiredArgsConstructor
public class CorpInsertFormValidator implements Validator {

    private final CorpRepository corpRepository;


    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.isAssignableFrom(Corp.class);
    }

    @Override
    public void validate(Object object, Errors errors) {
        //TODO 제품명 중복 검사
        Corp corp = (Corp) object;
        if(corpRepository.existsByCorpName(corp.getCorpName())){
            errors.rejectValue("corpName", "invalid.corpName", new Object[]{corp.getCorpName()},"기업명이 중복됩니다.");
        }
    }
}
