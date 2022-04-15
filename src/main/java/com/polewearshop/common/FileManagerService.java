package com.polewearshop.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {
	
	//public final static String FILE_UPLOAD_PATH = "C:\\JiaLEE\\7. shoppingMall\\imagePath/";
	public final static String FILE_UPLOAD_PATH = "/home/ec2-user/upload_images/";
	
	public String savefile(String loginId, MultipartFile file) {
		
		String directoryName = loginId + "_" + System.currentTimeMillis() + "/"; //uiop9900_4257864557/
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		
		 if (directory.mkdir() == false) { 
			 return null; 
		 }
		
		 try {
			byte[] bytes = file.getBytes();  
			Path path = Paths.get(filePath + file.getOriginalFilename()); 
			Files.write(path, bytes);
			
			return "/imagePath/" + directoryName + file.getOriginalFilename(); 
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void deleteFile(String imagePath) throws IOException{
		Path path = Paths.get(FILE_UPLOAD_PATH + imagePath.replace("/upload_images/", ""));
		
		//사진 삭제
		if (Files.exists(path)) {
			Files.delete(path);
		}

		//폴더 삭제
		path = path.getParent();
		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
