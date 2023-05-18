package kcure.portal.cmn.api.sample.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kcure.portal.cmn.api.cmm.Constants;
import kcure.portal.cmn.api.cmm.DataVo;
import kcure.portal.cmn.api.sample.service.SampleService;
import kcure.portal.uss.umt.service.impl.UmtVO;


@RestController
@RequestMapping({Constants.API.API_PREFIX + Constants.API.API_SAMPLE})
public class SampleController {
	
	@Autowired
	private SampleService sampleSevice;
	
	
	@GetMapping(value = {"/view/{id}"}, produces = Constants.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<DataVo<UmtVO>> view(@PathVariable String id) throws Exception {		
		UmtVO result = sampleSevice.viewUser(id);	   		
	    return ResponseEntity.ok(new DataVo(result));
    }
	
	@GetMapping(value = {"/view"}, produces = Constants.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<DataVo<UmtVO>> list() throws Exception {
		List<UmtVO> result = sampleSevice.listUser();	   		
	    return ResponseEntity.ok(new DataVo(result));
    }
	 
}
