package kcure.portal.cmn.grid;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import egovframework.com.utl.fcc.service.EgovStringUtil;
import kcure.portal.cmn.util.TextUtility;


@SuppressWarnings("serial")
public class GridParameterMap implements Serializable{

	private String GRID_DATA;
	private JSONObject gridData;


	public JSONObject getGridData() {
		return gridData;
	}

	public String getGRID_DATA() {
		return GRID_DATA;
	}

	public JSONArray getCreate(){
		JSONArray array = null;
		array = (JSONArray) gridData.get(CUD.CREATE.name());
		return array;
	}

	public JSONArray getUpdate(){
		JSONArray array = null;
		array = (JSONArray) gridData.get(CUD.UPDATE.name());
		return array;
	}

	public JSONArray getDelete(){
		JSONArray array = null;
		array = (JSONArray) gridData.get(CUD.DELETE.name());
		return array;
	}

	public JSONArray getRead(){
		JSONArray array = null;
		array = (JSONArray) gridData.get(CUD.READ.name());
		return array;
	}

	public <T> T[] getCreate( Class<T> clazz) throws Exception {

		return getList(clazz,CUD.CREATE.name());
	}

	public  <T> T[]  getUpdate( Class<T> clazz) throws Exception {
		return getList(clazz,CUD.UPDATE.name());
	}

	public  <T> T[]  getDelete( Class<T> clazz) throws Exception {
		return getList(clazz,CUD.DELETE.name());
	}

	public  <T> T[]  getRead( Class<T> clazz) throws Exception {
		return getList(clazz,CUD.READ.name());
	}

	public void setGRID_DATA(String gRID_DATA) throws Exception {
		GRID_DATA = gRID_DATA;
		String parseGridData = TextUtility.getParamDecodeData(gRID_DATA) ;
		JSONParser jsonParse = new JSONParser();
		JSONObject paramObj = (JSONObject) jsonParse.parse(parseGridData);
		JSONArray arr = (JSONArray) paramObj.get("IDS");	//gridview id
		JSONObject obj = (JSONObject)paramObj.get(arr.get(0));
		gridData = obj ;
	}



	private <T> T[] getList(Class<T> clazz,String CRUD)  throws Exception {
		List<T> list = new ArrayList<T>();
		JSONArray array = (JSONArray) gridData.get(CRUD);
		addList(array, clazz, list);
		@SuppressWarnings("unchecked")
		T[] beans = (T[]) Array.newInstance(clazz, list.size());
		return list.toArray(beans);
	}

	public <T> void addList(JSONArray array, Class<T> clazz, List<T> list) throws Exception {
		for (Object o : array) {
			@SuppressWarnings("deprecation")
			T bean = clazz.newInstance();
			@SuppressWarnings("unchecked")
			Map<String, Object> map = (JSONObject) o;
			Iterator<String> names = map.keySet().iterator();
			
			while (names.hasNext()) {
				String name = names.next();
				setProperty(bean, name, EgovStringUtil.isNullToString(map.get(name)));
			}
			list.add(bean);
		}
	}


	 public static void setProperty(Object bean, String name,Object value) throws Exception {
            BeanUtils.setProperty(bean, name, value.toString());
            BeanUtils.setProperty(bean, "preNo", "test");
    }



}
