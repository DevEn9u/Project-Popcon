package com.edu.springboot.images;

import java.util.List;
import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ImageService {
	
	@Value("${file.upload-dir}")
    private String uploadDir; // 이미지 업로드 디렉토리 경로
    
    @Autowired
    private ImageMapper imageMapper;
    
    @Autowired
    public ImageService(ImageMapper imageMapper) {
        this.imageMapper = imageMapper;
    }
    
    public void saveImage(ImageDTO imageDTO) {
        imageMapper.insertImage(imageDTO);
    }
    
    public List<ImageDTO> getImages(String associatedId, String imageType) {
        return imageMapper.selectImagesByAssociatedIdAndType(associatedId, imageType);
    }
    
    // 이미지 삭제 시 파일 시스템에서도 삭제
    public void deleteImages(String associatedId, String imageType) {
        List<ImageDTO> images = imageMapper.selectImagesByAssociatedIdAndType(associatedId, imageType);
        for (ImageDTO image : images) {
            String filePath = uploadDir + "/" + image.getImage_url().replace("/uploads/images/", "");
            File file = new File(filePath);
            if (file.exists()) {
                boolean deleted = file.delete();
                if (deleted) {
                    System.out.println("파일 삭제 성공: " + filePath);
                } else {
                    System.err.println("파일 삭제 실패: " + filePath);
                }
            }
        }
        imageMapper.deleteImagesByAssociatedIdAndType(associatedId, imageType);
    }
    
    public void deleteImage(String imageIdx) {
        ImageDTO image = imageMapper.selectImageById(imageIdx);
        if (image != null) {
            String filePath = uploadDir + "/" + image.getImage_url().replace("/uploads/images/", "");
            File file = new File(filePath);
            if (file.exists()) {
                boolean deleted = file.delete();
                if (deleted) {
                    System.out.println("파일 삭제 성공: " + filePath);
                } else {
                    System.err.println("파일 삭제 실패: " + filePath);
                }
            }
            imageMapper.deleteImageById(imageIdx);
        }
    }

    public ImageDTO getImageById(String imageIdx) {
        return imageMapper.selectImageById(imageIdx);
    }
    


}
