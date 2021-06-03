CREATE SEQUENCE MANAGER_SEQ
INCREMENT BY 1
START WITH 100;

INSERT INTO MEMBER VALUES (MANAGER_SEQ.nextval, 'manager1@kkakjava.com', 'manager1', '임지은', 'F', '서울시 동작구 상도동', SYSDATE, NULL, 0, 'N');
