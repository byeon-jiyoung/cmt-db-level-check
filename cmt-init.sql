USE cmt;

-- 회원
CREATE TABLE member (
	member_id	VARCHAR(20) NOT NULL, -- 회원아이디
	password 	VARCHAR(20) NULL, -- 비밀번호
	name			VARCHAR(12) NULL, -- 회원명
	join_date	DATETIME    NULL, -- 가입일
	PRIMARY KEY(member_id)
);

-- 작가
CREATE TABLE author (
	author_id				VARCHAR(20)  NOT NULL, -- 작가아이디
	proattachment_image	INT          NULL, -- 프로필사진
	name						VARCHAR(30)  NULL, -- 작가명
	job						VARCHAR(30)  NULL, -- 직업
	introduce				VARCHAR(100) NULL, -- 소개글
	PRIMARY KEY(author_id)
);

-- 첨부파일
CREATE TABLE attachment (
	attachment_id   	INT      	  NOT NULL, -- 첨부파일번호
	name      			VARCHAR(100) NULL, -- 첨부파일명
	attachment_date 	DATETIME     NULL, -- 등록일
	PRIMARY KEY(attachment_id)
);

-- 게시글
CREATE TABLE post (
	post_id       INT          NOT NULL, -- 게시글번호
	attachment_id INT          NULL, -- 대표이미지
	author_id     VARCHAR(20)  NULL, -- 작성자
	category_id   INT          NULL, -- 카테고리번호
	title         VARCHAR(100) NULL, -- 제목
	sub_title     VARCHAR(100) NULL, -- 소제목
	content       TEXT         NULL, -- 내용
	register_date DATETIME     NULL, -- 작성일
	PRIMARY KEY(post_id)
);

-- 카테고리
CREATE TABLE category (
	category_id INT          NOT NULL, -- 카테고리번호
	title       VARCHAR(30)  NULL, -- 제목
	content     VARCHAR(200) NULL, -- 내용
	PRIMARY KEY(category_id)
);

-- 댓글
CREATE TABLE reply (
	reply_id     	INT           NOT NULL, -- 댓글번호
	member_id    	VARCHAR(20)   NULL, -- 작성자
	post_id      	INT           NULL, -- 게시글번호
	register_date	DATETIME      NULL, -- 작성일
	content        VARCHAR(1000) NULL, -- 내용
	PRIMARY KEY(reply_id)
);

-- 구독
CREATE TABLE subscribe (
	author_id     VARCHAR(20) NOT NULL, -- 작가아이디
	member_id     VARCHAR(20) NOT NULL, -- 구독자
	register_date DATETIME    NULL, -- 구독일
	PRIMARY KEY(author_id,member_id)
);

-- 좋아요
CREATE TABLE empathy (
	member_id     VARCHAR(20) NOT NULL, -- 회원아이디
	post_id       INT         NOT NULL, -- 게시글번호
	register_date DATETIME    NULL, -- 등록일
	PRIMARY KEY(member_id,post_id)
);

-- 공유
CREATE TABLE share (
	share_id      INT         NOT NULL, -- 공유번호
	member_id     VARCHAR(20) NULL, -- 회원아이디
	post_id       INT         NULL, -- 게시글번호
	root          VARCHAR(50) NULL, -- 공유경로
	register_date DATETIME    NULL, -- 공유일
	PRIMARY KEY(share_id)
);

-- 태그
CREATE TABLE tag (
	tag_id INT         NOT NULL, -- 태그번호
	name   VARCHAR(30) NULL, -- 태그명
	PRIMARY KEY(tag_id)
);

-- 게시글_태그
CREATE TABLE post_tag (
	post_id INT NOT NULL, -- 게시글번호
	tag_id  INT NOT NULL, -- 태그번호
	PRIMARY KEY (post_id,tag_id)
);


-- 작가 외래키
ALTER TABLE author ADD CONSTRAINT FK_member_TO_author -- 회원 -> 작가
		FOREIGN KEY (author_id) REFERENCES member (member_id);

ALTER TABLE author ADD CONSTRAINT FK_attachment_TO_author -- 첨부파일 -> 작가
		FOREIGN KEY (proattachment_image) REFERENCES attachment (attachment_id);

-- 게시글 외래키
ALTER TABLE post ADD CONSTRAINT FK_attachment_TO_post -- 첨부파일 -> 게시글
		FOREIGN KEY (attachment_id) REFERENCES attachment (attachment_id);

ALTER TABLE post ADD CONSTRAINT FK_author_TO_post -- 작가 -> 게시글
		FOREIGN KEY (author_id) REFERENCES author (author_id);
		
ALTER TABLE post ADD CONSTRAINT FK_category_TO_post -- 카테고리 -> 게시글
		FOREIGN KEY (category_id) REFERENCES category (category_id);

-- 댓글 외래키
ALTER TABLE reply ADD CONSTRAINT FK_member_TO_reply -- 회원 -> 댓글
		FOREIGN KEY (member_id) REFERENCES member (member_id);

ALTER TABLE reply ADD CONSTRAINT FK_post_TO_reply -- 게시글 -> 댓글
		FOREIGN KEY (post_id) REFERENCES post (post_id);

-- 구독 외래키
ALTER TABLE subscribe ADD CONSTRAINT FK_author_TO_subscribe -- 작가 -> 구독
		FOREIGN KEY (author_id) REFERENCES author (author_id);

ALTER TABLE subscribe ADD CONSTRAINT FK_member_TO_subscribe -- 회원  -> 구독
		FOREIGN KEY (member_id) REFERENCES member (member_id);

-- 좋아요 외래키
ALTER TABLE empathy ADD CONSTRAINT FK_member_TO_empathy -- 회원 -> 좋아요
		FOREIGN KEY (member_id) REFERENCES member (member_id);

ALTER TABLE empathy ADD CONSTRAINT FK_post_TO_empathy -- 게시글 -> 좋아요
		FOREIGN KEY (post_id) REFERENCES post (post_id);
		
-- 공유 외래키
ALTER TABLE share ADD CONSTRAINT FK_member_TO_share -- 회원 -> 공유
		FOREIGN KEY (member_id) REFERENCES member (member_id);

ALTER TABLE share ADD CONSTRAINT FK_post_TO_share -- 게시글 -> 공유
		FOREIGN KEY (post_id) REFERENCES post (post_id);

-- 게시글_태그 외래키
ALTER TABLE post_tag ADD CONSTRAINT FK_post_TO_post_tag -- 게시글 -> 게시글_태그
		FOREIGN KEY (post_id) REFERENCES post (post_id);
		
ALTER TABLE post_tag ADD CONSTRAINT FK_tag_TO_post_tag -- 태그 -> 게시글_태그
		FOREIGN KEY (tag_id) REFERENCES tag (tag_id);