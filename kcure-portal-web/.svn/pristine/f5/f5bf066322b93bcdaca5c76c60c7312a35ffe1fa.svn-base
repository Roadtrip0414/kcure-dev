package kcure.portal.cmn.api.cmm;


/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.api.cmm
 * @FileName : ResultAuthVo.java
 * @since : 2023. 2. 15.
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
public class ResultAuthVo<T>{
	
	private Integer httpStatus = 200;
	private String successYn = "Y";
	private String errorMsg = "";
	private T result = null;


	public Integer getHttpStatus() {
		return httpStatus;
	}

	public void setHttpStatus(Integer httpStatus) {
		this.httpStatus = httpStatus;
	}

	public String getSuccessYn() {
		return successYn;
	}

	public void setSuccessYn(String successYn) {
		this.successYn = successYn;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public T getResult() {
		return result;
	}

	public void setResult(T result) {
		this.result = result;
	}
	
	public ResultAuthVo(T result, String successYn) {
	    this.result = result;
	    this.successYn = successYn;
	}

	public ResultAuthVo(String successYn, Exception ex)
	{
	    this.successYn = successYn;
	    this.errorMsg = ex.toString();
	 }

}
