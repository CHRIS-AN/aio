package com.olive.aio.orders;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository //지속성 계층에서 DAO 구성요소를 나타내는데 사용되는 주석. 인터페이스가 해당 레포지토리를 사용해 데이터베이스 활동을 수행할 것임을 컴파일러에 알립니다.
public interface OrdersRepository extends JpaRepository<Orders, Long> {
    // 기본으로 제공되는 함수가 아닌 쿼리문을 직접 작성하는 부분
}
