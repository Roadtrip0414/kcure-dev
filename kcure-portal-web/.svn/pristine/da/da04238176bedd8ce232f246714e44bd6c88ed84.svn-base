package kcure.portal.cmn.api.dsz.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kcure.portal.cmn.api.cmm.Constants;
import kcure.portal.cmn.api.cmm.ResultVo;
import kcure.portal.cmn.api.dsz.service.DszService;
import kcure.portal.cmn.api.dsz.service.impl.ResvDateVO;
import kcure.portal.cmn.api.dsz.service.impl.ResvItemVO;
import kcure.portal.cmn.api.dsz.service.impl.ResvMstVO;
import kcure.portal.cmn.api.dsz.service.impl.ResvVO;



/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.api.dsz.web
 * @FileName : DszController.java
 * @since : 2023. 2. 13.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 : 안심활용센터 API Controller
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  </pre>
 */
@RestController
@RequestMapping({Constants.API.API_PREFIX + Constants.API.API_DSZ})
public class DszController {
	
	@Autowired
	private DszService dszSevice;
	
	
	/**
     * @Method Name : dszReserve
     * @작성일 : 2023. 2. 13.
     * @작성자 : bhs
     * @Method 설명 : 안심활용센터 예약처리
     *  <p>
     *  </p>
     * @param : resvMstVO ResvMstVO
     * 		 		dszCode String
     * 				sendDate String
     * @return : ResultVo
     */
	@PostMapping(value = {"/reserve/{dszCode}/{sendDate}"}, produces = Constants.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<ResultVo> dszReserve(@PathVariable String dszCode, 
    		@PathVariable String sendDate, @RequestBody ResvMstVO resvMstVO ) throws Exception {		
		try {
				if(dszSevice.checkPrtiIdValid(dszCode) > 0) 						
				{
					for(ResvItemVO resvItemVO:resvMstVO.getList()) {		
						for(ResvDateVO resvDateVO:resvItemVO.getDates()) {
							ResvVO resvVO = new ResvVO();
							resvVO.setPrtiId(dszCode);
							resvVO.setApiRsvDt(sendDate);
							resvVO.setSeatRsvId(resvItemVO.getReserveId());
							resvVO.setRsvSeatNo(resvItemVO.getSeatNo());		
							
							for(HashMap<String,String> map:getBetweenDays(resvDateVO.getStartDate(), resvDateVO.getEndDate())) {
								resvVO.setRsvDt(map.get("date"));
								dszSevice.insertReserve(resvVO);	   
							}
						}
					}
				}else {
					throw new Exception("필수 기관코드 정보가 잘못되었습니다.");
				}
			
		}catch(Exception e) {
			return ResponseEntity.ok(new ResultVo(Constants.API.API_FAIL, e));
		}

		return ResponseEntity.ok(new ResultVo(Constants.API.API_SUCCESS));
    }
	
	
	private List<HashMap<String, String>> getBetweenDays(String fromDt, String toDt) throws ParseException {
		List<HashMap<String, String>> listMap = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> map = new HashMap<String, String>();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Date d1 = df.parse( fromDt );
		Date d2 = df.parse( toDt );

		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		c1.setTime( d1 );
		c2.setTime( d2 );

		while( c1.compareTo( c2 ) !=1 ){
			map = new HashMap<String, String>();
			map.put("date", sdf.format(c1.getTime()));
			listMap.add(map);
			c1.add(Calendar.DATE, 1);
		}
		
		return listMap;
	}

}
