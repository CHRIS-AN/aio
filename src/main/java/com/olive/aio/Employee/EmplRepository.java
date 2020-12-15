package com.olive.aio.Employee;

import com.olive.aio.domain.Empl;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface EmplRepository extends JpaRepository<Empl, String> {
    Empl findByEmplId(String empl_id);
}
