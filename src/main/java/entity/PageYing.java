package entity;

import java.util.ArrayList;
import java.util.List;


public class PageYing {
	private int pagesize=5;
	private int pageNo;
	private int totalCount;
	private int totalPage;
	private List<Post> yings=new ArrayList<Post>();
	/**
	 * @return the pagesize
	 */
	public int getPagesize() {
		return pagesize;
	}
	/**
	 * @param pagesize the pagesize to set
	 */
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	/**
	 * @return the pageNo
	 */
	public int getPageNo() {
		return pageNo;
	}
	/**
	 * @param pageNo the pageNo to set
	 */
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	/**
	 * @return the totalCount
	 */
	public int getTotalCount() {
		return totalCount;
	}
	/**
	 * @param totalCount the totalCount to set
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		if (this.totalCount%pagesize==0) {
			this.totalPage=totalCount/pagesize;
		}else{
			this.totalPage=totalCount/pagesize+1;
		}
	}
	/**
	 * @return the totalPage
	 */
	public int getTotalPage() {
		return totalPage;
	}
	/**
	 * @param totalPage the totalPage to set
	 */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	/**
	 * @return the yings
	 */
	public List<Post> getYings() {
		return yings;
	}
	/**
	 * @param yings the yings to set
	 */
	public void setYings(List<Post> yings) {
		this.yings = yings;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PageYing [pagesize=" + pagesize + ", pageNo=" + pageNo
				+ ", totalCount=" + totalCount + ", totalPage=" + totalPage
				+ ", yings=" + yings + "]";
	}
}
