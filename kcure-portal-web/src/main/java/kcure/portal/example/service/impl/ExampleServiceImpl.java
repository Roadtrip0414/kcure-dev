package kcure.portal.example.service.impl;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kcure.portal.example.service.ExampleService;

@Service("ExampleService")
public class ExampleServiceImpl implements ExampleService {
	@Resource(name = "ExampleDAO")
	private ExampleDAO exampleDAO;

	@Override
	public void editorInsert(ExEditorVO exEditorVO) {
		exampleDAO.editorInsert(exEditorVO);
	}


	@Override
	public ExEditorVO selectDetail(ExEditorVO exEditorVO) {
		return exampleDAO.selectDetail(exEditorVO);
	}

	@Override
	public void editorUpdate(ExEditorVO exEditorVO) {
		exampleDAO.editorUpdate(exEditorVO);

	}

	@Override
	public List<ExEditorVO> selectList(ExEditorVO exEditorVO) {
		return exampleDAO.selectList(exEditorVO);
	}


	@Override
	public int selectListCnt(ExEditorVO exEditorVO) {
		return exampleDAO.selectListCnt(exEditorVO);
	}


	@Override
	public List<Map> selectFileList() {
		return exampleDAO.selectFileList();
	}


}
