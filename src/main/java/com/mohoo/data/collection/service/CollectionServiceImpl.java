/*
 * CollectionServiceImpl.java
 * 版权所有：南京摩虎网络科技有限公司 2010 - 2020
 * 南京摩虎网络科技有限公司保留所有权利，未经允许不得以任何形式使用。
 */
package com.mohoo.data.collection.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mohoo.data.collection.dao.AppInfoDAO;
import com.mohoo.data.collection.dao.CollectionDAO;
import com.mohoo.data.collection.domain.AppInfo;
import com.mohoo.data.collection.util.ConstantUtil;

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
@Service
@Transactional
public class CollectionServiceImpl implements CollectionService {

	@Autowired
	private CollectionDAO collectionDAO;
	@Autowired
	private AppInfoDAO appInfoDAO;

	@Override
	public List<AppInfo> findAllApp() {
		return appInfoDAO.findAllApp();
	}

	@Override
	public AppInfo findAppByAppid(String appid) {
		return appInfoDAO.findAppByAppid(appid);
	}

	@Override
	public int checkApp(String appid, String secret) {
		if (appInfoDAO.checkApp(appid, secret) > 0)
			return 200;
		return 100;
	}

	@Override
	public int saveCollectionInfo(Map<String, Object> paramMap) {
		if (checkParam(paramMap)) {
			Integer key = appInfoDAO.findKey(paramMap);
			if (key != null && key > 0) {
				initCollection(paramMap, key);
				if (collectionDAO.saveCollectionInfo(paramMap) > 0)
					return 200;
				return 300;
			}
			return 101;
		}
		return 100;
	}

	private void initCollection(Map<String, Object> paramMap, int key) {
		paramMap.put("version", ConstantUtil.VERSION);
		paramMap.put("key", key);
		paramMap.put("createtime", new Date());
		paramMap.put("status", "200");
	}

	private boolean checkParam(Map<String, Object> paramMap) {
		return ConstantUtil.isNotEmpityMap(paramMap, new String[] { "appid",
				"secret", "event" });
	}

	@Override
	public List<Map<String, Object>> findStatisticsByCond(
			Map<String, Object> paramMap) {
		if (ConstantUtil.isNotEmpityMap(paramMap, "appid")) {
			AppInfo ai=this.findAppByAppid(paramMap.get("appid").toString());
			paramMap.put("key", ai.getItemid());
		}
		return collectionDAO.findStatisticsByCond(paramMap);
	}

}
