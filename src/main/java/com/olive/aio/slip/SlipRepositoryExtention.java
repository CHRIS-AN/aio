package com.olive.aio.slip;

import com.olive.aio.domain.Slip;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Transactional(readOnly = true)
public interface SlipRepositoryExtention {

    Page<Slip> findByKeywordAndPayStatementType(String keyword, Pageable pageable);

    Page<Slip> findByKeywordAndPayStatementType(Pageable pageable);
}
