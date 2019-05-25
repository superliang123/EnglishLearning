package com.zl.dao;

import java.util.List;
import java.util.Map;

import com.zl.entity.User;
import com.zl.util.JDBCUtils;

public class UserDao {

	public List<Map<String, Object>> findByUsernamePwd(User auser) {
		String role=auser.getRole();
		String sql="";
		if(role.equals("student")){
			sql="select * from student where username=? and password=?";
		}else if(role.equals("teacher")){
			sql="select * from teacher where username=? and password=?";
		}else if(role.equals("admin")){
			sql="select * from admin where username=? and password=?";
		}
		
		Object params[]={
				auser.getUsername(),auser.getPassword()
		};
		
		return JDBCUtils.query(sql, params);
	}

	public List<Map<String, Object>> findAllUser(String role,int index,int pageSize,String key) {
		String sql="";
		if(role.equals("student")){
			sql="select * from student  where username like ? limit ?,?";
		}else if(role.equals("teacher")){
			sql="select * from teacher where username like ? limit ?,?";
		}else if(role.equals("admin")){
			sql="select * from admin where username like ? limit ?,?";
		}
		Object params[]={
				key,index,pageSize
		};
		return JDBCUtils.query(sql,params);
	}

	public void insertUser(User auser) {
		String role=auser.getRole();
		String sql="";
		if(role.equals("student")){
			sql="insert into student(username,password,sex,email,phone,birthday) values(?,?,?,?,?,?)";
		}else if(role.equals("teacher")){
			sql="insert into teacher(username,password,sex,email,phone,birthday) values(?,?,?,?,?,?)";
		}else if(role.equals("admin")){
			sql="insert into admin(username,password,sex,email,phone,birthday) values(?,?,?,?,?,?)";
		}
		
		Object params[]={
				auser.getUsername(),auser.getPassword(),auser.getSex(),auser.getEmail(),auser.getPhone(),new java.sql.Date(auser.getBirthady().getTime())
		};
		
		JDBCUtils.update(sql, params);
	}

	public List<Map<String, Object>> findById(String id,String role) {
		String sql="";
		if(role.equals("student")){
			sql="select * from student where sid=?";
		}else if(role.equals("teacher")){
			sql="select * from teacher where tid=?";
		}
		return JDBCUtils.query(sql,id);
	}

	public void updateUser(User auser) {
		String role=auser.getRole();
		String sql="";
		if(role.equals("student")){
			sql="update student set role=?,username=?,password=?,sex=?,email=?,phone=?,birthday=? where sid=?";
		}else if(role.equals("teacher")){
			sql="update teacher set role=?,username=?,password=?,sex=?,email=?,phone=?,birthday=? where tid=?";
		}else if(role.equals("admin")){
			sql="update admin set role=?,username=?,password=?,sex=?,email=?,phone=?,birthday=? where aid=?";
		}
		
		Object params[]={
				auser.getRole(),auser.getUsername(),auser.getPassword(),auser.getSex(),auser.getEmail(),auser.getPhone(),new java.sql.Date(auser.getBirthady().getTime()),auser.getId()
		};
		
		JDBCUtils.update(sql, params);
		
	}

	public void delById(String id, String role) {
		
		String sql="";
		if(role.equals("student")){
			sql="delete from student where sid=?";
		}else if(role.equals("teacher")){
			sql="delete from teacher where tid=?";
		}else if(role.equals("admin")){
			sql="delete from admin where aid=?";
		}
		JDBCUtils.update(sql,id);
		
	}

	public List<Map<String, Object>> findCount(String role,String key) {
		String sql="";
		if(role.equals("student")){
			sql="select count(*) from student where username like ?";
		}else if(role.equals("teacher")){
			sql="select count(*) from teacher where username like ?";
		}else if(role.equals("admin")){
			sql="select count(*) from admin where username like ?";
		}
		return JDBCUtils.query(sql,key);
		
	}

	public User findByUsername(String username,String role) {
		User user=null;
		String sql="";
		if(role.equals("student")){
			sql="select * from student where username=?";
		}else if(role.equals("teacher")){
			sql="select * from teacher where username=?";
		}else if(role.equals("admin")){
			sql="select * from admin where username=?";
		}
		
		
		Object params[]={username};
		List<Map<String,Object>> list=JDBCUtils.query(sql, params);
				
		if(!list.isEmpty()){
			user=new User();
			user.setUsername((String)list.get(0).get("username"));
			user.setPassword((String)list.get(0).get("password"));
		}
		
		return user;
	}
	
	public void delete(String role,String[] ids){
		/*
		 * 1.拼出删除的sql语句DELETE FROM tb_news WHERE id IN(?,?,?)
		 * 2.生成对应的参数数组
		 * 3.调用JDBCUtils删除
		 */
		StringBuilder sql=null;
		if(role.equals("student")){
			sql=new StringBuilder("DELETE FROM student WHERE sid IN(");
		}else if(role.equals("teacher")){
			sql=new StringBuilder("DELETE FROM teacher WHERE tid IN(");
		}else if(role.equals("admin")){
			sql=new StringBuilder("DELETE FROM admin WHERE aid IN(");
		}
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
