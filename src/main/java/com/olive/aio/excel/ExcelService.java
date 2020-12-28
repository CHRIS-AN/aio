package com.olive.aio.excel;


import com.olive.aio.domain.Slip;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Service
@Transactional
@RequiredArgsConstructor
public class ExcelService {

    private final ExcelRepository repository;

    public List<Slip> countIncomeStatement(String paymentType, String type, String startDate, String minusMonths) {
        List<Slip> slipIncomeStatement = repository.findByPayStatementntTypeAndSlipCodeAndSlipDateBetween(
                paymentType, type, startDate, minusMonths);
        return slipIncomeStatement;
    }
    public String setComma(String num) {
        String strResult = num;
        Pattern p = Pattern.compile("(^[+-]?\\d+)(\\d{3})");
        Matcher regexMatcher = p.matcher(num);

        try {
            while(regexMatcher.find()) {
                strResult = regexMatcher.replaceAll("$1,$2");
                regexMatcher.reset(strResult);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return strResult;
    }
    public String setComma(int num) {
        return setComma(String.valueOf(num));
    }
}
