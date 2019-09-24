package com.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.io.ResolverUtil.Test;

public interface paymentPagin {

	public List<Test> testlist(@Param("pageNum") int pageNum, @Param("contentNum") int contentNum);
	public int testCount();
}
