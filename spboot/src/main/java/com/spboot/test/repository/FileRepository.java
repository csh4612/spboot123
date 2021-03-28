package com.spboot.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spboot.test.entity.FileInfo;

public interface FileRepository extends JpaRepository<FileInfo, Long> {
	
	public List<FileInfo> findAllByOrderByFiiNumAsc();
	public List<FileInfo> findAllByFiiTitleOrderByFiiNumAsc(String fiiTitle);
	public List<FileInfo> findAllByFiiContentLikeOrderByFiiNumAsc(String fiiContent);
	public List<FileInfo> findAllByFiiTitleAndFiiContentLikeOrderByFiiNumAsc(String fiiTititle,String fiiContent);
	
}
