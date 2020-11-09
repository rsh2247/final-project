package project.sungho.paging;

public class Paging {
	private int wholeSize,listSize,nowPage,maxPage,listNum,startNum,endNum;
	
	public Paging(int wholeSize, int listSize, int nowPage) {
		super();
		this.wholeSize = wholeSize;
		this.listSize = listSize;
		this.nowPage = nowPage;
		calMax();
	}
	
	public Paging(int wholeSize, int listSize, int nowPage, String reverse) {
		super();
		this.wholeSize = wholeSize;
		this.listSize = listSize;
		this.nowPage = nowPage;
		calMin();
	}
	
	public void calMax() {
		listNum = (int) Math.ceil((double)wholeSize/(double)listSize);
		endNum = wholeSize - (nowPage-1)*listSize;
		startNum = endNum - listSize + 1; if(startNum<1) startNum = 1;
	}
	public void calMin() {
		listNum = (int) Math.ceil((double)wholeSize/(double)listSize);
		startNum = 1 + listSize*(nowPage-1);
		endNum = startNum + listSize - 1; if(endNum>wholeSize) endNum = wholeSize;
	}

	public int getWholeSize() {
		return wholeSize;
	}

	public void setWholeSize(int wholeSize) {
		this.wholeSize = wholeSize;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
}
