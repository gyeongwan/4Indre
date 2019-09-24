package com.project.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.IDaoMyBoard;
import com.project.dto.MyBoardDto;
import com.project.svc.MyBoardSvc;

@Service("mybdSvc")
public class MyBoardSvcImpl implements MyBoardSvc {

	@Autowired
	private IDaoMyBoard bdDao;

	@Override
	public List<MyBoardDto> selectBoardList(MyBoardDto bdDto) throws Exception {
		
		int boardNum = bdDto.getCode();
		System.out.println("확인"+bdDto);
		List<MyBoardDto> list = bdDao.selectBoardList(boardNum);
		System.out.println("list확인"+list);
		return list;
	}

	@Override
	public void insertBoard(MyBoardDto bdDto) throws Exception {
		bdDao.insertBoard(bdDto);

	}

	@Override
	public void updateBoard(MyBoardDto bdDto) throws Exception {
		bdDao.updateBoard(bdDto);

	}

	@Override
	public void deleteBoard(MyBoardDto bdDto) throws Exception {
		bdDao.deleteBoard(bdDto);

	}

	@Override
	public MyBoardDto selectBoardByCode(MyBoardDto bdDto) throws Exception {
		MyBoardDto resultDto = bdDao.selectBoardByCode(bdDto);
		return resultDto;
	}

}