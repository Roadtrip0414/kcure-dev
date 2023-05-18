package kcure.portal.sys.dac.rvw.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Repository;

@Repository("DacRvwDataPrvdDAO")
public class DacRvwDataPrvdDAO extends EgovComAbstractDAO { 

	/**
	  * @Method Name : selectDataPrvd
	  * @작성일 : 2023. 3. 16.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>	
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public List<DacRvwDataPrvdVo> selectDataPrvd(DacRvwDataPrvdVo dacRvwDataPrvdVo) {
		return selectList("DacRvwDataPrvd.selectDataPrvd",dacRvwDataPrvdVo);
	}

	/**
	  * @Method Name : insertDataPrvd
	  * @작성일 : 2023. 3. 16.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>	
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public void insertDataPrvd(DacRvwDataPrvdVo vo) {
		insert("DacRvwDataPrvd.insertDataPrvd",vo);
	}

	/**
	  * @Method Name : getChcekDataPrvdStat
	  * @작성일 : 2023. 3. 16.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>	
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public String getChcekDataPrvdStat(EgovMap param) {
		return selectOne("DacRvwDataPrvd.getChcekDataPrvdStat",param);
	}

	/**
	  * @Method Name : updateDataPrvd
	  * @작성일 : 2023. 3. 16.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>	
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public void updateDataPrvd(DacRvwDataPrvdVo dacRvwDataPrvdVo) {
		update("DacRvwDataPrvd.updateDataPrvd",dacRvwDataPrvdVo);
	}

	/**
	  * @Method Name : updateAplcProgStcd
	  * @작성일 : 2023. 3. 16.
	  * @작성자 : shpark
	  * @Method 설명 :
	  *  <p>	
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public void updateAplcProgStcd(DacRvwDataPrvdVo dacRvwDataPrvdVo) {
		update("DacRvwDataPrvd.updateAplcProgStcd",dacRvwDataPrvdVo);
	}

	public void updateDataPrvdStat(EgovMap param) {
		update("DacRvwDataPrvd.updateDataPrvdStat",param);
		
	}

	/**
	  * @Method Name : updateDataAplcInfo
	  * @date : 2023. 4. 28.
	  * @Method 설명 :
	  *  <p>	
	  *     심의 완료 신청테이블 업데이트 실행
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public void updateDataAplcInfo(EgovMap param) {
		update("DacRvwDataPrvd.updateDataAplcInfo",param);
		
	}

	/**
	  * @Method Name : insertExtd
	  * @date : 2023. 5. 4.
	  * @Method 설명 :
	  *  <p>	
	  *     연장신청 마스터 테이블 정보저장.
	  *  </p>
	  * @param : 
	  * @return :
	  */
	public void insertExtd(EgovMap param) {
		insert("DacRvwDataPrvd.insertExtd",param);
		
	}


}
