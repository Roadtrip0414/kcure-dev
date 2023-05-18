package kcure.portal.cmn.iim.service.impl;

public class OpenApiConstants {

	public static final String SERVICE_KEY = "Authorization";
	public static final String SERVICE_VALUE = "Infuser E5EVKcbSNUeHzqQWxlVJnlRz9dQ8Tdw0s0T5LCxJkXT0YGVgpvtA4jQMo3NMIrXWHLF0VIFFEVrayNyaoCeujA==";

    public static final String BASE_URL = "https://api.odcloud.kr/api";
    public static final String MEDIA_TYPE = "application/json; charset=utf-8";


    public class API {
    	//파일 데이터 리스트
        public static final String URI_FILE_DATA_LIST = "/15077093/v1/file-data-list";
        //오픈 API 리스트
        public static final String URI_OPEN_DATA_LIST = "/15077093/v1/open-data-list";
        //데이터셋 리스트
        public static final String URI_DATASET = "/15077093/v1/dataset";
        //표준데이터셋 리스트
        public static final String URI_STANDARD_DATA_LIST= "/15077093/v1/standard-data-list";
    }
}
