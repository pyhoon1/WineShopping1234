package admin.upload;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.apache.bcel.classfile.Field;
import org.springframework.web.multipart.MultipartFile;

public class AdminUpload {

	public String Upload(HttpServletRequest hsr ,HashMap<String, String> prm,MultipartFile file, String type) {	
		String path = hsr.getSession().getServletContext().getRealPath("/");
		
		String originalFilename = file.getOriginalFilename();
		
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf("."));
		
		String extension = originalFilename.substring(originalFilename.indexOf("."));
		
		long time = System.currentTimeMillis();
		
		String winepath = "/resources/img/wineImg/";
		
		String wineimgpath = "resources/img/wineImg/";
		
		String matchfoodpath = "/resources/img/matchFoodImg/";
		
		String matchfoodimgpath = "resources/img/matchFoodImg/";
		
		if(type.equals("wine")) {	
			File paths = new File(path+winepath);	
			
			if(!paths.exists()) {
			   paths.mkdirs();
			}
			
			String rname = onlyFileName + "_" + time + extension;
			String fullPath = path + winepath + rname;
			
			if (!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
					stream.write(bytes);
					stream.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			return wineimgpath + rname;
		}else{
			File paths = new File(path+matchfoodpath);
			if(!paths.exists()) {
				paths.mkdirs();
			}
			
			String rname = onlyFileName + "_" + time + extension;
			String fullPath = path + matchfoodpath + rname;
			
			if (!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
					stream.write(bytes);
					stream.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			
			return matchfoodimgpath + rname;
					
		}
		
	}
	
	public void Delete(HttpServletRequest hsr , int Id , String path) {
		String paths = hsr.getSession().getServletContext().getRealPath("/");
	
		File file = new File(paths + path);
		System.out.println(file.exists());
		if (file.exists()) {
			if (file.delete()) {
				System.out.println("파일 삭제 성공");
			} else {
				System.out.println("파일 삭제 실패");
			}

		}
		
	}
	
	public String Update(HttpServletRequest hsr , MultipartFile file , HashMap<String, String> prm , String type) {
		if(type.equals("wine")) {
			String winepath = "/resources/img/wineImg/";
			
			String wineimgpath = "resources/img/wineImg";
			
			String path = hsr.getSession().getServletContext().getRealPath("/");
			
			String originalFilename = file.getOriginalFilename();
			
			String onlyFileName = originalFilename.substring(0, originalFilename.indexOf("."));
			
			String extension = originalFilename.substring(originalFilename.indexOf("."));

			long time = System.currentTimeMillis();
			
			String rname = onlyFileName + "_" + time + extension;
			
			String fullPath = path + winepath + rname;
			
			File file1 = new File(path + prm.get("originalImg"));
			
			if (file1.exists()) {
				if (file1.delete()) {
					System.out.println("파일 삭제 성공");
				} else {
					System.out.println("파일 삭제 실패");
				}

			}
			
			if (!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
					stream.write(bytes);
					stream.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			return wineimgpath + rname;
		}else {
				String matchpath = "/resources/img/matchFoodImg/";
				
				String matchimgpath = "resources/img/matchFoodImg/";
				
				String path = hsr.getSession().getServletContext().getRealPath("/");
				
				String originalFilename = file.getOriginalFilename();
				
				String onlyFileName = originalFilename.substring(0, originalFilename.indexOf("."));
				
				String extension = originalFilename.substring(originalFilename.indexOf("."));

				long time = System.currentTimeMillis();
				
				String rname = onlyFileName + "_" + time + extension;
				
				String fullPath = path + matchpath + rname;
				
				File file1 = new File(path + prm.get("originalImg"));
				
				if (file1.exists()) {
					if (file1.delete()) {
						System.out.println("파일 삭제 성공");
					} else {
						System.out.println("파일 삭제 실패");
					}

				}	
				if (!file.isEmpty()) {
					try {
						byte[] bytes = file.getBytes();
						BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
						stream.write(bytes);
						stream.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				return matchimgpath + rname;	
		}
	}
	
	
	
}
