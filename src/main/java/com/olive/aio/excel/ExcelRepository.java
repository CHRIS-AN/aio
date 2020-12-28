package com.olive.aio.excel;


import com.olive.aio.domain.Slip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface ExcelRepository extends JpaRepository<Slip, Long> {

   List<Slip> findByPayStatementntTypeAndSlipCodeAndSlipDateBetween(
           String paymentType, String slipCode, String startDate, String minusMonths);
}
