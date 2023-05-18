package kcure.portal.cmn.tags;

import java.util.List;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import kcure.portal.cmn.tags.service.TagsService;
import kcure.portal.cmn.tags.service.impl.ComCdDetailVo;

 /**
  * @Project : kcure-portal-web
  * @package_name  : kcure.portal.cmn.tags
  * @FileName : CodeRadioTag.java
  * @since : 2023. 2. 21.
  * @version 1.0
  * @author : shpark
  * @프로그램 설명 : 공통코드 라디오 버튼 생성
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
public class CodeRadioTag extends RequestContextAwareTag{

	/**
	 *
	 */
	private static final long serialVersionUID = -3265108370188990976L;

	private String id;
    private String name;

    private String grpCd;
    private String detailCode;
    private String useYn;

    private String defaultValue;


    private String attributes;



	public String getAttributes() {
		return attributes;
	}
	public void setAttributes(String attributes) {
		this.attributes = attributes;
	}
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
	public String getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
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
        this.pageContext.getOut().println(buildRadioTag(commonCodeDetails));

        return SKIP_BODY;
	}

	  private String buildRadioTag(List<ComCdDetailVo> commonCodeDetails) {
		  StringBuilder builder = new StringBuilder();
		  builder.append("<li class=\"radio_box\">");
		  if (commonCodeDetails != null) {
			  for (ComCdDetailVo commonCodeDetail :commonCodeDetails) {
				  builder.append("<label class=\"n_radio_btn\">");
				  builder.append("<input type=\"radio\" ");
				  builder.append(" name=\"").append(getName()).append("\"");
				  if (attributes != null) {
					  builder.append(" ").append(attributes);
				  }
				  builder.append(" value=\"");
				  builder.append(commonCodeDetail.getDetlCd());
				  builder.append("\" ");
				  if (commonCodeDetail.getDetlCd().equals(getDefaultValue())) {
					  builder.append(" checked");
				  }
				  builder.append(">");
				  builder.append(" <span class=\"n_radio_mark\"></span>");
				  builder.append(" <span class=\"txt\">");
				  builder.append(commonCodeDetail.getDetlCdNm());
				  builder.append(" </span>");
				  builder.append(" </label>");
			  }
		  }
		  builder.append(" </li>");
		  return builder.toString();
	  }

	  private List<ComCdDetailVo> findCommonCodeDetails() {
		  ComCdDetailVo comCd = new ComCdDetailVo(); comCd.setGrpCd(grpCd);
		  return tagsService.searchCommonCodeDetailList(comCd);
	  }
}
