package com.zl.entity;

public class Page {
	private int pageSize;	// 每页所包含的商品的数量
	private int totalPage;	// 总页数
	private int totalCount;	// 总商品数
	private int currPage;	// 当前所在的页数,如第1页,第2页
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return  (int) Math.ceil(totalCount * 1.0 / pageSize);
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	@Override
	public String toString() {
		return "Page [pageSize=" + pageSize + ", totalPage=" + totalPage
				+ ", totalCount=" + totalCount + ", currPage=" + currPage + "]";
	}
	
	
}
