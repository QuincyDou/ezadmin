/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.dao;

import com.ez.base.BaseDao;
import com.ez.system.entity.SysUserRole;

import java.util.List;

/**
 * @author chenez
 * @2017-04-29
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysUserRoleDao extends BaseDao<SysUserRole>{

    List<SysUserRole> findById(String userno);

    List<SysUserRole> findByRoleid(String ids);
}
