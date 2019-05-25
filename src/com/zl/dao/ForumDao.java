package com.zl.dao;

import java.util.List;
import java.util.Map;

import com.zl.entity.Forum;
import com.zl.entity.Reply;
import com.zl.util.JDBCUtils;

public class ForumDao {

	public void insert(Forum forum) {
		String sql="insert into forum(title,author,content,time,type) values(?,?,?,?,?)";
		Object params[]={
				forum.getTitle(),forum.getAuthor(),forum.getContent(),new java.sql.Date(forum.getTime().getTime()),forum.getType()
		};
		JDBCUtils.update(sql, params);
	}

	public List<Map<String, Object>> findAll(int index,int pageSize,String key) {
		String sql="select * from forum where title like ? order by time desc limit ?,?";
		Object params[]={
				key,index,pageSize
		};
		return JDBCUtils.query(sql,params);
	}

	public List<Map<String, Object>> findById(String id) {
		String sql="select * from forum where id=?";
		return JDBCUtils.query(sql,Integer.parseInt(id));
		
	}

	public List<Map<String, Object>> findAllReply(String id,int index,int pageSize) {
		String sql="select * from forum_reply f where forumid=?  order by f.time desc limit ?,?";
		Object params[]={
				Integer.parseInt(id),index,pageSize
		};
		return JDBCUtils.query(sql,params);
	}

	public void replyInsert(Reply areply) {

		String sql="insert into forum_reply(forumid,author,content,time,lou) values(?,?,?,?,?)";
		Object params[] ={
				areply.getForumid(),areply.getAuthor(),areply.getContent(),new java.sql.Date(areply.getTime().getTime()),areply.getLou()
		};
		JDBCUtils.update(sql, params);
	}

	public void delById(String id) {
		String sql="delete from forum where id=?";
		JDBCUtils.update(sql, Integer.parseInt(id));
	}

	public void edit(Forum forum) {
		String sql="update forum set title=?,type=?,content=?,time=? where id=?";
		Object params[]={
				forum.getTitle(),forum.getType(),forum.getContent(),new java.sql.Date(forum.getTime().getTime()),forum.getId()
		};
		JDBCUtils.update(sql, params);
		
	}

	public List<Map<String, Object>> findCount(String key) {
		String sql="select count(id) from forum where title like ?";
		return JDBCUtils.query(sql,key);
		
	}
	
	public List<Map<String, Object>> findCountReply(String id) {
		String sql="select count(id) from forum_reply where forumid=?";
		return JDBCUtils.query(sql,id);
		
	}
	public void delete(String[] ids){
		/*
		 * 1.拼出删除的sql语句DELETE FROM tb_news WHERE id IN(?,?,?)
		 * 2.生成对应的参数数组
		 * 3.调用JDBCUtils删除
		 */
		StringBuilder sql = new StringBuilder("DELETE FROM forum WHERE id IN(");
		Integer params[] = new Integer[ids.length];
		for(int i=0;i<ids.length;i++){
			/*
			 * 1.判断是否是最后一个
			 * 2.给参数？设置对应的值
			 */
			if(i==ids.length-1){
				//是最后一个
				sql.append("?)");
			}else{
				sql.append("?,");
			}
			params[i] = new Integer(ids[i]);
		}
		JDBCUtils.update(sql.toString(), params);
	}

}
