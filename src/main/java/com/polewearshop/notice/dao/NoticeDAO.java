package com.polewearshop.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.polewearshop.notice.model.Notice;

@Repository
public interface NoticeDAO {

	public void insertNotice(
			@Param("subject") String subject, 
			@Param("content") String content, 
			@Param("noticeImage") String noticeImage);
	
	public List<Notice> selectNoticeList();
	
	public Notice selectNoticeById(int id);
	
	public void updateNoticeById(
			@Param("id") int id, 
			@Param("subject") String subject, 
			@Param("content") String content, 
			@Param("noticeImage") String noticeImage);
}
