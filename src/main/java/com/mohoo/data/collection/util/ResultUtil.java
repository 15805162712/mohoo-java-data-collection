/*
 * ResultUtil.java
 * 版权所有：南京摩虎网络科技有限公司 2010 - 2020
 * 南京摩虎网络科技有限公司保留所有权利，未经允许不得以任何形式使用。
 */
package com.mohoo.data.collection.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 返回结果
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
public class ResultUtil {
	/**
	 * 返回结果
	 * 方法描述
	 * @param code
	 * @return
	 */
	public static Map<String, Object> resultMap(int code) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap(resultMap,code);
		return resultMap;
	}
	/**
	 * 返回结果，有结果集生成
	 * 方法描述
	 * @param code
	 * @param DataMap
	 * @return
	 */
	public static Map<String,Object> resultMap(int code,Object Data){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("data", Data);
		resultMap(resultMap,code);
		return resultMap;
	}
	/**
	 * 返回结果,有错误信息
	 * 方法描述
	 * @param code
	 * @param errorInfo
	 * @return
	 */
	public static Map<String,Object> resultMap(int code,String errorInfo){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("errorInfo", errorInfo);
		resultMap(resultMap,code);
		return resultMap;
	}
	
	/**
	 * 返回结果
	 * 方法描述
	 * @param paramMap
	 * @param code 100验证无效，200成功，300保存失败,500程序报错
	 * @return
	 */
	public static void resultMap(Map<String,Object> paramMap,int code){
		paramMap.put("code", code);
		switch (code) {
		case 100:
			paramMap.put("info", "Invild Param");
			break;
			
		case 101:
			paramMap.put("info", "Invild Appid");
			break;
			
		case 200:
			paramMap.put("info", "success");
			break;
			
		case 300:
			paramMap.put("info", "Collection Failure!");
			break;
			
		case 400:
			paramMap.put("info", "Invild Request!");
			break;
			
		case 500:
			paramMap.put("info", "System Exception!");
			break;	
			
		default:
			paramMap.put("info", "Other Problem!");
			break;
		}
	}
}
