package com.zl.service;

import java.util.List;
import java.util.Map;

import com.zl.dao.AudioDao;
import com.zl.entity.Audio;
import com.zl.entity.Data;

public class AudioService {
	AudioDao audioDao=new AudioDao();

	public void add(Audio audio) {
		audioDao.insert(audio);
	}

	public List<Map<String, Object>> findAll(int index,int pageSize,String key) {
		return audioDao.findAll(index,pageSize,key);
	}

	public void delById(String id) {
		audioDao.delById(id);
		
	}

	public List<Map<String, Object>> findById(String id) {
		return audioDao.findById(id);
	}
	
	public List<Map<String, Object>> findCount(String key) {
		return audioDao.findCount(key);
	}

	public void deleteMore(String ids[]){
		audioDao.delete(ids);
	}

}
