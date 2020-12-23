package com.olive.aio.employee;

import com.olive.aio.domain.Empl;
import com.olive.aio.domain.QEmpl;
import com.querydsl.core.QueryResults;
import com.querydsl.jpa.JPQLQuery;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;

import java.util.List;

public class EmplRepositoryExtentionImpl extends QuerydslRepositorySupport implements EmplRepositoryExtention{

    public EmplRepositoryExtentionImpl() {
        super(Empl.class);
    }

    @Override
    public Page<Empl> findByKeyword(String dept, String keyword, Pageable pageable) {
        QEmpl empl = QEmpl.empl;

        JPQLQuery<Empl> query = from(empl).where(empl.name.containsIgnoreCase(keyword)
                        .and(empl.dept.contains(dept)));
        JPQLQuery<Empl> pageableQuery = getQuerydsl().applyPagination(pageable, query);
        QueryResults<Empl> emplQueryResults = pageableQuery.fetchResults();

        return new PageImpl<>(emplQueryResults.getResults(), pageable, emplQueryResults.getTotal());
    }
}
