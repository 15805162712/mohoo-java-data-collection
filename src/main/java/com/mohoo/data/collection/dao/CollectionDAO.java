/*
 * CollectionDAO.java
 * 版权所有：南京摩虎网络科技有限公司 2010 - 2020
 * 南京摩虎网络科技有限公司保留所有权利，未经允许不得以任何形式使用。
 */
package com.mohoo.data.collection.dao;

import java.util.List;
import java.util.Map;


/**
 * 类描述 <p>
 * 创建日期：2016年8月22日<br>
 * 修改历史：<br>
 * 修改日期：<br>
 * 修改作者：<br>
 * 修改内容：<br>
 * @author Administrator
 * @version 1.0
 */
public interface CollectionDAO {
	
	/**
	 * 保存收集信息
	 * 方法描述
	 * @param paramMap
	 * @return
	 */
	public int saveCollectionInfo(Map<String,Object> paramMap);
	
	public List<Map<String,Object>> findStatisticsByCond(Map<String,Object> paramMap);
}
