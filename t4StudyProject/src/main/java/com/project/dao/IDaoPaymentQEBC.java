package com.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.dto.DonationDto;
import com.project.dto.PaymentDto;

public interface IDaoPaymentQEBC {

	int payNumberMax();
	ArrayList<DonationDto> dntSltQEBC(int dntNum);
	List<PaymentDto> dntSltMEBC(@Param("start") int start, @Param("end") int end, @Param("userCode") String userCode);

}
