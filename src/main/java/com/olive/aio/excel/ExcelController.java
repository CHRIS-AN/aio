package com.olive.aio.excel;


import com.olive.aio.domain.Slip;
import com.olive.aio.slip.SlipRepository;
import com.olive.aio.slip.SlipService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.LifecycleState;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
@Controller
@RequestMapping("/finance")
@RequiredArgsConstructor
public class ExcelController {

    private final SlipRepository repository;
    private final SlipService slipService;
    private final ExcelService excelService;

    static final String IS = "/incomeStatement";
    static final String FINANCE = "finance";

    // 손익
    @GetMapping(IS)
    public String incomeStatement(Model model, Integer months) {
        System.out.println("손익계산서 months:" + months);
        if (months == null || months.equals("null")) {
            months = 0;
        }
        if(months != null) {
            Date tday = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(tday);
            calendar.add(Calendar.MONTH, -months);

            // 매출액
            String [] take = {"외상매입금", "지급어음", "미지급금", "선수수익"};
            // 매입액
            String [] costOfSales = {"상품(화장품)"};
            // 판매비와 관리비
            String [] maintenanceSales = {"소모품비", "회의비", "복리후생비", "여비교통비", "접대비", "통신비", "인쇄비",
                    "교육훈련비", "원재료비", "급여", "잡금"};
            // 기타수익
            String [] otherIncome = {"이자수익", "관세환급금", "임대료", "잡이익", "국고보조금"};
            // 기타비용
            String [] otherExpenses = {"기부금", "잡손실"};
            // 법인세비
            String [] incomeTaxExpense = {"법인세"};

            int takeI = 0;
            int costOfSalesI = 0;
            int otherIncomeI = 0;
            int otherExpensesI = 0;
            int incomeTaxExpenseI = 0;
            int maintenanceSalesI = 0;

            // 판매비와 관리비 maintenanceSales
            for (int i = 0; i < maintenanceSales.length; i++ ) {
                List<Slip> slipIncomeStatement = excelService.countIncomeStatement("승인",
                            maintenanceSales[i],
                        new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()),
                        new SimpleDateFormat("yyyy-MM-dd").format(tday));
                for(Slip slip : slipIncomeStatement) {
                   String account = slip.getSlip_account().replaceAll(",","");
                    maintenanceSalesI += Integer.parseInt(account);
                   String vat = slip.getSlip_vat().replaceAll(",","");
                    maintenanceSalesI += Integer.parseInt(vat);
                   String cc = excelService.setComma(maintenanceSalesI);
                   model.addAttribute("maintenanceSales", cc);
                }
            }//end for문 (maintenanceSales)


            // 매출액 take
            for (int i = 0; i < take.length; i++ ) {
                List<Slip> slipIncomeStatement = excelService.countIncomeStatement("승인",
                        take[i],
                        new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()),
                        new SimpleDateFormat("yyyy-MM-dd").format(tday));
                for(Slip slip : slipIncomeStatement) {
                    String account = slip.getSlip_account().replaceAll(",","");
                    takeI += Integer.parseInt(account);
                    String vat = slip.getSlip_vat().replaceAll(",","");
                    takeI += Integer.parseInt(vat);
                    String cc = excelService.setComma(takeI);
                    model.addAttribute("take", cc);
                }
            }//end for문 (take)

