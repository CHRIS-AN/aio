package com.olive.aio.logisticsManage.derivative.form;

//import com.olive.aio.domain.Orders;
import com.olive.aio.domain.Empl;
import com.olive.aio.domain.test.Testorders;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;


@Data
public class TestderivInsertForm {

    @Id
    @GeneratedValue
    private Integer derivid;

    @NotBlank(message="입고일을 입력해주세요.")
    private Date derivregdate;

    @NotBlank
    private String derivstate = "검수요청";

    private Integer derivtotcnt;

    private Empl emplid;

    @NotNull
    private Integer ordersid;

}
