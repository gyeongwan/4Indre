package com.project.dto;

public class PageMaker {

	private int     totalCount;       //전체 게시글 갯수
	private int     pageNum;          //현재 페이지 번호
	private int     contentNum = 10;  //한 페이지 몇개 표시할지
	private int     startPage = 1;    //현재 페이지 블록의 시작 페이지
	private int     endPage = 5;      //현재 페이지 블록의 마지막 페이지
	private boolean prev = false;     //이전 페이지로 가는 화살표
	private boolean next;             //다음 페이지로 가는 화살표
	private int     currentBlock;     //현재 페이지 블록
	private int     lastBlack;        //마지막 페이지 블록
	
	//1페이지에서 왼쪽으로 가는 화살표 마지막 페이지 오른쪽 화살표 설정 메소드
	public void prevnext(int pageNum) {
		if(pageNum>0 && pageNum>6) {
			setPrev(false);
			setNext(true);
		}
		else if(getLastBlack() ==  getCurrentBlock()) {
			setPrev(true);
			setNext(false);
		}
		else {
			setPrev(true);
			setNext(true);
		}
	}
	
	
	public int calcpage(int totalCount, int contentNum) {
		
		// 전체글수  / 한페이지 => 값
		int totalPage = totalCount / contentNum;
		
		if(totalCount%contentNum>0) {
			totalPage++;
		}
		
		return totalPage;
		
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getContentNum() {
		return contentNum;
	}
	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int currentBlock) {
		this.startPage = (currentBlock*5)-4; //한페이지가 10개보여주면 (currentBlock*10)-9
		//1//1 2 3 4 5
		//2//6 7 8 9 10
		//3//11 12 13
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int getlastBlock, int getcurrentBlock) {
		//마지막 블록이 현재 페이지와 같을시 
		if(getlastBlock == getcurrentBlock) {
			this.endPage = calcpage(getTotalCount(), getContentNum());
		}
		else {
			this.endPage = getStartPage()+4;
		}
		
		
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getCurrentBlock() {
		return currentBlock;
	}
	public void setCurrentBlock(int pageNum) {
		//페이지 번호를 통해 구한다
		//페이지 번호 / 페이지 그룹 안의 페이지 개수
		//1p 1 / 5 => 0.2 를 형변환 해서 0으로 인식해 +1해준다.
		//소수점 결과는 +1 을 해준다
		this.currentBlock = pageNum/5;
		if(pageNum%5>0) {
			this.currentBlock++;
		}
	}
	public int getLastBlack() {
		return lastBlack;
	}
	public void setLastBlack(int totalCount) {
		//전체 10 , 한블록 5 => 10 * 5 => 50
		// 125 / 50
		// 3
		
		this.lastBlack = totalCount / (5*this.contentNum);
		if(totalCount %(5*this.contentNum)>0) {
			this.lastBlack++;
		}
	}
	
	
}
