package kcure.portal.cmn.api.cmm;

import org.springframework.validation.BindingResult;

import com.fasterxml.jackson.annotation.JsonIgnore;


/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.api.cmm
 * @FileName : DataVo.java
 * @since : 2023. 2. 13.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	API 공통 VO
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일               수정자            수정내용
 *  ----------   --------   ---------------------------
 *  </pre>
 */
public class DataVo<T> {
	private Integer status = 200;
	private String message = "";
	private String error = "";
	private T data = null;
	
	public static final String OK = "ok";
	public static final String FAIL = "fail";
	
	private String resultCode = DataVo.OK;
	
	
	@JsonIgnore
	public boolean isOk() {
	    return "ok".equals(resultCode);
	}
	
	public DataVo(String resultCode, String message) {
	    this.resultCode = resultCode;
	    this.message = message;
	}
	
	public DataVo(String resultCode, String message, String error) {
	    this.resultCode = resultCode;
	    this.message = message;
	    this.error = error;
	}
	
	public DataVo(String message, BindingResult bindingResult) {
	    this.resultCode = DataVo.FAIL;
	    this.message = message;
	    this.error = bindingResult.getAllErrors().toString();
	}
	
	public DataVo(String message, Exception ex){
	    this.resultCode = DataVo.FAIL;
	    this.message = message;
	    this.error = ex.toString();
	}
	
	public DataVo(T data) {
	    this.data = data;
	}

	
	
	public Integer getStatus() {
		return status;
	}
	
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getError() {
		return error;
	}
	
	public void setError(String error) {
		this.error = error;
	}
	
	public T getData() {
		return data;
	}
	
	public void setData(T data) {
		this.data = data;
	}
	
	public String getResultCode() {
		return resultCode;
	}
	
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	
	public static String getOk() {
		return OK;
	}
	
	public static String getFail() {
		return FAIL;
	}
}
