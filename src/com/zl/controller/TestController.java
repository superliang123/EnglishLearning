package com.zl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Encoder;

import com.zl.entity.Page;
import com.zl.entity.Test;
import com.zl.service.TestService;

@Controller
@RequestMapping(value="/test")
public class TestController {
	TestService testService=new TestService();

	@RequestMapping(value="/list")
	public ModelAndView list(Integer currPage,String soukey){
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
		int totalCount=Integer.parseInt(testService.findCount(key).get(0).get("count(id)").toString());
//		System.out.println(totalCount);
		Page page=new Page();
		page.setPageSize(pageSize);
		page.setTotalCount(totalCount);
		page.setCurrPage(currPage);
		mv.addObject("page", page);
		
		
		List<Map<String,Object>> list=testService.findAll(index,pageSize,key);
		mv.addObject("list", list);
		mv.addObject("key",soukey);
		mv.setViewName("test_list");
		
		
		return mv;
	}
	
	
	
	@RequestMapping(value="/upload")
	public ModelAndView upload(HttpServletRequest request,HttpServletResponse response) throws IOException{
//		ModelAndView mv=new ModelAndView();
		
//		MultipartHttpServletRequest multipartRequest=(MultipartHttpServletRequest)request;
//		String a = multipartRequest.getParameter("a");
//		System.out.println(a);
		String title="";
		String path="";
		String author="";
		String fname="";
		
		response.setContentType("text/html;charset=utf-8");
		try {
			
			//1.创建DiskFileItemFactory工厂对象
			DiskFileItemFactory factory=new DiskFileItemFactory();
		
			//2.创建ServletFileUpload对象
			ServletFileUpload fileupload=new ServletFileUpload(factory);
			fileupload.setHeaderEncoding("utf-8");
			//3.解析request，得到上传文件的FileItem对象
			List<FileItem> fileitems=fileupload.parseRequest(request);
			//获取字符流
			PrintWriter writer=response.getWriter();
			//遍历集合
			for(FileItem fileitem:fileitems){
				//判断是否为普通字段
				if(fileitem.isFormField()){
					//获得字段名和字段值
					String name=fileitem.getFieldName();
					if(name.equals("name"))
					{
						//如果name不为空，将其保存在value中
						if(!fileitem.getString().equals(""))
						{
							String value=fileitem.getString("utf-8");
							writer.print("上传者："+value+"<br/>");
							author=value;
						}	
					}
				}else{
					//获取上传文件名
					String filename=fileitem.getName();
					
					//数据表标题
					title=filename;
					
//					System.out.println(filename);
					//处理上传文件
					if(filename!=null&&!filename.equals("")){
						writer.print("上传的文件名称是："+filename+"<br/>");
						//截取出文件名
						filename=filename.substring(filename.lastIndexOf("\\")+1);
						//文件名需要唯一
						filename=UUID.randomUUID().toString()+"_"+filename;
						fname=filename;
						//在服务器上创建同名文件
						String webPath="/upload/";
						//将服务器中文件夹路径与文件名组合成完整的服务器路径
						String filepath=request.getServletContext().getRealPath(webPath+filename);
						
						path=filepath;
						
						
						//创建文件
						File file=new File(filepath);
						file.getParentFile().mkdirs();
						file.createNewFile();
						//获得上传文件流
						InputStream in=fileitem.getInputStream();
						//使用FileOutputStream打开服务器端的上传文件
						FileOutputStream out=new FileOutputStream(file);
						//流的对拷
						byte[] buffer=new byte[1024];//每次读取一个字节
						int len;
						//开始读取上传文件的字节，并将其输出到服务器的上传文件输出流中
						while((len=in.read(buffer))>0){
							out.write(buffer,0,len);
						}
						//关闭流
						in.close();
						out.close();
						//删除临时文件
						fileitem.delete();
						writer.print("上传成功！<br/>");
					}
				}
			}
		} catch (FileUploadException e) {			
			e.printStackTrace();
		}	
		
		
//		System.out.println(title);
//		System.out.println(path);
//		System.out.println(author);
//		String path2[]=path.split("\\");
//		System.out.println(path2[5]);
		
		Test test=new Test();
		test.setTitle(title);
		test.setAuthor(author);
		test.setPath("upload//"+fname);
		System.out.println(fname);
		test.setTime(new Date());
		testService.add(test);
		
		
		
		
//		return mv;
		return list(1,null);
	}
	
	
	
	@RequestMapping(value=("/download"))
	public void download(HttpServletRequest request,HttpServletResponse response) throws IOException{
		/*
		 * 获取下载地址，下载
		 */
		//获取相对路径
		String filename = request.getParameter("path");
//		filename = new String(filename.getBytes("iso-8859-1"),"utf-8");
		
		//获取要下载的文件的物理路径
		String filepath = request.getServletContext().getRealPath("/")+filename;
		System.out.println(filepath);
		int index = filename.lastIndexOf("/");
		if(index!=-1)
			filename = filename.substring(index+1);//获取文件名
		System.out.println(filename);
		
		// 为了使下载框中显示中文文件名称不出乱码！
		String framename = filenameEncoding(filename, request);
		
		
		String contentType = request.getServletContext()
				.getMimeType(filename);//通过文件名称获取MIME类型
		String contentDisposition = "attachment;filename=" + framename;//为了显示下载框
		// 输入流
		FileInputStream input = new FileInputStream(filepath);
		
		//设置头
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Disposition", contentDisposition);
		
		// 获取绑定了响应端的流（输出流）
		ServletOutputStream output = response.getOutputStream();
		
		IOUtils.copy(input, output);//把输入流中的数据写入到输出流中。
		
		input.close();
		
	}
	
	// 用来对下载的文件名称进行编码的！
	public static String filenameEncoding(String filename, HttpServletRequest request) throws IOException {
		String agent = request.getHeader("User-Agent"); //获取浏览器
		if (agent.contains("Firefox")) {
			//如果是火狐浏览器，则对文件名进行base64编码
			BASE64Encoder base64Encoder = new BASE64Encoder();
			filename = "=?utf-8?B?"
					+ base64Encoder.encode(filename.getBytes("utf-8"))
					+ "?=";
		}  else {
			//其它都使用URLEncoder进行编码
			filename = URLEncoder.encode(filename, "utf-8");
		}
		filename = filename.replace("+", "%20");  //以上编码会将空格转为+，这里再转回来
		return filename;
	}
			
			
			
	@RequestMapping(value="/del")
	public ModelAndView del(String id){
		testService.delById(id);
		return list(1,null);
	}
	
	@RequestMapping(value="/delMore")
	public ModelAndView deleteMore(String[] sel)  {
		testService.deleteMore(sel);
		return list(1,null);
	}
	
}
