package com.withice.vo;

public class Pagenation {

	private int totalRows;
	private int viewRows;
	private int totalpage;
	private int pageNo;
	private int beginIndex;
	private int endIndex;
	private int viewPageCnt;
	private int totalPageBlock;
	private int beginPageIndex;
	private int endPageIndex;
	private int currentBlock;
	
	public Pagenation(int totalRows, int viewRows, int viewPageCnt, int pageNo) {
		this.totalRows = totalRows;
		this.viewRows = viewRows;
		this.pageNo = pageNo;
		this.viewPageCnt = viewPageCnt;
		
		init();
	}
	
	private void init() {
		totalpage = (int) Math.ceil((double) totalRows/viewRows);
		beginIndex = (pageNo - 1)*viewRows + 1;
		endIndex = viewRows * pageNo;
		if (pageNo == totalpage) {
			endIndex = totalRows;
		}
			
		totalPageBlock = (int) Math.ceil((double) totalpage/viewPageCnt);
		currentBlock = (int) Math.ceil((double) pageNo/viewPageCnt);
		
		beginPageIndex = (currentBlock - 1)*viewPageCnt + 1;
		endPageIndex = currentBlock*viewPageCnt;
		if (currentBlock == totalPageBlock) {
			endPageIndex = totalpage;
		}
		
	}
	
	public int getPageNo() {
		return pageNo;
	}
	
	public int getBeginIndex() {
		return beginIndex;
	}
	
	public int getEndIndex() {
		return endIndex;
	}
	
	public int getTotalpage() {
		return totalpage;
	}
	
	public int getBeginPageIndex() {
		return beginPageIndex;
	}
	
	public int getEndPageIndex() {
		return endPageIndex;
	}
}
