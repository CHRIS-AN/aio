package com.olive.aio.accounting;

import com.olive.aio.domain.Slip;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountingRepository extends JpaRepository<Slip, Long> {



}
