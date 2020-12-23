package com.olive.aio.employee;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.olive.aio.domain.Empl;
import com.olive.aio.employee.form.EmplForm;
import com.olive.aio.employee.form.EmplUpdateForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
public class EmplController {

    private final EmplService emplService;
    private final ObjectMapper objectMapper;

    private static final String EMPL_VIEW_PREFIX = "yeonsup/hr/";

    @GetMapping("/hr/read")
    public String manageHR() throws JsonProcessingException {
        List<Empl> empls = emplService.loadAllEmpl();

        return objectMapper.writeValueAsString(empls);
    }

    @PostMapping("/hr/read/{emplId}")
    public String manageHR(@PathVariable String emplId) throws JsonProcessingException {
        List<Empl> empls = new ArrayList<>();
        Empl empl = emplService.loadByEmplId(emplId);

        if(empl.getEmplResigdate() == null){
            empl.setEmplResigdate("");
        }

        empls.add(empl);
        return objectMapper.writeValueAsString(empls);
    }

    @PostMapping("/hr/update")
    public String updateMember(@CurrentEmpl Empl empl, @Valid EmplUpdateForm emplForm, Errors errors) throws JsonProcessingException {
        Map<String, Object> jsonMap = new HashMap<>();



        if (emplService.addAjaxErrors(errors, jsonMap)) {
            List<EmplUpdateForm> emplForms = new ArrayList<>();
            emplForms.add(emplForm);
            jsonMap.put("state", "fail");
            jsonMap.put("data", emplForm);
            return objectMapper.writeValueAsString(jsonMap);
        }

        emplService.updateEmpl(empl, emplForm);
        List<Empl> empls = emplService.loadAllEmpl();

        jsonMap.put("data", empls);
        jsonMap.put("state","success");


        return objectMapper.writeValueAsString(jsonMap);
    }

    @PostMapping("/hr/update/reset")
    public Map<String, String> resetPw(@CurrentEmpl Empl empl, String password, String emplId) {
        Map<String, String> jsonMap = new HashMap<>();
        log.info(password);
        log.info(emplId);
        if(emplService.checkPassword(empl, password)) {
            jsonMap.put("state", "fail");
            return jsonMap;
        }

        emplService.sendEmail(empl, emplId);

        jsonMap.put("state", "success");
        return jsonMap;
    }

}
