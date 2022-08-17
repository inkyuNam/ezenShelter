

/* Drop Tables */

DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE heart CASCADE CONSTRAINTS;
DROP TABLE help CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE pet CASCADE CONSTRAINTS;
DROP TABLE shelter CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_adopt_ad_num;
DROP SEQUENCE SEQ_board_b_num;
DROP SEQUENCE SEQ_cart_c_num;
DROP SEQUENCE SEQ_heart_num;
DROP SEQUENCE SEQ_help_h_num;
DROP SEQUENCE SEQ_order_detail_od_num;
DROP SEQUENCE SEQ_order_o_num;
DROP SEQUENCE SEQ_pet_p_num;
DROP SEQUENCE SEQ_product_pd_num;
DROP SEQUENCE SEQ_qna_qa_num;
DROP SEQUENCE SEQ_reply_r_num;
DROP SEQUENCE SEQ_shelter_s_num;

select*from board


/* Create Sequences */

CREATE SEQUENCE SEQ_adopt_ad_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_board_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_cart_c_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_heart_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_help_h_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_order_detail_od_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_order_o_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_pet_p_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_product_pd_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qna_qa_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reply_r_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_shelter_s_num INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE admin
(
	id varchar2(20) NOT NULL,
	pwd varchar2(50) NOT NULL,
	phone varchar2(15) NOT NULL,
	name varchar2(10) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE board
(
	b_num number(5) NOT NULL,
	id varchar2(20) NOT NULL,
	title varchar2(90) NOT NULL,
	b_content varchar2(500) NOT NULL,
	b_indate date DEFAULT sysdate,
	b_image varchar2(50),
	-- 조회수
	b_count number(4),
	PRIMARY KEY (b_num)
);

ALTER TABLE board MODIFY b_count number(4) DEFAULT 0;

CREATE TABLE heart
(
	num number(3) NOT NULL,
	id varchar2(20) NOT NULL,
	p_num number(5) NOT NULL,
	-- 관심있는애인지 
	-- y
	-- 
	-- 입양할 예정인지
	-- n
	tmp char(1),
	-- 입양하기 위해 보호소로 보내지는 말
	-- 
	reason varchar2(500),
	-- 입양 신청에 선택한 상담 날짜 
	consulting timestamp,
	PRIMARY KEY (num)
);


CREATE TABLE help
(
	h_num number(5) NOT NULL,
	address1 char(1) NOT NULL,
	h_name varchar2(20) NOT NULL,
	h_content varchar2(500) NOT NULL,
	h_phone varchar2(15) NOT NULL,
	writedate timestamp DEFAULT sysdate,
	-- n / y
	-- 조치 전 / 조치 완료
	result char(1) DEFAULT 'n',
	PRIMARY KEY (h_num)
);


CREATE TABLE member
(
	id varchar2(20) NOT NULL,
	pwd varchar2(50) NOT NULL,
	name varchar2(30) NOT NULL,
	email varchar2(30),
	address1 varchar2(100) NOT NULL,
	address2 varchar2(100),
	address3 varchar2(50),
	PRIMARY KEY (id)
);

insert into member(id,pwd,name,email,address1,address2,address3)
values('hong','1234','홍길동','hong@naver.com','서울시','신촌로','이젠빌딩');
insert into member(id,pwd,name,email,address1,address2,address3)
values('one','1234','원이','one@naver.com','경기도','일산','일산동');
insert into member(id,pwd,name,email,address1,address2,address3)
values('two','1234','둘이','two@naver.com','서울','은평구','은평빌딩');

delete from board;
insert into board values(seq_board_seq.nextVal, 'one', '문의드려요','오늘 입양받았는데 아이가 너무 쾌할하고 굳굳', sysdate, 'help.png', 0);

select*from member;
select*from board;

insert into shelter values(111, '0', '수도권', '1번보호소', '1번번호','이미지');
insert into SHELTER values(SEQ_shelter_s_num.nextVal,0,'중랑구 용마산로 139','서울 유기동물 입양센터','02-6958-6224','seoul.jpg');
insert into SHELTER values(SEQ_shelter_s_num.nextVal,1,'원주시 호저면 칠봉로','원주 유기동물 보호관리센터','033-731-1119','wonju.jpg');
insert into SHELTER values(SEQ_shelter_s_num.nextVal, 2, '청원군 강내면 태성리', '청주 반려동물 보호센터', '043-201-2298', 'chugju.jpg');
insert into SHELTER values(SEQ_shelter_s_num.nextVal, 3, '논산시 계백로 665', '동물보호센터 더함', '041-746-8475', 'nonsan.jpg');
insert into SHELTER values(SEQ_shelter_s_num.nextVal, 4, '달성군 다사읍 서재로', '아이조아', '010-3884-8891', 'aijoa.jpg');
insert into shelter values( SEQ_shelter_s_num.nextVal,7 ,'무안군 삼향읍 석매길', '목포시유기동물보호소', '061-659-4429 ','s1.jpg');
insert into shelter values( SEQ_shelter_s_num.nextVal,6 ,'익산시 함열읍', '꽁꽁이네', '063-679-1247 ','s2.jpg');
insert into shelter values( SEQ_shelter_s_num.nextVal, 5,'창원시 의창구 창이대로 ','창원 유기동물 보호센터' , '055-225-5701 ','s3.jpg');


insert into pet values(SEQ_pet_p_num.nextVal, 111, '1', '코리안숏헤어', '코숏', 'F', 1, 'n', '8','n','contents'  );
insert into pet values(SEQ_pet_p_num.nextVal, 111, '1', '뱅갈', '뱅뱅', 'F', 1, 'f', '20','n','contents'  );
insert into pet values(SEQ_pet_p_num.nextVal, 111, '1', '코리안숏헤어', '숏코', 'M', 1, 'n', '9','n','contents'  );

update heart set tmp = 'n' where num = 3;
update pet set ntr='n' where ntr='N'

update pet set age = '8개월';
update shelter set s_image = 'nonsan.jpg' where s_num=12;
update shelter set s_image = 'aijoa.jpg' where s_num=13;
update shelter set s_image = 's1.jpg' where s_num=14;
update shelter set s_image = 's2.jpg' where s_num=15;
update shelter set s_image = 's3.jpg' where s_num=16;
update shelter set s_image = 'wonju.jpg' where s_num=18;

select* from ADMIN;

insert into admin values('admin','123','전화번호','이름');
 

update pet set state = 'a' where p_num = 21;

insert into board values( SEQ_board_b_num.nextVal, 'one', '문의드려요','오늘 입양받았는데 아이가 너무 쾌할하고 굳굳', sysdate, 'b1.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '후기요오오!','오늘 이친구가 저의 가족이 되었습니다~!', sysdate, 'bc1.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '후기요오오!','앞으로 제가 책임지고 키울게요~', sysdate, 'b2.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '후기남깁니다아아!','아이가 아픈거같은데 좋은병원 추천받아요', sysdate, 'bc2.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '너무이쁜댕댕이 자랑!','식탐이 어마마마해여  간식 추천받아요', sysdate, 'b3.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '후기남깁니다아아!','냥냥ㄴ얀얀얀ㅇ냥냥냔얀얀얀ㅇ', sysdate, 'bc3.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '멍ㅁ엄엄엄엄!','냥냥ㄴ얀얀얀ㅇ냥냥냔얀얀얀ㅇ', sysdate, 'b4.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '오늘 부터 내가 집사 !','받들어 모실게요오오', sysdate, 'bc4.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '하루종일 잠만자요 !','저희집이 편해서 잠만자겟죠??', sysdate, 'b5.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '냥냥 젤리 후기 !',' 저희집 높은곳은 다올라가네요', sysdate, 'bc5.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '저희집 먹보에요 !',' 곳간 다털리겠어요', sysdate, 'b6.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '츤데레를 소개합니다 !',' 오고싶을떄만오고 먼저가면 안오네요 ㅠㅠ', sysdate, 'bc6.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '가족들이 너무좋다고 하네요',' 강아지 싫어하는 엄빠도 빠졋네요', sysdate, 'b7.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '냥식구가 늘었ㅇ요 !',' 기존에 지내는 냥냥이들과 잘지내요ㅠ', sysdate, 'bc7.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '댕대앧애대애댕',' 고양이하고도 잘지내', sysdate, 'b8.jpg', 0);
insert into board values( SEQ_board_b_num.nextVal, 'one', '이쁘니를 소개해요 !',' 오고나서 늘 털정리하느라 ㅏ쁘게 ㅣ내서 기분좋네요', sysdate, 'bc8.jpg', 0);




/* pet 추가 */
강아지
insert into pet values(SEQ_pet_p_num.nextVal,13,'2','말라뮤트','말라','F','2개월','Y','5.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,13,'2','말티즈','말티','F','3개월','Y','6.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'2','진도','멍이','F','4개월','Y','12.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'2','비숑','숑숑','F','5개월','Y','13.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'2','포메라니안','포메','F','13개월','Y','14.jpg','a','content1.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,15,'2','시베리안허스키','리안','F','12개월','Y','15.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,16,'2','토이푸들','푸푸','F','12개월','Y','16.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,16,'2','골든리트리버','인절미','F','22개월','Y','29.jpg','a','content3.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,14,'2','사모예드','우유','F','22개월','Y','30.jpg','a','content5.png');


고양이
insert into pet values(SEQ_pet_p_num.nextVal,14,'1','코리아숏헤어','삼색이','F','12개월','Y','8.jpg','a','content7.png');
insert into pet values(SEQ_pet_p_num.nextVal,14,'1','코리아숏헤어','고등어','F','6개월','Y','9.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'1','믹스','네로','F','7개월','Y','19.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'1','러시안블루','블루','F','7개월','Y','11.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'1','아메리칸숏헤어','아메','F','9개월','Y','10.jpg','a','content6.png');
insert into pet values(SEQ_pet_p_num.nextVal,15,'1','믹스','치즈','F','10개월','Y','17.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,15,'1','뱅갈','뱅뱅','F','10개월','Y','20.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,16,'1','샴','샤미','F','20개월','Y','28.jpg','a','content3.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,17,'1','렉돌','돌돌이','F','18개월','Y','31.jpg','a','content6.png');



그외
insert into pet values(SEQ_pet_p_num.nextVal,11,'0','햄스터','햄찌','F','11개월','Y','21.jpg','a','content7.png');
insert into pet values(SEQ_pet_p_num.nextVal,11,'0','토끼','토순','F','17개월','Y','22.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,12,'0','앵무새','무무','F','5개월','Y','23.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,12,'0','이구아나','이구','F','6개월','Y','24.jpg','a','content2.jpg');
insert into pet values(SEQ_pet_p_num.nextVal,13,'0','라쿤','쿤돌','F','9개월','Y','25.jpg','a','content6.png');
insert into pet values(SEQ_pet_p_num.nextVal,13,'0','고슴도치','도치','F','2개월','Y','32.jpg','a','content8.png');
insert into pet values(SEQ_pet_p_num.nextVal,13,'0','미어캣','미캣','F','9개월','Y','26.jpg','a','content8.png');