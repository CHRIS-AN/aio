package com.olive.aio.draft;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component //빈 설정 파일이 아니라 빈 클래스에서 빈을 직접 등록
@RequiredArgsConstructor // final 이 붙은 맴버변수를 생성자로 만들어준다.
public class DraftValidator implements Validator {

    private final DraftRepository draftRepository;

    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.isAssignableFrom(Draft.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        //발주 희망날짜가 현재날짜보다 과거이면 안됨
        if(draftRepository)

    }
}
