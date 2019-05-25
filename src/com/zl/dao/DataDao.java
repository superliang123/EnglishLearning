package com.zl.dao;

import java.util.List;
import java.util.Map;

import com.zl.entity.Data;
import com.zl.util.JDBCUtils;

public class DataDao {

	public List<Map<String, Object>> findAll(int index,int pageSize,String key) {
		String sql="select * from data where title like ? limit ?,?";
		Object params[]={
				key,index,pageSize
		};
		return JDBCUtils.query(sql,params);
	}


	public void insert(Data data) {
		String sql="insert into data(title,author,path,time) values(?,?,?,?)";
		Object params[]={
			data.getTitle(),data.getAuthor(),data.getPath(),new java.sql.Date(data.getTime().getTime())
		};
		JDBCUtils.update(sql, params);
		
	}


	public void delById(String id) {
		String sql="delete from data where id=?";
		JDBCUtils.update(sql,id);
		
	}


	public List<Map<String, Object>> findCount(String key) {
		String sql="select count(id) from data where title like ?";
		return JDBCUtils.query(sql,key);
		
	}


	public void delete(String[] ids){
		/*
		 * 1.拼出删除的sql语句DELETE FROM tb_news WHERE id IN(?,?,?)
		 * 2.生成对应的参数数组
		 * 3.调用JDBCUtils删除
		 */
		StringBuilder sql = new StringBuilder("DELETE FROM data WHERE id IN(");
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
