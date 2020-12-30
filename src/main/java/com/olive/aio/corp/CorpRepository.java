package com.olive.aio.corp;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CorpRepository extends JpaRepository<Corp,Long> {
    boolean existsByCorpName(String corpName);
}
