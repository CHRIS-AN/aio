
/* Drop Triggers */

DROP TRIGGER TRI_prod_prod_id;
DROP TRIGGER TRI_slip_slip_uid;



/* Drop Tables */

DROP TABLE slip CASCADE CONSTRAINTS;
DROP TABLE account CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE relea_dummy CASCADE CONSTRAINTS;
DROP TABLE stock CASCADE CONSTRAINTS;
DROP TABLE prod CASCADE CONSTRAINTS;
DROP TABLE corp CASCADE CONSTRAINTS;
DROP TABLE derivative CASCADE CONSTRAINTS;
DROP TABLE order_list CASCADE CONSTRAINTS;
DROP TABLE release CASCADE CONSTRAINTS;
DROP TABLE workt CASCADE CONSTRAINTS;
DROP TABLE empl CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_prod_prod_id;
DROP SEQUENCE SEQ_ship_ship_id;
DROP SEQUENCE SEQ_slip_slip_uid;




/* Create Sequences */

CREATE SEQUENCE SEQ_prod_prod_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ship_ship_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_slip_slip_uid INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE account
(
    account_uid number NOT NULL,
    account_name varchar2(20) NOT NULL,
    PRIMARY KEY (account_uid)
);


CREATE TABLE corp
(
    corp_id varchar2(40) NOT NULL,
    corp_name varchar2(100) NOT NULL UNIQUE,
    corp_address varchar2(100) NOT NULL,
    corp_call number NOT NULL,
    corp_ceo varchar2(40) NOT NULL,
    PRIMARY KEY (corp_id)
);


CREATE TABLE derivative
(
    -- D + 입고날짜 + 0001
    deriv_id varchar2(40) NOT NULL,
    deriv_cnt number,
    deriv_date date NOT NULL,
    -- O000000001
    order_id varchar2(40) NOT NULL,
    deriv_state varchar2(20) NOT NULL,
    PRIMARY KEY (deriv_id)
);


CREATE TABLE empl
(
    --
    --
    empl_id varchar2(100) NOT NULL,
    name varchar2(20) NOT NULL,
    birth varchar2(40) NOT NULL,
    address varchar2(100) NOT NULL,
    post_num number not null,
    phone varchar2(50) NOT NULL,
    -- 부서(인사,재무,제품,물류,영업)
    dept varchar2(20) NOT NULL,
    pw varchar2(100) NOT NULL,
    photo clob NOT NULL,
    email varchar2(100) NOT NULL,
    empl_jumin varchar2(20) NOT NULL,
    work_state varchar2(20) NOT NULL,
    empl_regdate varchar2(40) not null,
    empl_resigdate varchar2(40),
    PRIMARY KEY (empl_id)
);

CREATE TABLE Calendar
{
    empl_id varchar2(100) not null,
    cal_workt date not null,
    cal_resigdate date,
    work_state varchar2(20) not null,
}


CREATE TABLE orders
(
    -- 발주서에 등록하는 주문할 제품 갯수
    --
    order_cnt number NOT NULL,
    order_pro_price number NOT NULL,
    -- c00000001
    prod_id number NOT NULL,
    -- O000000001
    order_id varchar2(40) NOT NULL
);


CREATE TABLE order_list
(
    -- O000000001
    order_id varchar2(40) NOT NULL,
    order_cnt number NOT NULL,
    order_regdate date NOT NULL,
    order_state varchar2(20) NOT NULL,
    --
    --
    empl_id varchar2(100) NOT NULL,
    order_totsum number NOT NULL,
    PRIMARY KEY (order_id)
);


CREATE TABLE prod
(
    -- c00000001
    prod_id number NOT NULL,
    prod_name varchar2(40) NOT NULL UNIQUE,
    prod_bundle number NOT NULL,
    sell_price number NOT NULL,
    buy_price number NOT NULL,
    prod_catag varchar2(20) NOT NULL,
    prod_img clob,
    prod_explain clob,
    corp_id varchar2(40) NOT NULL,
    PRIMARY KEY (prod_id)
);


CREATE TABLE release
(
    -- R + 출고일자 + 0001
    --
    relea_id varchar2(40) NOT NULL,
    relea_cnt number,
    relea_date date NOT NULL,
    --
    --
    empl_id varchar2(100) NOT NULL,
    relea_state varchar2(20) NOT NULL,
    PRIMARY KEY (relea_id)
);


