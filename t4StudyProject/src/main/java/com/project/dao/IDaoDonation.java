package com.project.dao;

import com.project.dto.DonationDto;

public interface IDaoDonation {

	DonationDto dntSltOne(int dntNum);
	
	void dntInsertHist(DonationDto donDto) throws Exception;

}
