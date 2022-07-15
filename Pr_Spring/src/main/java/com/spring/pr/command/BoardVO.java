package com.spring.pr.command;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	
	/*CREATE TABLE PRBOARD(
    b_num NUMBER(10) PRIMARY KEY, 
    b_writer VARCHAR2(30) NOT NULL,
    b_title VARCHAR2(50) NOT NULL, 
    b_content VARCHAR2(1000), 
    b_date DATE default sysdate
);

CREATE SEQUENCE b_num_seq
    START WITH 1
    INCREMENT BY 1 
    MAXVALUE 1000
    NOCYCLE 
    NOCACHE;
*/
private int bNum;
private String bWriter;
private String bTitle;
private String bContent;
private Timestamp bDate;


}
