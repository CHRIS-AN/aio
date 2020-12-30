package com.olive.aio.orders;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.olive.aio.corp.Corp;
import com.olive.aio.domain.Empl;
import com.olive.aio.draft.Draft;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

//@Data //@ToString, @EqualsAndHashCode : equals()와 hashCode() 자동생성, @Getter, @Setter, @RequiredArgsConstructor
@NoArgsConstructor //Paramete가 없는 생성자 생성
@AllArgsConstructor //모든 인스턴스 변수를 포함하는 생성자 생성
@Getter @Setter
@Entity //해당 클래스 인스턴스 변수들이 Entity임을 명시함. JPA를 사용해서 테이블과 매필할 클래스에 붙이는 어노테이션. 데이터베이스에 저장하기 위해서 유저가 정의한 클래스.
@Table(name = "ORDERS") //클래스 선언부에 작성, 테이블명을 정해준다. 미지정 시 클래스 명으로 생성됨
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id //기본 키 매핑 어노테이션. 필수사항
    @GeneratedValue //id가 선언된 필드에 기본 키 값을 자동으로 할당 (Default : AUTO)
    private Long orders_id; //발주번호

    @NotNull //null과 "", " " 허용안함
    private int orders_cnt; //총수량

    @NotNull //null 허용안함
//    @Temporal(TemporalType.DATE) // 년-월-일 의 Date 타입
//    @Future
    private String orders_regdate; //납기일자

    @NotNull //null과 "" 허용안함
    private String orders_state; //상태

    @NotNull
    private int orders_totsum; //총금액

    @ManyToOne
    @JsonBackReference
    Corp corp;

    @ManyToOne
    @JsonBackReference
    Empl empl;

    @OneToMany(mappedBy = "orders", fetch = FetchType.EAGER)
    @JsonManagedReference
    private Set<Draft> draft = new HashSet<>();

    public void addDraft(Draft draft) {
        this.draft.add(draft);
        draft.setOrders(this);
    }

}
