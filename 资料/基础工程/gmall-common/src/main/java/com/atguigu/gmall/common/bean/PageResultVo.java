package com.atguigu.gmall.common.bean;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 分页工具类
 */
@Data
public class PageResultVo implements Serializable {

	private static final long serialVersionUID = 1L;
	//每页记录数
	private Long pageSize;
	//当前页数
	private Long pageNum;
	//总记录数
	private Long total;
	//总页数
	private Long totalPage;
	//列表数据
	private List<?> list;

	/**
	 * 分页
	 * @param list        列表数据
	 * @param total  总记录数
	 * @param pageSize    每页记录数
	 * @param pageNum    当前页数
	 */
	public PageResultVo(List<?> list, Long total, Long pageSize, Long pageNum) {
		this.list = list;
		this.total = total;
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.totalPage = (long) Math.ceil((double)total/pageSize);
	}

	public PageResultVo(IPage page){
		this.list = page.getRecords();
		this.total = page.getTotal();
		this.pageSize = page.getSize();
		this.pageNum = page.getCurrent();
		this.totalPage = page.getPages();
	}

}
