package com.olive.aio.slip;


import com.olive.aio.domain.QSlip;
import com.olive.aio.domain.Slip;
import com.querydsl.core.QueryResults;
import com.querydsl.jpa.JPQLQuery;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import java.time.LocalDateTime;

public class SlipRepositoryExtentionImpl extends QuerydslRepositorySupport implements  SlipRepositoryExtention{

    public SlipRepositoryExtentionImpl() {
        super(Slip.class);
    }

    @Override
    public Page<Slip> findByKeywordAndPayStatementType(String keyword, Pageable pageable) {
        QSlip slip = QSlip.slip;
        JPQLQuery<Slip> slipJPQLQuery = from(slip).where(slip.payStatementntType.containsIgnoreCase("대기")
               .and((slip.slipWrite.containsIgnoreCase(keyword))
                .or(slip.corp.containsIgnoreCase(keyword))));

        JPQLQuery<Slip> pageableQuery = getQuerydsl().applyPagination(pageable, slipJPQLQuery);
        QueryResults<Slip> slipQueryResults = pageableQuery.fetchResults();
        return new PageImpl<>(slipQueryResults.getResults(), pageable, slipQueryResults.getTotal());
    }

    @Override
    public Page<Slip> findByKeywordAndPayStatementType(String keyword, Pageable pageable, String type) {
        QSlip slip = QSlip.slip;
        JPQLQuery<Slip> slipJPQLQuery = from(slip).where(slip.payStatementntType.containsIgnoreCase(type)
                .and((slip.slipWrite.containsIgnoreCase(keyword))
                        .or(slip.corp.containsIgnoreCase(keyword))));

        JPQLQuery<Slip> pageableQuery = getQuerydsl().applyPagination(pageable, slipJPQLQuery);
        QueryResults<Slip> slipQueryResults = pageableQuery.fetchResults();
        return new PageImpl<>(slipQueryResults.getResults(), pageable, slipQueryResults.getTotal());
    }

    @Override
    public Page<Slip> findByKeywordAndPayStatementType(Pageable pageable) {
        QSlip slip = QSlip.slip;
        JPQLQuery<Slip> slipJPQLQuery = from(slip).where(slip.payStatementntType.containsIgnoreCase("대기"));
        JPQLQuery<Slip> pageableQuery = getQuerydsl().applyPagination(pageable, slipJPQLQuery);
        QueryResults<Slip> slipQueryResults = pageableQuery.fetchResults();
        return new PageImpl<>(slipQueryResults.getResults(), pageable, slipQueryResults.getTotal());
    }


    // 전표 관리에서 keyword 검색 후, paging
    @Override
    public Page<Slip> findByPayStatementTypeAndSlipDateBetweenAndSlipWriteContaining(String type, String startDate, String minusMonths, String keyword, Pageable pageable) {
        QSlip slip = QSlip.slip;
        JPQLQuery<Slip> slipJPQLQuery = from(slip).where(slip.payStatementntType.containsIgnoreCase("승인")
                .and((slip.slipWrite.containsIgnoreCase(keyword))
                        .or(slip.corp.containsIgnoreCase(keyword))));

        JPQLQuery<Slip> pageableQuery = getQuerydsl().applyPagination(pageable, slipJPQLQuery);
        QueryResults<Slip> slipQueryResults = pageableQuery.fetchResults();
        return new PageImpl<>(slipQueryResults.getResults(), pageable, slipQueryResults.getTotal());
    }
}
