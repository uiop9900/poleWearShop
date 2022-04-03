package com.polewearshop.notice.bo;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.polewearshop.common.FileManagerService;
import com.polewearshop.notice.dao.NoticeDAO;
import com.polewearshop.notice.model.Notice;

@Service
public class NoticeBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManagerService fileManager;
	
	public void addNotice(String loginId, String subject, String content, MultipartFile file) {
		String noticeImage = null;
		
		if (file != null) {
			noticeImage = fileManager.savefile(loginId, file);
		}
		noticeDAO.insertNotice(subject, content, noticeImage);
	}
	
	public List<Notice> getNoticeList() {
		return noticeDAO.selectNoticeList();
	}
	
	public Notice getNoticeById(int id) {
		return noticeDAO.selectNoticeById(id);
	}
	
	public void updateNoticeById(int id, String loginId, String subject, String content, MultipartFile file) {
		Notice notice = getNoticeById(id);
		String noticeImage = notice.getNoticeImage();
		//기존파일이 없음 -> 그냥 새로운 파일 저장
		// 기존파일 없음 -> 새로운 파일도 없음 그냥 null
		// 기존파일 있음 새 파일 없음
		
		if (noticeImage == null) {
			if (file == null) {
				noticeImage = null;
			} else if (file != null) {
				noticeImage = fileManager.savefile(loginId, file);
			}
		} 
		
		if (noticeImage != null) {
			if (file == null) {
				try {
					fileManager.deleteFile(noticeImage);
				} catch (IOException e) {
					logger.error("[delete notice Image] 삭제할 기존의 notice image가 존재하지 않습니다. noticeId:" + id);
				}
				noticeImage = null;
			} else if (file != null) {
				try {
					fileManager.deleteFile(noticeImage);
				} catch (IOException e) {
					logger.error("[delete notice Image] 삭제할 기존의 notice image가 존재하지 않습니다. noticeId:" + id);
				}
				noticeImage = fileManager.savefile(loginId, file);
			}
		}
		
		noticeDAO.updateNoticeById(id, subject, content, noticeImage);
	}
}
