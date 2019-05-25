package com.zl.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zl.entity.Page;
import com.zl.entity.User;
import com.zl.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	UserService userService=new UserService();
	
	
	
	
	@RequestMapping(value="/tologin")
	public ModelAndView tologin(){
		ModelAndView mv = new ModelAndView();
//		System.out.println("11111111111111111");
        //添加模型数据 可以是任意的POJO对象  
//        mv.addObject("message", "Hello World!");  
        // 设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面  
        mv.setViewName("login"); 
       // 返回ModelAndView对象。
       return mv;
	}
	
	@RequestMapping(value="/success")
	public ModelAndView success(){
		ModelAndView mv = new ModelAndView();
        mv.setViewName("main"); 
       return mv;
	}
	
	
	@RequestMapping(value="/login")
	public void login(String role,String username,String password,String rem,HttpServletRequest request,HttpServletResponse response) throws IOException{
//		ModelAndView mv = new ModelAndView();
//		String rem=request.getParameter("rem");
		System.out.println(rem);
		User auser=null;
		auser=new User();
		auser.setPassword(password);
		auser.setUsername(username);
		auser.setRole(role);
		boolean flag=userService.login(auser);
		PrintWriter out = response.getWriter();
		if(flag){
			//记住我
			if("true".equals(rem)){
				System.out.println(URLEncoder.encode(username,"utf-8"));
				System.out.println(URLEncoder.encode(role,"utf-8"));
				Cookie cook =new Cookie("username",URLEncoder.encode(username,"utf-8"));
	        	cook.setMaxAge(14*24*60*60); //两个星期
	        	response.addCookie(cook);
	        	Cookie cook1 =new Cookie("role",URLEncoder.encode(role,"utf-8"));
	        	cook1.setMaxAge(14*24*60*60); //两个星期
	        	response.addCookie(cook1);
			}
			HttpSession session=request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("role", role);
	        out.print("1");//返回登录信息
		}else{
			out.print("0");
			
		}
		out.flush();
        out.close();
	}
	
	
	
	
	

	
	@RequestMapping(value="/list")
	public ModelAndView list(String role,Integer currPage,String soukey){
		ModelAndView mv=new ModelAndView();
		String key="%%";
		if(soukey!=null){
			key="%"+soukey+"%";
		}
		
		int pageSize=5;
		if(currPage==null||currPage==0){
			currPage=1;
		}
		int index=(currPage-1)*pageSize;
		int totalCount=Integer.parseInt(userService.findCount(role,key).get(0).get("count(*)").toString());
//		System.out.println(totalCount);
		Page page=new Page();
		page.setPageSize(pageSize);
		page.setTotalCount(totalCount);
		page.setCurrPage(currPage);
		mv.addObject("page", page);
		
		
		List<Map<String,Object>> list= userService.userList(role,index,pageSize,key);
		mv.addObject("rolemsg",role);
		mv.addObject("key",soukey);
		mv.addObject("list",list);
		mv.setViewName("user_list");
		return mv;
	}
	
	
	
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(String sid,String tid){
		List<Map<String,Object>> list=null;
		ModelAndView mv=new ModelAndView();
		if("".equals(tid)){
			list= userService.findById(sid,"student");
		}else{
			list= userService.findById(tid,"teacher");
		}
		
		mv.addObject("list",list);
		mv.setViewName("user_add");
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/edit")
	public ModelAndView edit(String id,String role,String username,String password,String sex,String email,String phone,String birthday) throws ParseException{
		
		ModelAndView mv=new ModelAndView();
		User auser=new User();
		auser.setRole(role);
		auser.setUsername(username);
		auser.setPassword(password);
		auser.setSex(sex);
		auser.setEmail(email);
		auser.setPhone(phone);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		Date date = formatter.parse(birthday);
//		System.out.println(date); 
		auser.setBirthady(date);
		if(id==null||"".equals(id)){
			userService.addUser(auser);
		}else{
			auser.setId(Integer.parseInt(id));
			userService.editUser(auser);
		}
//		System.out.println(username);
//		List<Map<String,Object>> list= userService.userList();
//		mv.addObject("list",list);
//		mv.setViewName("user_add");
		return list(role,1,null);
	}
	
	@RequestMapping(value="/del")
	public ModelAndView del(String sid,String tid){
		List<Map<String,Object>> list=null;
		ModelAndView mv=new ModelAndView();
		String role="";
		if("".equals(tid)){
			role="student";
			userService.delById(sid,role);
		}else{
			role="teacher";
			userService.delById(tid,role);
		}
		
		
		return list(role,1,null);
	}
	
	
	
	//退出
	@RequestMapping(value="/logout")
	private ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		ModelAndView mv=new ModelAndView();
//		System.out.println("1111111111111");
		HttpSession session=request.getSession();
		if(session.getAttribute("username")!=null){
			session.removeAttribute("username");
			session.removeAttribute("role");
			session.invalidate();
			Cookie cook =new Cookie("username","");
	    	cook.setMaxAge(0); 
	    	response.addCookie(cook);
	    	Cookie cook1 =new Cookie("role","");
	    	cook1.setMaxAge(0); 
	    	response.addCookie(cook1);
		}
		
    	
//		response.getWriter().print("<html><script type='text/javascript'> top.location.href='login.jsp'</script></html>");
//        response.setContentType("text/html");
//    	mv.setViewName("redirect:/WEB-INF/pages/login.jsp");
		return tologin();
	}
	
	@RequestMapping(value="/yanzheng")
	public void yanzheng(String username,String role,HttpServletResponse response) throws IOException{
		UserService userService=new UserService();
		boolean flag=userService.yanzheng(username,role);
		PrintWriter write=response.getWriter(); 
		
		if(flag){
			write.println("0");  
		}else{
			write.println("1");  
		}
	}
	
	@RequestMapping(value="/delMore")
	public ModelAndView deleteMore(String role,String[] sel)  {
		userService.deleteMore(role,sel);
		return list(role,1,null);
	}
	
}
