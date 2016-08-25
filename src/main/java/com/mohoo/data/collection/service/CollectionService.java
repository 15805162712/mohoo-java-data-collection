/*
 * CollectionService.java
 * 版权所有：南京摩虎网络科技有限公司 2010 - 2020
 * 南京摩虎网络科技有限公司保留所有权利，未经允许不得以任何形式使用。
 */
package com.mohoo.data.collection.service;

import java.util.List;
import java.util.Map;

import com.mohoo.data.collection.domain.AppInfo;

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
public interface CollectionService {
	/**
	 * 查找所有信息
	 * 方法描述
	 * @return
	 */
	public List<AppInfo> findAllApp();
	/**
	 * 根据key查询信息
	 * 方法描述
	 * @param appid
	 * @param secret
	 * @return
	 */
	public AppInfo findAppByAppid(String appid);
	
	/**
	 * 校验数据
	 * 方法描述
	 * @return
	 */
	public int checkApp(String appid,String secret);
	
	/**
	 * 存储信息
	 * 方法描述
	 * @param paramMap
	 * @return
	 */
	public int saveCollectionInfo(Map<String,Object> paramMap);  
	
	/**
	 * 统计信息
	 * 方法描述
	 * @param paramMap
	 * @return
	 */
	public List<Map<String,Object>> findStatisticsByCond(Map<String,Object> paramMap);
}
