package com.olive.aio.draft;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DraftRepository extends JpaRepository<Draft,Long> {
}
