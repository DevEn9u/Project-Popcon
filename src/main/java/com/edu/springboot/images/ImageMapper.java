package com.edu.springboot.images;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ImageMapper {
    void insertImage(ImageDTO imageDTO);
    List<ImageDTO> selectImagesByAssociatedIdAndType(@Param("associated_id") String associatedId, @Param("image_type") String imageType);
    void deleteImagesByAssociatedIdAndType(@Param("associated_id") String associatedId, @Param("image_type") String imageType);
    void deleteImageById(String imageIdx);
    ImageDTO selectImageById(String imageIdx);
}
