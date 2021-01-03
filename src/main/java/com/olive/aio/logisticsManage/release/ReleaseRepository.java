package com.olive.aio.logisticsManage.release;

import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.Release;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface ReleaseRepository extends JpaRepository<Release, Integer>{

    // 검수대기 리스트 조회
    List<Release> findByReleastateOrderByReleaidAsc(String state);
    List<Release> findByReleastateOrderByReleaidDesc(String state);

    Release findByReleaid(Integer releaid);
    Release findByRequestid(Integer requestid);

}