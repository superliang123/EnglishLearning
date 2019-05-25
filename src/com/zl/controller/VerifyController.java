package com.zl.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zl.util.VerifyCode;


@Controller
@RequestMapping(value="/ve")
public class VerifyController {

	@RequestMapping(value="/getVerifyCode")
	public void getVerifyCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 输出一个带有验证码的图片
		 */
		VerifyCode vc =new VerifyCode();
		BufferedImage image=vc.getImage();//获取带验证码的图片
		request.getSession().setAttribute("verifyCode", vc.getText());//把验证码字符保存
		vc.output(image, response.getOutputStream());//把验证码发送给客户端

	}
	
	@RequestMapping(value="/yanzheng")
	public void yanzheng(HttpServletRequest request,
			HttpServletResponse response,String verifyCode) throws IOException {
//		System.out.println(verifyCode);
		PrintWriter write=response.getWriter(); 
		
		if(!verifyCode.equalsIgnoreCase((String)request.getSession().getAttribute("verifyCode"))){
			write.println("0");
		}else{
			write.println("1");
		}
	}
}
