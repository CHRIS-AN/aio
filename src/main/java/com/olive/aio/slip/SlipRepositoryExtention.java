package com.olive.aio.slip;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface SlipRepositoryExtention {

    Page<Slip> findByKeyword(String keyword, Pageable pageable);
    Page<Slip> findByKeyword(Pageable pageable);
}