CREATE TABLE relea_dummy
(
    dum_cnt number NOT NULL,
    dum_price number NOT NULL,
    dum_regdate date NOT NULL,
    -- M + 0001
    dum_id varchar2(20) NOT NULL,
    -- c00000001
    prod_id number NOT NULL
);


CREATE TABLE slip
(
    slip_uid number NOT NULL,
    slip_date date NOT NULL,
    slip_summmary varchar2(100) NOT NULL,
    slip_account number NOT NULL,
    slip_write varchar2(20) NOT NULL,
    slip_type varchar2(20) NOT NULL,
    --
    --
    empl_id varchar2(100) NOT NULL,
    slip_comment clob,
    slip_ok varchar2(20),
    account_uid number NOT NULL,
    PRIMARY KEY (slip_uid)
);


CREATE TABLE stock
(
    stock_cnt number NOT NULL,
    real_cnt number,
    -- c00000001
    prod_id number NOT NULL
);


CREATE TABLE workt
(
    start_time timestamp NOT NULL,
    end_time timestamp NOT NULL,
    em_state varchar2(50),
    --
    --
    empl_id varchar2(100) NOT NULL
);



/* Create Foreign Keys */
ALTER TABLE calendar
    ADD FOREIGN KEY (empl_id)
        REFERENCES empl (empl_id)
;


ALTER TABLE slip
    ADD FOREIGN KEY (account_uid)
        REFERENCES account (account_uid)
;


ALTER TABLE prod
    ADD FOREIGN KEY (corp_id)
        REFERENCES corp (corp_id)
;


ALTER TABLE order_list
    ADD FOREIGN KEY (empl_id)
        REFERENCES empl (empl_id)
;


ALTER TABLE release
    ADD FOREIGN KEY (empl_id)
        REFERENCES empl (empl_id)
;


ALTER TABLE slip
    ADD FOREIGN KEY (empl_id)
        REFERENCES empl (empl_id)
;


ALTER TABLE workt
    ADD FOREIGN KEY (empl_id)
        REFERENCES empl (empl_id)
;


ALTER TABLE derivative
    ADD FOREIGN KEY (order_id)
        REFERENCES order_list (order_id)
;


ALTER TABLE orders
    ADD FOREIGN KEY (order_id)
        REFERENCES order_list (order_id)
;


ALTER TABLE orders
    ADD FOREIGN KEY (prod_id)
        REFERENCES prod (prod_id)
;


ALTER TABLE relea_dummy
    ADD FOREIGN KEY (prod_id)
        REFERENCES prod (prod_id)
;


ALTER TABLE stock
    ADD FOREIGN KEY (prod_id)
        REFERENCES prod (prod_id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_prod_prod_id BEFORE INSERT ON prod
    FOR EACH ROW
BEGIN
    SELECT SEQ_prod_prod_id.nextval
    INTO :new.prod_id
    FROM dual;
END;


/

CREATE OR REPLACE TRIGGER TRI_slip_slip_uid BEFORE INSERT ON slip
    FOR EACH ROW
BEGIN
    SELECT SEQ_slip_slip_uid.nextval
    INTO :new.slip_uid
    FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN derivative.deriv_id IS 'D + 입고날짜 + 0001';
COMMENT ON COLUMN derivative.order_id IS 'O000000001';
COMMENT ON COLUMN empl.empl_id IS '
';
COMMENT ON COLUMN empl.dept IS '부서(인사,재무,제품,물류,영업)';
COMMENT ON COLUMN orders.order_cnt IS '발주서에 등록하는 주문할 제품 갯수
';
COMMENT ON COLUMN orders.prod_id IS 'c00000001';
COMMENT ON COLUMN orders.order_id IS 'O000000001';
COMMENT ON COLUMN order_list.order_id IS 'O000000001';
COMMENT ON COLUMN order_list.empl_id IS '
';
COMMENT ON COLUMN prod.prod_id IS 'c00000001';
COMMENT ON COLUMN release.relea_id IS 'R + 출고일자 + 0001
';
COMMENT ON COLUMN release.empl_id IS '
';
COMMENT ON COLUMN relea_dummy.dum_id IS 'M + 0001';
COMMENT ON COLUMN relea_dummy.prod_id IS 'c00000001';
COMMENT ON COLUMN slip.empl_id IS '
';
COMMENT ON COLUMN stock.prod_id IS 'c00000001';
COMMENT ON COLUMN workt.empl_id IS '
';



