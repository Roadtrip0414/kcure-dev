package egovframework.com.cmm;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;
/**
 * ImagePaginationRenderer.java 클래스
 *
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 16.   서준식       이미지 경로에 ContextPath추가
 *   2016. 6. 17.   장동한       표준프레임워크 v3.6 리뉴얼
 * </pre>
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;

	public ImagePaginationRenderer() {

	}

	public void initVariables(){

		firstPageLabel    = "<a onclick=\"{0}({1});return false; \" class=\"first_page\"></a>";
		previousPageLabel = "<a onclick=\"{0}({1});return false; \" class=\"prev\"></a>";
		
        currentPageLabel  = "<a onClick=\"return false;\" class=\"on\">{0}</a>";
        otherPageLabel    = "<a onclick=\"{0}({1});return false; \">{2}</a>";
        
        nextPageLabel    = "<a onclick=\"{0}({1});return false; \" class=\"next\"></a>";
        lastPageLabel    = "<a onclick=\"{0}({1});return false; \" class=\"last_page\"></a>";

	}



	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}
