package kcure.portal.example.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.adb.service.AddressBookUser;

@Repository("ExampleDAO")
public class ExampleDAO extends EgovComAbstractDAO {

	public void editorInsert(ExEditorVO exEditorVO) {
		insert("Editor.editorInsert", exEditorVO);
		
	}

	public ExEditorVO selectDetail(ExEditorVO exEditorVO) {
		return selectOne("Editor.selectEditorDetail", exEditorVO);
	}

	public void editorUpdate(ExEditorVO exEditorVO) {
		update("Editor.editorUpdate", exEditorVO);
	}

	public List<ExEditorVO> selectList(ExEditorVO exEditorVO) {
		return selectList("Editor.selectList", exEditorVO);
	}

	public int selectListCnt(ExEditorVO exEditorVO) {
		return selectOne("Editor.selectListCnt", exEditorVO);
	}

	public List<Map> selectFileList() {
		return selectList("ExampleFile.selectList");
	}

}
