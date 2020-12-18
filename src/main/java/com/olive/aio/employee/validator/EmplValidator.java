package com.olive.aio.employee.validator;

import com.olive.aio.employee.form.EmplForm;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
@RequiredArgsConstructor
public class EmplValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return EmplForm.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        EmplForm target1 = (EmplForm) target;
        if(errors.hasErrors()){

        }
    }
}
