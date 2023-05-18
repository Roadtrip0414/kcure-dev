package kcure.portal.example.service;

import java.util.List;
import java.util.Map;

import kcure.portal.example.service.impl.ExEditorVO;

public interface ExampleService {

	void editorInsert(ExEditorVO exEditorVO);

	ExEditorVO selectDetail(ExEditorVO exEditorVO);

	void editorUpdate(ExEditorVO exEditorVO);

	List<ExEditorVO> selectList(ExEditorVO exEditorVO);

	int selectListCnt(ExEditorVO exEditorVO);

	List<Map> selectFileList();

}
