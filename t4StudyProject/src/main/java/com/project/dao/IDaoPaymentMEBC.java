package com.project.dao;

import com.project.dto.PaymentDto;

public interface IDaoPaymentMEBC {

	PaymentDto paySltOne(int dntNum);
	
	int payInsert(PaymentDto dto);


}
