package com.olive.aio.employee;

import com.olive.aio.domain.Empl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface EmplRepository extends JpaRepository<Empl, String>, EmplRepositoryExtention {
    Empl findByEmplId(String empl_id);
}
