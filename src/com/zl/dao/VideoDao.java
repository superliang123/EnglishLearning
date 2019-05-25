package com.zl.dao;

import java.util.List;
import java.util.Map;

import com.zl.entity.Video;
import com.zl.util.JDBCUtils;

public class VideoDao {

	public void insert(Video video) {
		String sql="insert into video(title,author,path,time) values(?,?,?,?)";
		Object params[]={
				video.getTitle(),video.getAuthor(),video.getPath(),new java.sql.Date(video.getTime().getTime())
		};
		JDBCUtils.update(sql, params);
	}

	public List<Map<String, Object>> findAll(int index,int pageSize,String key) {
		String sql="select * from video where title like ? limit ?,?";
		Object params[]={
				key,index,pageSize
		};
		return JDBCUtils.query(sql,params);
	}

	public void delById(String id) {
		String sql="delete from video where id=?";
		JDBCUtils.update(sql,id);
		
	}

	public List<Map<String, Object>> findById(String id) {
		String sql="select * from video where id=?";
		return JDBCUtils.query(sql,Integer.parseInt(id));
	}
	
	public List<Map<String, Object>> findCount(String key) {
		String sql="select count(id) from video where title like ?";
		return JDBCUtils.query(sql,key);
		
	}
	
	public void delete(String[] ids){
		/*
		 * 1.拼出删除的sql语句DELETE FROM tb_news WHERE id IN(?,?,?)
		 * 2.生成对应的参数数组
		 * 3.调用JDBCUtils删除
		 */
		StringBuilder sql = new StringBuilder("DELETE FROM video WHERE id IN(");
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
