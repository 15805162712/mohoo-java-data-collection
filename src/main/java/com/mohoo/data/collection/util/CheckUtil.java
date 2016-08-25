/*
 * CheckUtil.java
 * 版权所有：南京摩虎网络科技有限公司 2010 - 2020
 * 南京摩虎网络科技有限公司保留所有权利，未经允许不得以任何形式使用。
 */
package com.mohoo.data.collection.util;

import java.util.Map;
import java.util.regex.Pattern;

/**
 * 类描述
 * <p>
 * 创建日期：2016年8月22日<br>
 * 修改历史：<br>
 * 修改日期：<br>
 * 修改作者：<br>
 * 修改内容：<br>
 * 
 * @author Administrator
 * @version 1.0
 */
public class CheckUtil {
	/**
	 * 判断是否为整数
	 * 
	 * @param str
	 *            传入的字符串
	 * 
	 * @return 是整数返回true,否则返回false
	 */
	public static boolean isInteger(String str) {
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]+$");
		return pattern.matcher(str).matches();
	}
	/**
	 * 判断map中根据参数获取的值是否为空
	 * 
	 * @param paramMap
	 * @param param
	 * @return
	 */
	public static boolean isNotEmptyMap(Map<String, Object> paramMap,
			String param) {
		if (paramMap != null && paramMap.get(param) != null
				&& !"".equals(paramMap.get(param).toString())) {
			return true;
		}
		return false;
	}
	/**
	 * 获取map中的参数
	 * 
	 * @param paramMap 
	 * @param param 
	 * @return
	 */
	public static String getParamMap(Map<String, Object> paramMap, String param) {
		return paramMap != null && paramMap.get(param) != null
				&& !"".equals(paramMap.get(param).toString()) ? paramMap.get(
				param).toString() : null;
	}
}
