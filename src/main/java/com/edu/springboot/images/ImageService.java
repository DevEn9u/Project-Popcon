package com.edu.springboot.images;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageService {
    
    @Autowired
    private ImageMapper imageMapper;
    
    public void saveImage(ImageDTO imageDTO) {
        imageMapper.insertImage(imageDTO);
    }
    
    public List<ImageDTO> getImages(String associatedId, String imageType) {
        return imageMapper.selectImagesByAssociatedIdAndType(associatedId, imageType);
    }
    
    public void deleteImages(String associatedId, String imageType) {
        imageMapper.deleteImagesByAssociatedIdAndType(associatedId, imageType);
    }
    
    public void deleteImage(String imageIdx) {
        imageMapper.deleteImageById(imageIdx);
    }

    public ImageDTO getImageById(String imageIdx) {
        return imageMapper.selectImageById(imageIdx);
    }
}
