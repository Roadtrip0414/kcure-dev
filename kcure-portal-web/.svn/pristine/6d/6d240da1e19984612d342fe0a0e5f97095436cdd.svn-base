package kcure.portal.cmn.tags;

import java.util.List;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import kcure.portal.cmn.tags.service.TagsService;
import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;

 /**
  * @Project : kcure-portal-web
  * @package_name  : kcure.portal.cmn.tags
  * @FileName : CodeSelectTag.java
  * @since : 2023. 2. 21. 
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 공통코드 select box 생성	
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *  수정일               수정자            수정내용
  *  ----------   --------   ---------------------------
  *  2023. 2. 21.       shpark        최초 생성
  *  </pre>
  */
public class CodeSelectTag extends RequestContextAwareTag{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3265108370188990976L;
	
	private String id;
    private String name;
    
    private String grpCd;
    private String detailCode;
    private String useYn;
    
    private String selected;
    private String defaultYn = "Y";
    private String defaultText = "전체";
    private String attributes;
    
    
        
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrpCd() {
		return grpCd;
	}
	public void setGrpCd(String grpCd) {
		this.grpCd = grpCd;
	}
	public String getDetailCode() {
		return detailCode;
	}
	public void setDetailCode(String detailCode) {
		this.detailCode = detailCode;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getSelected() {
		return selected;
	}
	public void setSelected(String selected) {
		this.selected = selected;
	}
	public String getDefaultYn() {
		return defaultYn;
	}
	public void setDefaultYn(String defaultYn) {
		this.defaultYn = defaultYn;
	}
	public String getDefaultText() {
		return defaultText;
	}
	public void setDefaultText(String defaultText) {
		this.defaultText = defaultText;
	}
	public String getAttributes() {
		return attributes;
	}
	public void setAttributes(String attributes) {
		this.attributes = attributes;
	}
	
	
	
	  //@Resource(name = "TagsService") 
	  private TagsService tagsService;
	 
	
	
	
	@Override
	protected int doStartTagInternal() throws Exception {
		
		  if (tagsService == null) { 
		  	WebApplicationContext wac = getRequestContext().getWebApplicationContext(); 
		  	this.tagsService =wac.getBean(TagsService.class); 
		  	}
	    
        List<ComCdDetailVo> commonCodeDetails = findCommonCodeDetails();
        this.pageContext.getOut().println(buildSelectTag(commonCodeDetails));
        
        return SKIP_BODY;
	}
	
	  private String buildSelectTag(List<ComCdDetailVo> commonCodeDetails) {
		  StringBuilder builder = new StringBuilder(); 
		  builder.append("<select");
		  builder.append(" id=\"").append(getId()).append("\"");
		  builder.append(" name=\"").append(getName() != null ? getName() :getId()).append("\""); 
		  if (attributes != null) {
		  builder.append(" ").append(attributes); } builder.append(">");
		  
		  if ("Y".equalsIgnoreCase(getDefaultYn())) {
			  builder.append("<option value=\"\">").append(getDefaultText()).append("</option>"); }
		  
		  if (commonCodeDetails != null) { for (ComCdDetailVo commonCodeDetail :commonCodeDetails) {
			  builder.append("<option value=\"");
			  builder.append(commonCodeDetail.getDetlCd()); builder.append("\" ");
			  if (commonCodeDetail.getDetlCd().equals(getSelected())) {
				  builder.append("selected=\"selected\"");
			  }
			  builder.append(">"); builder.append(commonCodeDetail.getDetlCdNm());
			  builder.append("</option>"); } 
		  }
		  builder.append("</select>");
		  return builder.toString(); 
	  }
	  
	  private List<ComCdDetailVo> findCommonCodeDetails() { 
		  ComCdDetailVo comCd = new ComCdDetailVo(); comCd.setGrpCd(grpCd); 
		  return tagsService.searchCommonCodeDetailList(comCd); 
	  }
}
	     