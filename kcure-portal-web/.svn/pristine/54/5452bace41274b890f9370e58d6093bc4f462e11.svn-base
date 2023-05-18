package kcure.portal.cmn.iim.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import kcure.portal.cmn.iim.service.OpenApiService;
import kcure.portal.cmn.util.HttpClientUtil;
import okhttp3.HttpUrl;


/**
 * @Project : kcure-portal-web
 * @package_name        : kcure.portal.cmn.iim.service.impl
 * @FileName : OpenApiServiceImpl.java
 * @since : 2023. 3. 31.
 * @version 1.0
 * @author : bhs
 * @프로그램 설명 :	데이터 Open API serviceImpl
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일             수정자            수정내용
 *  ----------      --------   ---------------------------
 *  2023.03.31   bhs             파일생성
 *  </pre>
 */
@Service("openApiService")
public class OpenApiServiceImpl implements OpenApiService {

	@Override
	public List<FileDataVO> selectFileDataList(ReqVO reqVo) throws Exception {
		String apiUrl = OpenApiConstants.BASE_URL + OpenApiConstants.API.URI_FILE_DATA_LIST ;

		HttpUrl.Builder urlBuilder = HttpUrl.parse(apiUrl).newBuilder()
				.addQueryParameter("page", Integer.toString(reqVo.getPage()))
				.addQueryParameter("perPage", Integer.toString(reqVo.getPerPage()))
//				.addQueryParameter("cond[org_nm::LIKE]", reqVo.getOrgNm())
				.addQueryParameter("cond[list_title::LIKE]", reqVo.getListTitle());

		String result = HttpClientUtil.get(urlBuilder.toString(), OpenApiConstants.SERVICE_KEY, OpenApiConstants.SERVICE_VALUE);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;

		if(jsonObj.get("data") != null) {
			FileDataVO[] response = new Gson().fromJson(jsonObj.get("data").toString(), FileDataVO[].class);
			List<FileDataVO> list = Arrays.asList(response);
	        return list;
		}else {
			return null;
		}
	}

	@Override
	public List<OpenDataVO> selectOpenDataList(ReqVO reqVo) throws Exception {
		String apiUrl = OpenApiConstants.BASE_URL + OpenApiConstants.API.URI_OPEN_DATA_LIST ;

		HttpUrl.Builder urlBuilder = HttpUrl.parse(apiUrl).newBuilder()
				.addQueryParameter("page", Integer.toString(reqVo.getPage()))
				.addQueryParameter("perPage", Integer.toString(reqVo.getPerPage()))
//				.addQueryParameter("cond[org_nm::LIKE]", reqVo.getOrgNm())
				.addQueryParameter("cond[list_title::LIKE]", reqVo.getListTitle());

		String result = HttpClientUtil.get(urlBuilder.toString(), OpenApiConstants.SERVICE_KEY, OpenApiConstants.SERVICE_VALUE);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;

		if(jsonObj.get("data") != null) {
			OpenDataVO[] response = new Gson().fromJson(jsonObj.get("data").toString(), OpenDataVO[].class);
			List<OpenDataVO> list = Arrays.asList(response);
	        return list;
		}else {
			return null;
		}
	}

	@Override
	public List<StndDataVO> selectStndDataList(ReqVO reqVo) throws Exception {
		String apiUrl = OpenApiConstants.BASE_URL + OpenApiConstants.API.URI_STANDARD_DATA_LIST ;

		HttpUrl.Builder urlBuilder = HttpUrl.parse(apiUrl).newBuilder()
				.addQueryParameter("page", Integer.toString(reqVo.getPage()))
				.addQueryParameter("perPage", Integer.toString(reqVo.getPerPage()))
//				.addQueryParameter("cond[org_nm::LIKE]", reqVo.getOrgNm())
				.addQueryParameter("cond[list_title::LIKE]", reqVo.getListTitle());

		String result = HttpClientUtil.get(urlBuilder.toString(), OpenApiConstants.SERVICE_KEY, OpenApiConstants.SERVICE_VALUE);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse( result );
		JSONObject jsonObj = (JSONObject) obj;

		if(jsonObj.get("data") != null) {
			StndDataVO[] response = new Gson().fromJson(jsonObj.get("data").toString(), StndDataVO[].class);
			List<StndDataVO> list = Arrays.asList(response);
	        return list;
		}else {
			return null;
		}
	}

//	@Override
//	public List<DatasetVO> selectDatasetList(ReqVO reqVo) throws Exception {
//		String apiUrl = OpenApiConstants.BASE_URL + OpenApiConstants.API.URI_DATASET ;
//
//		HttpUrl.Builder urlBuilder = HttpUrl.parse(apiUrl).newBuilder()
//				.addQueryParameter("page", Integer.toString(reqVo.getPage()))
//				.addQueryParameter("perPage", Integer.toString(reqVo.getPerPage()))
//				.addQueryParameter("cond[org_nm::LIKE]", reqVo.getOrgNm())
//				.addQueryParameter("cond[title::LIKE]", reqVo.getListTitle());
//
//		String result = HttpClientUtil.get(urlBuilder.toString(), OpenApiConstants.SERVICE_KEY, OpenApiConstants.SERVICE_VALUE);
//
//		JSONParser parser = new JSONParser();
//		Object obj = parser.parse( result );
//		JSONObject jsonObj = (JSONObject) obj;
//
//		if(jsonObj.get("data") != null) {
//			DatasetVO[] response = new Gson().fromJson(jsonObj.get("data").toString(), DatasetVO[].class);
//			List<DatasetVO> list = Arrays.asList(response);
//	        return list;
//		}else {
//			return null;
//		}
//	}

	// list_id가 같으나 operation_seq가 다른 경우 있으므로 중복되면 같은 list_id 중 첫번째 목록만 표시
	private List<BaseDataVO> removeDuplicates(List<? extends BaseDataVO> list) {
		List<BaseDataVO> listNew = new ArrayList<BaseDataVO>();

		if (list.size() == 0) {
			return listNew;
		}

		BaseDataVO prev = list.get(0);
		listNew.add(prev);
		for (int i = 1; i < list.size(); i++) {
			BaseDataVO cur = list.get(i);
			if (!cur.getList_id().equals(prev.getList_id())) {
				listNew.add(cur);
			}

			prev = cur;
		}

		return listNew;
	}

	@Override
	public ComOpenVO selectComOpenDataList(ReqVO reqVo) throws Exception {
		List<FileDataVO> dataVo1 = this.selectFileDataList(reqVo);
		dataVo1 = (List<FileDataVO>)(List<?>)removeDuplicates(dataVo1);

		List<OpenDataVO> dataVo2 = this.selectOpenDataList(reqVo);
		dataVo2 = (List<OpenDataVO>)(List<?>)removeDuplicates(dataVo2);

		List<StndDataVO> dataVo3 = this.selectStndDataList(reqVo);
		dataVo3 = (List<StndDataVO>)(List<?>)removeDuplicates(dataVo3);

//		List<DatasetVO> dataVo4 = this.selectDatasetList(reqVo);

//		System.out.println("Debug>>> (size) : " + dataVo1.size());
//		System.out.println("Debug>>> (size) : " + dataVo2.size());
//		System.out.println("Debug>>> (size) : " + dataVo3.size());

		ComOpenVO resultVo = new ComOpenVO();
		resultVo.setFileDataList(dataVo1);
		resultVo.setOpenDataList(dataVo2);
		resultVo.setStndDataList(dataVo3);
//		resultVo.setDatasetList(dataVo4);

		return resultVo;
	}
}
