package com.olive.aio.employee;

import com.olive.aio.domain.Empl;
import com.olive.aio.employee.form.EmplForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Slf4j
@Controller
@RequiredArgsConstructor
public class EmplCotroller {

    private final EmplService emplService;

    private static final String EMPL_VIEW_PREFIX = "yeonsup/hr/";

    @GetMapping("/hr")
    public String manageHR(Model model, @CurrentEmpl Empl empl) {
        model.addAttribute(new EmplForm());
        model.addAttribute("empl", empl);

        return EMPL_VIEW_PREFIX + "manage";
    }

    @PostMapping("/hr")
    public String createMember(@CurrentEmpl Empl empl, @Valid EmplForm emplForm, Errors errors, Model model) {
        model.addAttribute(empl);
        log.info(emplForm.toString());
        if (emplService.addErrors(emplForm, errors, model)) {

            return EMPL_VIEW_PREFIX + "manage";
        }

        emplForm.setEmplResigdate("");

        emplService.saveEmpl(emplForm);
        return "redirect:/hr";
    }


}
