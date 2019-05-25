package com.zl.service;

import java.util.List;
import java.util.Map;

import com.zl.dao.UserDao;
import com.zl.entity.User;

public class UserService {
	UserDao userDao=new UserDao();

	public boolean login(User auser) {
		boolean flag=false;
		List<Map<String, Object>> list=userDao.findByUsernamePwd(auser);
		if(list!=null&&!list.isEmpty()){
			flag=true;
		}
		return flag;
		
		
	}

	public List<Map<String, Object>> userList(String role,int index,int pageSize,String key) {
		return userDao.findAllUser(role,index,pageSize,key);
	}

	public void addUser(User auser) {
		userDao.insertUser(auser);
		
	}

	public List<Map<String, Object>> findById(String id,String role) {
		// TODO Auto-generated method stub
		return userDao.findById(id,role);
	}

	public void editUser(User auser) {
		userDao.updateUser(auser);
		
	}

	

	public void delById(String id, String role) {
		userDao.delById(id,role);
		
	}

	public List<Map<String, Object>> findCount(String role,String key) {
		return userDao.findCount(role,key);
	}

	public boolean yanzheng(String username,String role) {
		boolean flag=false;
		UserDao userDao=new UserDao();
		User userc=userDao.findByUsername(username,role);
		if(userc!=null){
			flag=true;
		}
		return flag;
		
	}

	public void deleteMore(String role,String ids[]){
		userDao.delete(role,ids);
	}
	
}
