package com.ez.cms.service;
import com.ez.base.service.BaseService;
import com.ez.cms.entity.*;

import java.util.List;


/**
 * @author chenez
 * @2017-06-03
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface CmsImgPositionService extends BaseService<CmsImgPosition> {
    List<CmsImgPosition> getSdBySdtCode(String code);
}
