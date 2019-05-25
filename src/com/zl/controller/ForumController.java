package com.zl.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zl.entity.Forum;
import com.zl.entity.Page;
import com.zl.entity.Reply;
import com.zl.service.ForumService;
import com.zl.util.KeyWordFilter;

@Controller
@RequestMapping(value="/forum")
public class ForumController {
	ForumService forumService=new ForumService();
	
	
	
	@RequestMapping(value="/list")
	public ModelAndView list(Integer currPage,String soukey){
		ModelAndView mv=new ModelAndView();
		String key="%%";
		if(soukey!=null){
			key="%"+soukey+"%";
		}
		//分页
		int pageSize=5;
		if(currPage==null||currPage==0){
			currPage=1;
		}
		int index=(currPage-1)*pageSize;
		int totalCount=Integer.parseInt(forumService.findCount(key).get(0).get("count(id)").toString());
//		System.out.println(totalCount);
		Page page=new Page();
		page.setPageSize(pageSize);
		page.setTotalCount(totalCount);
		page.setCurrPage(currPage);
		mv.addObject("page", page);

		List<Map<String,Object>> list=forumService.findAll(index,pageSize,key);
		mv.addObject("list", list);
		mv.addObject("key",soukey);
		mv.setViewName("forum_list");
		return mv;
	}
	
	@RequestMapping(value="/add")
	public ModelAndView add(String id,String title,String author,String type,String content){
		Forum forum=new Forum();
		
		//敏感词过滤
		title=KeyWordFilter.keyWordFilter(title);
		content=KeyWordFilter.keyWordFilter(content);
		
		forum.setTitle(title);
		forum.setAuthor(author);
		forum.setType(type);
		forum.setContent(content);
		forum.setTime(new Date());
		if(id==null||"".equals(id)){
			forumService.add(forum);
		}else{
			forum.setId(Integer.parseInt(id));
			forumService.edit(forum);
		}
		
		
		return list(1,null);
	}
	
	@RequestMapping(value="/show")
	public ModelAndView show(String id,Integer currPage){
//		System.out.println(id);
		ModelAndView mv = new ModelAndView();
		//分页
		int pageSize=10;
		if(currPage==null||currPage==0){
			currPage=1;
		}
		int index=(currPage-1)*pageSize;
		int totalCount=Integer.parseInt(forumService.findCountReply(id).get(0).get("count(id)").toString());
		Page page=new Page();
		page.setPageSize(pageSize);
		page.setTotalCount(totalCount);
		page.setCurrPage(currPage);
		mv.addObject("page", page);
		List<Map<String,Object>> list=forumService.findById(id);
//		System.out.println(list);
		List<Map<String,Object>> reply=forumService.findAllReply(id,index,pageSize);
//		System.out.println(reply);
		mv.addObject("list", list);
		mv.addObject("reply", reply);
		mv.setViewName("forum_show");
		return mv;
	}
	
	@RequestMapping(value="/replyAdd")
	public ModelAndView replyAdd(String forumid,String author,String lou,String content){
		//敏感词过滤
		content=KeyWordFilter.keyWordFilter(content);
		
		Reply areply=new Reply();
		areply.setForumid(Integer.parseInt(forumid));
		areply.setAuthor(author);
		areply.setContent(content);
		areply.setTime(new Date());
		areply.setLou(Integer.parseInt(lou));
		
		forumService.replyAdd(areply);
		
		
		return show(forumid,1);
	}
	
	@RequestMapping(value="/del")
	public ModelAndView del(String id){
		forumService.delById(id);
		return list(1,null);
	}
	
	//批量删除
	@RequestMapping(value="/delMore")
	public ModelAndView deleteMore(String[] sel)  {
		forumService.deleteMore(sel);
		return list(1,null);
	}
	
	
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(String id){
		List<Map<String,Object>> list=null;
		ModelAndView mv=new ModelAndView();
		list= forumService.findById(id);
		mv.addObject("list",list);
		mv.setViewName("forum_add");
		return mv;
	}
	
	

}
