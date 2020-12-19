package com.olive.aio.order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data //@ToString, @EqualsAndHashCode : equals()와 hashCode() 자동생성, @Getter, @Setter, @RequiredArgsConstructor
@NoArgsConstructor //Paramete가 없는 생성자 생성
@AllArgsConstructor //모든 인스턴스 변수를 포함하는 생성자 생성

@Entity //해당 클래스 인스턴스 변수들이 Entity임을 명시함. JPA를 사용해서 테이블과 매필할 클래스에 붙이는 어노테이션. 데이터베이스에 저장하기 위해서 유저가 정의한 클래스.
@Table(name = "ORDERS") //클래스 선언부에 작성, 테이블명을 정해준다. 미지정 시 클래스 명으로 생성됨
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id //기본 키 매핑 어노테이션. 필수사항
    @GeneratedValue //id가 선언된 필드에 기본 키 값을 자동으로 할당 (Default : AUTO)
    private Long orders_id; //발주번호

    @NotBlank //null과 "", " " 허용안함
    private int orders_cnt; //총수량

    @NotNull //null 허용안함
//    @Temporal(TemporalType.DATE) // 년-월-일 의 Date 타입
    @Future
    private String orders_regdate; //납기일자

    @NotEmpty //null과 "" 허용안함
    private String orders_state; //상태

    @NotBlank
    private int orders_totsum; //총금액

}


