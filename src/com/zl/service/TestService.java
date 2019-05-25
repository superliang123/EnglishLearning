package com.zl.service;

import java.util.List;
import java.util.Map;

import com.zl.dao.TestDao;
import com.zl.entity.Test;


public class TestService {
	TestDao testDao=new TestDao();

	public void add(Test test) {
		testDao.insert(test);
	}

	public List<Map<String, Object>> findAll(int index,int pageSize,String key) {
		return testDao.findAll(index,pageSize,key);
	}

	public void delById(String id) {
		testDao.delById(id);
		
	}
	public List<Map<String, Object>> findCount(String key) {
		// TODO Auto-generated method stub
		return testDao.findCount(key);
	}

	public void deleteMore(String ids[]){
		testDao.delete(ids);
	}

}
