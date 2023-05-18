package kcure.portal.dac.clc.inf.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.LoginVO;
import kcure.portal.dac.clc.inf.service.impl.ClcInfReserchVo;
import kcure.portal.dac.clc.inf.service.impl.ClcInfRspVo;

public interface ClcInfReserchService {

	/**
	  * @Method Name : insertClcInfReserch
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	서비스 신청 - 연구정보 저장
	  *  </p>
	  * @param : ClcInfReserchVo 연구정보
	 * @return
	  */
	String insertClcInfReserch(ClcInfReserchVo clcInfReserchVo) throws Exception;

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
	ClcInfReserchVo selectDetailClcInfReserch(ClcInfReserchVo clcInfReserchVo);

	/**
	  * @Method Name : updateClcInfReserch
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  서비스 신청 - 연구정보 수정
	  *  </p>
	  * @param :
	  * @return :
	  */
	void updateClcInfReserch(ClcInfReserchVo clcInfReserchVo) throws Exception;

	/**
	  * @Method Name : selectDetailClcInfRsp
	  * @작성일 : 2023. 2. 23.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	연구자 정보 조회
	  *  </p>
	  * @param :
	  * @return :
	  */
	List<ClcInfRspVo> selectClcInfRsp(ClcInfRspVo clcInfRspVo);

	/**
	  * @Method Name : getPrtiList
	  * @작성일 : 2023. 2. 27.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	소속기관 리스트
	  *  </p>
	  * @param :
	  * @return :
	  */
	List<Map<String, String>> getPrtiList(String instClsSpcd);

	/**
	  * @Method Name : selectUserPopUp
	  * @작성일 : 2023. 2. 27.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	사용자 검색 리스트
	  *  </p>
	  * @param :
	  * @return :
	  */
	List<LoginVO> selectUserPopUp(LoginVO schLoginVO);

	/**
	  * @Method Name : saveClcInfRsp
	  * @작성일 : 2023. 2. 27.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  	연구자 정보 저장
	  *  </p>
	  * @param :
	  * @return :
	  */
	void saveClcInfRsp(ClcInfRspVo clcInfRspVo,MultipartHttpServletRequest multiRequest) throws Exception;


	/**
	  * @Method Name : deleteTmpDataAplcDts
	  * @작성일 : 2023. 3. 10.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>
	  *  서비스_데이터신청데이터셋_추가데이터 템프 테이블 삭제
	  *  </p>
	  * @param : 서비스 신청 번호
	  */
	void deleteTmpDataAplcDts(Map param) throws Exception;

	/**
	  * @Method Name : updateClcInfReserch01
	  * @작성일 : 2023. 4. 18.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	01 : 신청서류 저장
	  *  </p>
	  * @param : ClcInfReserchVo clcInfReserchVo
	  * @return :
	  */
	void updateClcInfReserch01(ClcInfReserchVo clcInfReserchVo) throws Exception;

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
	public List<Map<String, Object>> selectRdrtItemList() throws Exception;

	/**
	  * @Method Name : selectDataAplcSmry
	  * @작성일 : 2023. 4. 21.
	  * @작성자 : hjjeon
	  * @Method 설명 :
	  *  <p>
	  *  	데이터 서비스 요약 조회
	  *  </p>
	  * @param : ClcInfReserchVo clcInfReserchVo
	  * @return : ClcInfReserchVo
	  */
	public ClcInfReserchVo selectDataAplcSmry(ClcInfReserchVo clcInfReserchVo) throws Exception;
}

