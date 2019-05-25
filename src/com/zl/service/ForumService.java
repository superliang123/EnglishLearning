package com.zl.service;

import java.util.List;
import java.util.Map;

import com.zl.dao.ForumDao;
import com.zl.entity.Forum;
import com.zl.entity.Reply;

public class ForumService {
	ForumDao forumDao = new ForumDao();
	
	//删除多条记录
	public void deleteMore(String ids[]){
		forumDao.delete(ids);
	}

	public List<Map<String, Object>> findAll(int index,int pageSize,String key) {
		return forumDao.findAll(index,pageSize,key);
	}

	public void add(Forum forum) {
		forumDao.insert(forum);
		
	}

	public List<Map<String, Object>> findById(String id) {
		return forumDao.findById(id);
	}

	public List<Map<String, Object>> findAllReply(String id,int index,int pageSize) {
		return forumDao.findAllReply(id,index,pageSize);
	}

	public void replyAdd(Reply areply) {
		forumDao.replyInsert(areply);
		
	}

	public void delById(String id) {
		forumDao.delById(id);
		
	}

	public void edit(Forum forum) {
		forumDao.edit(forum);
	}

	public List<Map<String, Object>> findCount(String key) {
		return forumDao.findCount(key);
	}
	
	public List<Map<String, Object>> findCountReply(String id) {
		// TODO Auto-generated method stub
		return forumDao.findCountReply(id);
	}

}
