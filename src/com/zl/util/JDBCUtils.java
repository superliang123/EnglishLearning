package com.zl.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class JDBCUtils {
	private static String driver;
	private static String name;
	private static String password;
	private static String url;
	//只会在类
	static{
		Properties prop=new Properties();
		InputStream in=JDBCUtils.class.getClassLoader().getResourceAsStream("dbConfig.properties");
		try {
			prop.load(in);
			driver=(String)prop.get("driver");
			url=(String)prop.get("url");
			name=(String)prop.get("name");
			password=(String)prop.get("password");
			Class.forName(driver);
			
		} catch (Exception e) {
			throw new RuntimeException(e); 
		}
	}
	
	
	
	/*
	 * 1.加载驱动，获取数据库的连接
	 */
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		
		return DriverManager.getConnection(url,name,password);
	}
	
	public static void release(ResultSet rs,Statement stmt,Connection conn){
		if(rs!=null){
			try {
				rs.close();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
	}
	

	/*
	 * 增操作，返回自增的主键
	 * Object …params表示可变参数
	 */
	public static Object insert(String sql,Object ...params){
		/*
		 *1.获取数据库连接
		 *2.访问数据库（增删改）
		 *3.关闭数据库连接
		 */
		Connection conn=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		Object key=null;
		try{
			
			conn=getConnection();
			//获取自动增加的id号
			pre=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			setParams(pre,params);
			pre.executeUpdate();
			rs=pre.getGeneratedKeys();//获取自增的主键
			if(rs.next()){
				key=rs.getObject(1);
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			release(rs,pre,conn);
		}
		return key;
	}
	
	public static int update(String sql,Object ...params){
		Connection conn=null;
		PreparedStatement pre=null;
		try {
			conn=getConnection();
			pre=conn.prepareStatement(sql);
			setParams(pre, params);
			return pre.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally{
			
			release(null,pre,conn);
		}
	}
	
	public static List<Map<String,Object>> query(String sql,Object ...params){
		List<Map<String,Object>> list=null;
		Connection conn=null;
		PreparedStatement pre=null;
		ResultSet rs=null; 
		try {
			conn=getConnection();
			pre=conn.prepareStatement(sql);
			setParams(pre, params);
			rs=pre.executeQuery();
			list=RsToList(rs);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally{
			
			release(rs,pre,conn);
		}
		return list;
	}

	private static void setParams(PreparedStatement pre, Object... params)
			throws SQLException {
		if(params!=null){
			for(int i=0;i<params.length;i++){
				pre.setObject(i+1, params[i]);
			}
		}
	}
	
	//rs转换成list
		private static List<Map<String, Object>> RsToList(ResultSet rs) throws SQLException {
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			
			//获取表结构
			ResultSetMetaData rsmd=rs.getMetaData();
			
			//通过循环每次读出一条记录
			while(rs.next()){
				//map用来存储当前读出的一条记录
				Map<String,Object> map=new HashMap<String,Object>();
				
				//通过循环将当前记录中的字段和字段值读出
				for(int i=1;i<=rsmd.getColumnCount();i++){
					//读取字段名rsmd.getCatalogName(i)
					//读取字段值rs.getObject(i)，对应的value
					map.put(rsmd.getColumnName(i).toLowerCase(), rs.getObject(i));
				}
				list.add(map);
			}
			return list;
		}

	
	
}
