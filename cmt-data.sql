USE cmt;

INSERT INTO member VALUES("byeon","bjy","변지영",NOW());
INSERT INTO member VALUES("byeon2","bsb","변수빈",NOW()),("byeon3","bdk","변도경",NOW());

INSERT INTO attachment VALUES(1,"C:\Users\cmt\Pictures\DB\milk.jpg",NOW()),(2,"C:\Users\cmt\Pictures\DB\milk&mocha.jpg",NOW());

INSERT INTO author VALUES("byeon",1,"몽실이","비밀입니당","안녕하세요. 몽실이에용");

INSERT INTO category VALUES(1,"매거진","몽실이는스피츠"),(2,"매거진","몽실이는8살"),(3,"매거진","몽실이는하얀색");

INSERT INTO post VALUES(1,2,"byeon",1,"몽실이는 강아지입니다","동물을사랑하자","몽실이는 우리집 강아지입니다. 엄청 예쁘죠", NOW());
INSERT INTO post(post_id,author_id,category_id,title,content,register_date) VALUES(2,"byeon",1,"나는 사람입입니다","변지영변지영변지영", NOW());

INSERT INTO tag VALUES(1,"animal"),(2,"love"),(3,"mongsil");

INSERT INTO post_tag VALUES(1,1),(1,2),(1,3),(2,1);

INSERT INTO empathy VALUES("byeon2",1,NOW()),("byeon",1,NOW());

INSERT INTO subscribe VALUES("byeon","byeon2",NOW()),("byeon","byeon3",NOW());

INSERT INTO `share` VALUES(1,"byeon2",1,"instargram",NOW()),(2,"byeon2",1,"facebook",NOW());

SELECT * FROM member;
SELECT * FROM author;
SELECT * FROM post;