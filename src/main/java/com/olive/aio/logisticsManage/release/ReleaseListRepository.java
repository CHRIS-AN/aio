package com.olive.aio.logisticsManage.release;

import com.olive.aio.domain.Release;
import com.olive.aio.domain.Releaselist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface ReleaseListRepository extends JpaRepository<Releaselist, Integer>{


}


