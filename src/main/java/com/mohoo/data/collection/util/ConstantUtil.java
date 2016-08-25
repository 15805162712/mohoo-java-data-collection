/*
 * ConstantUtil.java
 * 版权所有：南京摩虎网络科技有限公司 2010 - 2020
 * 南京摩虎网络科技有限公司保留所有权利，未经允许不得以任何形式使用。
 */
package com.mohoo.data.collection.util;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;

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
public class ConstantUtil {
	/**
	 * 版本号
	 */
	public static final String VERSION="1.0";
	
	public static boolean isNotEmpityMap(Map<String,Object> paramMap ,String param){
		return paramMap.get(param)!=null&&StringUtils.isNotEmpty(paramMap.get(param).toString());
	}
	public static boolean isNotEmpityMap(Map<String,Object> paramMap ,String... params){
		for (String param : params) {
			if (paramMap.get(param)==null||StringUtils.isEmpty(paramMap.get(param).toString())) {
				paramMap.put("errorParam", param);
				return false;
			}
		}
		return true;
	}
}
