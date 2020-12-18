package com.olive.aio.slip;


import com.querydsl.core.QueryResults;
import com.querydsl.jpa.JPQLQuery;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import java.util.List;

public class SlipRepositoryExtentionImpl extends QuerydslRepositorySupport implements  SlipRepositoryExtention{

    public SlipRepositoryExtentionImpl() {
        super(Slip.class);
    }

    @Override
    public List<Slip> findByKeyword(String keyword) {
//        QSlip slip = QSlip.slip;
//        JPQLQuery<Slip> slipJPQLQuery = from(slip).where(slip.slip_write.containsIgnoreCase(keyword));

        return null;
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
