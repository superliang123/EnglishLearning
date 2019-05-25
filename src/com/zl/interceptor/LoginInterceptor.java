package com.zl.interceptor;
import java.net.URLDecoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
  
import org.apache.log4j.Logger;  
import org.springframework.web.servlet.HandlerInterceptor;  
import org.springframework.web.servlet.ModelAndView;  
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;  
  
  
/** 
 * @author Super亮
 *   
 * 2019-4-10
 * 
 * 
 *登录拦截器 
 */  
public class LoginInterceptor implements HandlerInterceptor {  
  
    //日志  
    protected Logger log = Logger.getLogger(getClass());  
      
      
      
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
            Object handle) throws Exception {  
          
        //创建session  
        HttpSession session =request.getSession();  
          
        //无需登录，允许访问的地址  
        String[] allowUrls =new String[]{"/user/tologin","/user/login"};  
              
        //获取请求地址  
        String url =request.getRequestURL().toString();  
//          System.out.println(url);
        
//        HttpServletRequest req=(HttpServletRequest)request;
		if(session.getAttribute("username")==null){
			Cookie cookies[] =request.getCookies();
			if(cookies!=null){
			   	for(int i=0;i<cookies.length;i++){ 
				   	if(cookies[i].getName().equals("username")){  
					   	String username=cookies[i].getValue();
	//				   	System.out.println(url);
						session.setAttribute("username", URLDecoder.decode(username, "utf-8"));
	//					System.out.println(session.getAttribute("username"));
				   	}
				   	if(cookies[i].getName().equals("role")){  
					   	String role=cookies[i].getValue();
	//				   	System.out.println(role);
						session.setAttribute("role", URLDecoder.decode(role, "utf-8"));
	//					System.out.println(session.getAttribute("role"));
				   	}
			   	}
			}
		}
        
        
        //获得session中的用户  
        String user =(String)session.getAttribute("username");  
//        System.out.println(user);
          
        for (String strUrl : allowUrls) {  
            if(url.contains(strUrl))  
            {  
                return true;  
            }  
        }  
          
        if(user ==null)  
        {  
            System.out.println("您尚未登录！");     
          //重定向  
            response.sendRedirect(request.getContextPath()+"/user/tologin");                   
        }  
         
              
          
            return true;  
          
          
    }  
  
    @Override  
    public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler,  
            ModelAndView modelAndView) throws Exception {  
        // TODO Auto-generated method stub  
          
    }  
  
    @Override  
    public void afterCompletion(HttpServletRequest request,  
            HttpServletResponse response, Object handler, Exception ex)  
            throws Exception {  
        // TODO Auto-generated method stub  
          
    }  
      
}  