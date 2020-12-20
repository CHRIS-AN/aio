package com.olive.aio.employee;

import com.olive.aio.domain.Empl;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface EmplRepositoryExtention{

    Page<Empl> findByKeyword(String dept, String keyword, Pageable pageable);

}
