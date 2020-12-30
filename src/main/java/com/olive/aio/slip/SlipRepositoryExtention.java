package com.olive.aio.slip;

import com.olive.aio.domain.Slip;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Transactional(readOnly = true)
public interface SlipRepositoryExtention {

    Page<Slip> findByKeywordAndPayStatementType(String keyword, Pageable pageable);

    // 전표관리 search
    Page<Slip> findByKeywordAndPayStatementType(String keyword, Pageable pageable, String type);

    Page<Slip> findByKeywordAndPayStatementType(Pageable pageable);

    Page<Slip> findByPayStatementTypeAndSlipDateBetweenAndSlipWriteContaining(
            String type, String startDate, String minusMonths, String keyword, Pageable pageable);
}
