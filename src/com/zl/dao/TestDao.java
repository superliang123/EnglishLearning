package com.zl.dao;

import java.util.List;
import java.util.Map;

import com.zl.entity.Test;
import com.zl.util.JDBCUtils;

public class TestDao {

	public void insert(Test test) {
		String sql="insert into test(title,author,path,time) values(?,?,?,?)";
		Object params[]={
				test.getTitle(),test.getAuthor(),test.getPath(),new java.sql.Date(test.getTime().getTime())
		};
		JDBCUtils.update(sql, params);
	}

	public List<Map<String, Object>> findAll(int index,int pageSize,String key) {
		String sql="select * from test where title like ? limit ?,?";
		Object params[]={key,index,pageSize};
		return JDBCUtils.query(sql,params);
	}

	public void delById(String id) {
		String sql="delete from test where id=?";
		JDBCUtils.update(sql,id);
		
	}
	public List<Map<String, Object>> findCount(String key) {
		String sql="select count(id) from test where title like ?";
		return JDBCUtils.query(sql,key);
		
	}

	public void delete(String[] ids){
		/*
		 * 1.拼出删除的sql语句DELETE FROM tb_news WHERE id IN(?,?,?)
		 * 2.生成对应的参数数组
		 * 3.调用JDBCUtils删除
		 */
		StringBuilder sql = new StringBuilder("DELETE FROM test WHERE id IN(");
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
