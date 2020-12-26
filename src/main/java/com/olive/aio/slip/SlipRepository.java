package com.olive.aio.slip;

import com.olive.aio.domain.Slip;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Transactional(readOnly = true)
public interface SlipRepository extends JpaRepository<Slip, Long>, SlipRepositoryExtention {

    // 상세보기
    Slip findBySlipId(Long SlipId);
    // 전표관리
    Slip findBySlipId(String SlipId);

    List<Slip> findByPayStatementntType(String payStatementntType);

    Page<Slip> findByPayStatementntTypeAndSlipDateBetweenAndSlipWriteContaining(
            String type, String startDate, String minusMonths, String keyword, Pageable pageable );
}
