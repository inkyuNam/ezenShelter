create or replace procedure boardGetAllCount(
    p_tableName NUMBER,
    p_cnt OUT NUMBER
)
IS
    v_cnt NUMBER;
BEGIN
    if p_tableName = 1 THEN
    select count(*) INTO v_cnt FROM board;
    END IF;
    p_cnt := v_cnt;
END;
-------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE boardList(
    p_startNum IN NUMBER,
    p_endNum IN NUMBER,
    p_rc   OUT     SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_rc FOR
    select * from(
    select * from(
    select rownum as rn, b.*from
    ((SELECT*FROM board ORDER BY b_num DESC)b)
    )where rn>=p_startNum
    )where rn<=p_endNum;
END;
