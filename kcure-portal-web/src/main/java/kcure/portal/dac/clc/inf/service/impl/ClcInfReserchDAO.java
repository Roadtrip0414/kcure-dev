package kcure.portal.dac.clc.inf.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import org.springframework.stereotype.Repository;

 /**
  * @Project : kcure-portal-web
  * @package_name  : kcure.portal.dac.clc.inf.service.impl
  * @FileName : ClcInfOtherDAO.java
  * @since : 2023. 2. 22.
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 :
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  2023. 2. 22.       shpark        최초 생성
  *  </pre>
  */
@Repository("ClcInfReserchDAO")
public class ClcInfReserchDAO extends EgovComAbstractDAO {



	/**
	  * @Method Name : insertClcInfReserch
	  * @작성일 : 2023. 2. 22.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	데이터신청 > 연구정보 등록
	  *  </p>
	  * @param : ClcInfReserchVo
	 * @return
	  */
	public int insertClcInfReserch(ClcInfReserchVo clcInfReserchVo) {
		return insert("ClcinfReserch.insertClcInfReserch", clcInfReserchVo);
	}

	/**
	  * @Method Name : selectDetailClcInfReserch
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	연구정보 상세검색
	  *  </p>
	  * @param :
	  * @return :
	  */
	public ClcInfReserchVo selectDetailClcInfReserch(ClcInfReserchVo clcInfReserchVo) {
		return selectOne("ClcinfReserch.selectDetailClcInfReserch", clcInfReserchVo);
	}

	/**
	  * @Method Name : selectDataAplcNo
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 키 검색
	  *  </p>
	  * @param :
	  * @return :
	  */
	public String selectDataAplcNo(ClcInfReserchVo clcInfReserchVo) {
		return selectOne("ClcinfReserch.selectDataAplcNo", clcInfReserchVo);
	}

	/**
	  * @Method Name : updateClcInfReserch
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 연구정보 수정
	  *  </p>
	  * @param :
	  * @return :
	  */
	public void updateClcInfReserch(ClcInfReserchVo clcInfReserchVo) {
		update("ClcinfReserch.updateClcInfReserch", clcInfReserchVo);
	}

	/**
	  * @Method Name : updateClcInfReserch
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 연구정보 수정
	  *  </p>
	  * @param :
	  * @return :
	  */
	public void updateClcInfReserch01(ClcInfReserchVo clcInfReserchVo) {
		update("ClcinfReserch.updateClcInfReserch01", clcInfReserchVo);

	}

	/**
	  * @Method Name : selectClcInfRsp
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 연구자 정보 검색
	  *  </p>
	  * @param :
	  * @return :
	  */
	public List<ClcInfRspVo> selectClcInfRsp(ClcInfRspVo clcInfRspVo) {
		return selectList("ClcinfReserch.selectClcInfRsp", clcInfRspVo);
	}

	/**
	  * @Method Name : getPrtiList
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	참여기관 리스트
	  *  </p>
	  * @param :
	  * @return :
	  */
	public List<Map<String, String>> getPrtiList(String instClsSpcd) {
		return selectList("ClcinfReserch.getPrtiList", instClsSpcd);
	}

	/**
	  * @Method Name : selectUserPopUp
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	사용자 검색 팝업 사용자 검색
	  *  </p>
	  * @param :
	  * @return :
	  */
	public List<LoginVO> selectUserPopUp(LoginVO schLoginVO) {
		return selectList("ClcinfReserch.selectUserPopUp", schLoginVO);
	}

	/**
	  * @Method Name : deleteClcInfRsp
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 연구자 정보 삭제
	  *  </p>
	  * @param :
	  * @return :
	  */
	public void deleteClcInfRsp(ClcInfRspVo clcInfRspVo) {
		delete("ClcinfReserch.deleteClcInfRsp", clcInfRspVo);

	}

	/**
	  * @Method Name : insertClcInfRsp
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 연구자 정보 등록
	  *  </p>
	  * @param :
	  * @return :
	  */
	public void insertClcInfRsp(ClcInfRspVo clcInfRspVo) {
		insert("ClcinfReserch.insertClcInfRsp", clcInfRspVo);

	}

	/**
	  * @Method Name : updateClcInfRsp
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 연구자 정보 수정
	  *  </p>
	  * @param :
	  * @return :
	  */
	public void updateClcInfRsp(ClcInfRspVo clcInfRspVo) {
		update("ClcinfReserch.updateClcInfRsp", clcInfRspVo);
	}

	/**
	  * @Method Name : deleteTmpDataAplcDts
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 엑셀 템프 테이블 삭제
	  *  </p>
	  * @param :
	  * @return :
	  */
	public void deleteTmpDataAplcDts(Map parma) {
		delete("ClcinfReserch.deleteTmpDataAplcDts", parma);
	}

	/**
	  * @Method Name : changeClcinfStep
	  * @작성일 : 2023. 3. 14.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 단계수정
	  *  </p>
	  * @param :
	  * @return :
	  */
	public void changeClcinfStep(ClcInfReserchVo clcInfReserchVo) {
		update("ClcinfReserch.changeClcinfStep", clcInfReserchVo);

	}

	/**
	  * @Method Name : selectRdrtItemList
	  * @작성일 : 2023. 4. 19.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	감면율 List
	  *  </p>
	  * @param :
	  * @return : List<Map<String, Object>>
	  */
	public List<Map<String, Object>> selectRdrtItemList() throws Exception {
		return selectList("ClcinfReserch.selectRdrtItemList");
	}

	/**
	  * @Method Name : selectDataAplcSmry
	  * @작성일 : 2023. 4. 20.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 요약 조회
	  *  </p>
	  * @param : ClcInfReserchVo clcInfReserchVo
	  * @return : ClcInfReserchVo
	  */
	public ClcInfReserchVo selectDataAplcSmry(ClcInfReserchVo clcInfReserchVo) throws Exception {
		return selectOne("ClcinfReserch.selectDataAplcSmry", clcInfReserchVo);
	}

	/**
	  * @Method Name : insertDataAplcSmryv
	  * @작성일 : 2023. 4. 20.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 신청 요약 저장
	  *  </p>
	  * @param : ClcInfReserchVo clcInfReserchVo
	  * @return :
	  */
	public void insertDataAplcSmryv(ClcInfReserchVo clcInfReserchVo) throws Exception {
		insert("ClcinfReserch.insertDataAplcSmryv",clcInfReserchVo);
	}

	/**
	  * @Method Name : insertDtapStatHst
	  * @작성일 : 2023. 4. 21.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 단계 히스토리 저장
	  *  </p>
	  * @param : Map<String,Object> map
	  * @return :
	  */
	public void insertDtapStatHst(Map<String,Object> map) throws Exception {
		insert("ClcinfReserch.insertDtapStatHst",map);
	}
}

