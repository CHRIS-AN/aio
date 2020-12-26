package com.olive.aio.slip.validator;


import com.olive.aio.employee.form.EmplForm;
import com.olive.aio.slip.form.SlipForm;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
@RequiredArgsConstructor
public class SlipValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return SlipForm.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        SlipForm target1 = (SlipForm) target;
        if(errors.hasErrors()){

        }
    }

}
