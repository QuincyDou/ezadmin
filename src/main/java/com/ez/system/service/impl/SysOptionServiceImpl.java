/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.service.impl;

import com.ez.base.BaseDao;
import com.ez.base.service.impl.BaseServiceImpl;
import com.ez.system.entity.SysOption;
import com.ez.system.service.SysOptionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @author chenez
 * @2017-04-18
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysOptionService")
public class SysOptionServiceImpl extends BaseServiceImpl<SysOption> implements SysOptionService{
    @Resource(name="sysOptionDao")
    public void setDao(BaseDao<SysOption> dao) {
        super.setDao(dao);
    }

}