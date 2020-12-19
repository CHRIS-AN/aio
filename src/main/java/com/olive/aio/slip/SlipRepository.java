package com.olive.aio.slip;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface SlipRepository extends JpaRepository<Slip, Long>, SlipRepositoryExtention {

    Slip findBySlipId(Long SlipId);
}
