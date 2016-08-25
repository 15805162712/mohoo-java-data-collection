/*
 * AppInfoDAO.java
 * 版权所有：南京摩虎网络科技有限公司 2010 - 2020
 * 南京摩虎网络科技有限公司保留所有权利，未经允许不得以任何形式使用。
 */
package com.mohoo.data.collection.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mohoo.data.collection.domain.AppInfo;

/**
 * 类描述 <p>
 * 创建日期：2016年8月24日<br>
 * 修改历史：<br>
 * 修改日期：<br>
 * 修改作者：<br>
 * 修改内容：<br>
 * @author Administrator
 * @version 1.0
 */
public interface AppInfoDAO {
	
	/**
	 * 校验app有效性
	 * 方法描述
	 * @param appid
	 * @param secret
	 * @return
	 */
	public int checkApp(@Param("appid")String appid,@Param("secret")String secret);
	
	/**
	 * 根据appid查找对应的id
	 * 方法描述
	 * @param appid
	 * @param secret
	 * @return
	 */
	public Integer findKey(Map<String,Object> paramMap);
	
	/**
	 * 查询所有的key
	 * 方法描述
	 * @return
	 */
	public List<AppInfo> findAllApp();
	
	/**
	 * 根据参数查询对应的App
	 * 方法描述
	 * @return
	 */
	public AppInfo findAppByAppid(@Param("appid")String appid);
}
