/*
 * CollectionController.java
 * 版权所有：南京摩虎网络科技有限公司 2010 - 2020
 * 南京摩虎网络科技有限公司保留所有权利，未经允许不得以任何形式使用。
 */
package com.mohoo.data.collection.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mohoo.data.collection.domain.AppInfo;
import com.mohoo.data.collection.service.CollectionService;
import com.mohoo.data.collection.util.ConstantUtil;
import com.mohoo.data.collection.util.ResultUtil;

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
@RestController
@RequestMapping("statistics/api/" + ConstantUtil.VERSION + "/collection")
public class CollectionController {

	private static final Logger logger = LoggerFactory
			.getLogger(CollectionController.class);
	@Autowired
	private CollectionService collectionService;

	@RequestMapping("findAll")
	@ResponseBody
	public List<AppInfo> findAll() {
		return collectionService.findAllApp();
	}

	@RequestMapping("findAppByAppid")
	@ResponseBody
	public AppInfo findAppByAppid(String appid) {
		return collectionService.findAppByAppid(appid);
	}

	@RequestMapping(value = "callCollection", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> callCollection(@RequestBody ModelMap model) {
		logger.debug("==========request param:" + model);
		int code = 400;
		try {
			code = collectionService.saveCollectionInfo(model);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultUtil.resultMap(500, e.getMessage());
		}
		return ResultUtil.resultMap(code);
	}

	@RequestMapping(value = "findStatisticsByCond", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> findStatisticsByCond(@RequestBody ModelMap model) {
		logger.debug("==========request param:" + model);
		List<Map<String, Object>> resultList = null;
		try {
			resultList = collectionService.findStatisticsByCond(model);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultUtil.resultMap(500, e.getMessage());
		}
		return ResultUtil.resultMap(200,resultList);
	}
}
