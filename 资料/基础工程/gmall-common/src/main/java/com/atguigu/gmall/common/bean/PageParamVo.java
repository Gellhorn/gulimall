package com.atguigu.gmall.common.bean;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 分页查询参数
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageParamVo {

	private static final long serialVersionUID = 1L;
	//当前页码
    private int pageNum = 1;
    //每页条数
    private int pageSize = 10;

    // 查询条件
    private String key;

    public <T> IPage<T> getPage(){

        return new Page<>(pageNum, pageSize);
    }
}
