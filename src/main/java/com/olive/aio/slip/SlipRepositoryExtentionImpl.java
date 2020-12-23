package com.olive.aio.slip;


import com.querydsl.core.QueryResults;
import com.querydsl.jpa.JPQLQuery;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

public class SlipRepositoryExtentionImpl extends QuerydslRepositorySupport implements  SlipRepositoryExtention{

    public SlipRepositoryExtentionImpl() {
        super(Slip.class);
    }

    @Override
    public Page<Slip> findByKeyword(String keyword, Pageable pageable) {
        QSlip slip = QSlip.slip;
        JPQLQuery<Slip> slipJPQLQuery = from(slip).where(
                slip.slip_write.containsIgnoreCase(keyword)
        .or(slip.corp.containsIgnoreCase(keyword)));

        JPQLQuery<Slip> pageableQuery = getQuerydsl().applyPagination(pageable, slipJPQLQuery); // 페이징 처리가 된 쿼리.
        QueryResults<Slip> slipQueryResults = pageableQuery.fetchResults();
        System.out.println("페이징쿼리일까?    :" + pageableQuery);
        return new PageImpl<>(slipQueryResults.getResults(), pageable, slipQueryResults.getTotal());
    }

    @Override
    public Page<Slip> findByKeyword(Pageable pageable) {
        QSlip slip = QSlip.slip;
        JPQLQuery<Slip> slipJPQLQuery = from(slip);
        JPQLQuery<Slip> pageableQuery = getQuerydsl().applyPagination(pageable, slipJPQLQuery); // 페이징 처리가 된 쿼리.
        QueryResults<Slip> slipQueryResults = pageableQuery.fetchResults();
        System.out.println("페이징쿼리일까?    :" + pageableQuery);
        return new PageImpl<>(slipQueryResults.getResults(), pageable, slipQueryResults.getTotal());
    }

//    @Override
//    public Page<Slip> findByKeyword(String keyword, Pageable pageable) {
//        System.out.println("pageableImpl : " + pageable);
//        System.out.println("keywordImpl : " + keyword);
//        System.out.println(QSlip.slip);
//        JPQLQuery<Slip> query = from(QSlip.slip);
//        System.out.println("query : " + query);
//        JPQLQuery<Slip> pageableQuery = getQuerydsl().applyPagination(pageable, query);
//        QueryResults<Slip> fetchResults = pageableQuery.fetchResults();
//        return new PageImpl<>(fetchResults.getResults(), pageable, fetchResults.getTotal());
//    } // search 키워드 Slip 구현체


}