            // 매입액 costOfSales
            for (int i = 0; i < costOfSales.length; i++ ) {
                List<Slip> slipIncomeStatement = excelService.countIncomeStatement("승인",
                        costOfSales[i],
                        new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()),
                        new SimpleDateFormat("yyyy-MM-dd").format(tday));
                for(Slip slip : slipIncomeStatement) {
                    String account = slip.getSlip_account().replaceAll(",","");
                    costOfSalesI += Integer.parseInt(account);
                    String vat = slip.getSlip_vat().replaceAll(",","");
                    costOfSalesI += Integer.parseInt(vat);
                    String cc = excelService.setComma(costOfSalesI);
                    model.addAttribute("costOfSales", cc);
                }
            }//end for문 (costOfSales)

            // 매출 총이익
            int grossProfit = takeI - costOfSalesI;
            String dd = excelService.setComma(grossProfit);
            model.addAttribute("grossProfit", dd);


            // 기타수익 otherIncome
            for (int i = 0; i < otherIncome.length; i++ ) {
                List<Slip> slipIncomeStatement = excelService.countIncomeStatement("승인",
                        otherIncome[i],
                        new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()),
                        new SimpleDateFormat("yyyy-MM-dd").format(tday));
                for(Slip slip : slipIncomeStatement) {
                    String account = slip.getSlip_account().replaceAll(",","");
                    otherIncomeI += Integer.parseInt(account);
                    String vat = slip.getSlip_vat().replaceAll(",","");
                    otherIncomeI += Integer.parseInt(vat);
                    String cc = excelService.setComma(otherIncomeI);
                    model.addAttribute("otherIncome", cc);
                }
            }//end for문 (otherIncome)

            // 기타비용 otherExpenses
            for (int i = 0; i < otherExpenses.length; i++ ) {
                List<Slip> slipIncomeStatement = excelService.countIncomeStatement("승인",
                        otherExpenses[i],
                        new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()),
                        new SimpleDateFormat("yyyy-MM-dd").format(tday));
                for(Slip slip : slipIncomeStatement) {
                    String account = slip.getSlip_account().replaceAll(",","");
                    otherExpensesI += Integer.parseInt(account);
                    String vat = slip.getSlip_vat().replaceAll(",","");
                    otherExpensesI += Integer.parseInt(vat);
                    String cc = excelService.setComma(otherExpensesI);
                    model.addAttribute("otherExpenses", cc);
                }
            }//end for문 (otherExpenses)


            // 영업 이익
            int salesIncome = otherIncomeI - otherExpensesI;
            String ee = excelService.setComma(salesIncome);
            model.addAttribute("salesIncome", ee);


            // 법인세비 incomeTaxExpense
            for (int i = 0; i < incomeTaxExpense.length; i++ ) {
                List<Slip> slipIncomeStatement = excelService.countIncomeStatement("승인",
                        incomeTaxExpense[i],
                        new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()),
                        new SimpleDateFormat("yyyy-MM-dd").format(tday));
                for(Slip slip : slipIncomeStatement) {
                    String account = slip.getSlip_account().replaceAll(",","");
                    incomeTaxExpenseI += Integer.parseInt(account);
                    String vat = slip.getSlip_vat().replaceAll(",","");
                    incomeTaxExpenseI += Integer.parseInt(vat);
                    String cc = excelService.setComma(incomeTaxExpenseI);
                    model.addAttribute("incomeTaxExpense", cc);
                }
            }//end for문 (incomeTaxExpense)


            // 당기수익
            int netIncomeI = 0;
            netIncomeI = grossProfit - maintenanceSalesI + salesIncome - incomeTaxExpenseI;
            String gg = excelService.setComma(netIncomeI);
            model.addAttribute("netIncome", gg);


        }
        return "finance" + IS;
    }

    @PostMapping(IS)
    public String spendingResolutionRegisterSubmit(@Valid Slip slip, Errors errors, Model model) {
        if (errors.hasErrors()) {
            model.addAttribute("slip", slip);

            Map<String, String> validatorResult = SlipService.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
                log.info(key);
            }
            return FINANCE +  IS;
        }
        slipService.saveSlip(slip);
        return "thymeleaf/searchList" + IS;
    }


    // 화장품 전표 하나당 엑셀 다운로드 !
    @GetMapping("/downloadExcel")
    public void downloadExcel(HttpServletResponse response, Long slipId) throws Exception {

        System.out.println("slipId : " + slipId);
        // 엑셀 파일 하나를 만듬.
        Workbook wb = new HSSFWorkbook();
        // 엑셀 파일 내부에 Sheet를 하나 생성합니다. ( 엑셀 파일 하나에는 여러 Sheet이 있을 수 있다)
        Sheet sheet = wb.createSheet("손익계산서");

        // 엑셀 랜더링에 필요한 DTO를 가져옵니다.
        Slip cosmaticExcels = repository.findBySlipId(slipId);

        // header
        int rowIndex = 0;

        Row headerRow = sheet.createRow(rowIndex++);

        Cell headerCell1 = headerRow.createCell(0);
        headerCell1.setCellValue("거래타입");

        Cell headerCell2 = headerRow.createCell(1);
        headerCell2.setCellValue("등록날짜");

        Cell headerCell3 = headerRow.createCell(2);
        headerCell3.setCellValue("작성자");

        Cell headerCell4 = headerRow.createCell(3);
        headerCell4.setCellValue("계정코드,");

        Cell headerCell5 = headerRow.createCell(4);
        headerCell5.setCellValue("거래처");

        Cell headerCell6 = headerRow.createCell(5);
        headerCell6.setCellValue("전표금액");

        Cell headerCell7 = headerRow.createCell(6);
        headerCell7.setCellValue("부가세");

        Cell headerCell8 = headerRow.createCell(7);
        headerCell8.setCellValue("적요");

        Cell headerCell9 = headerRow.createCell(8);
        headerCell9.setCellValue("결제방법");

        // data

            Row bodyRow = sheet.createRow(rowIndex++);

            Cell bodyCell1 = bodyRow.createCell(0);
            bodyCell1.setCellValue(cosmaticExcels.getTradingType());

            Cell bodyCell2 = bodyRow.createCell(1);
            bodyCell2.setCellValue(cosmaticExcels.getSlipWrite());

            Cell bodyCell3 = bodyRow.createCell(2);
            bodyCell3.setCellValue(cosmaticExcels.getSlipDate());

            Cell bodyCell4 = bodyRow.createCell(3);
            bodyCell4.setCellValue(cosmaticExcels.getSlipCode());

            Cell bodyCell5 = bodyRow.createCell(4);
            bodyCell5.setCellValue(cosmaticExcels.getCorp());

            Cell bodyCell6 = bodyRow.createCell(5);
            bodyCell6.setCellValue(cosmaticExcels.getSlip_account());

            Cell bodyCell7 = bodyRow.createCell(6);
            bodyCell7.setCellValue(cosmaticExcels.getSlip_vat());

            Cell bodyCell8 = bodyRow.createCell(7);
            bodyCell8.setCellValue(cosmaticExcels.getSlip_summary());

            Cell bodyCell9 = bodyRow.createCell(8);
            bodyCell9.setCellValue(cosmaticExcels.getPaymentType());

            response.setContentType("ms-vnd/excel");
            response.setHeader("Content-Disposition", "attachment;filename=test.xls");

        wb.write(response.getOutputStream());
        wb.close();
    }
}
