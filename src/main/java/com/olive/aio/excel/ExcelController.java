package com.olive.aio.excel;


import lombok.RequiredArgsConstructor;
import org.apache.catalina.LifecycleState;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/finance")
@RequiredArgsConstructor
public class ExcelController {

    private final ExcelRepository repository;
    // 손익
    @RequestMapping("/incomeView")
    public String income() {
        return "finance/incomeView";
    }

    // 화장품 전표 엑셀 다운로드 !
    @PostMapping("/downloadExcel")
    public void downloadExcel(HttpServletResponse response) throws Exception {

        // 엑셀 파일 하나를 만듬.
        Workbook wb = new HSSFWorkbook();
        // 엑셀 파일 내부에 Sheet를 하나 생성합니다. ( 엑셀 파일 하나에는 여러 Sheet이 있을 수 있다)
        Sheet sheet = wb.createSheet("손익계산서");

        // 엑셀 랜더링에 필요한 DTO를 가져옵니다.
        List<CosmaticExcel> cosmaticExcels;


        // header
        int rowIndex = 0;
        Row headerRow = sheet.createRow(rowIndex++);
        Cell headerCell1 = headerRow.createCell(0);
        headerCell1.setCellValue("과목");

        Cell headerCell2 = headerRow.createCell(1);
        headerCell2.setCellValue("금액");

        // data


    }
}
