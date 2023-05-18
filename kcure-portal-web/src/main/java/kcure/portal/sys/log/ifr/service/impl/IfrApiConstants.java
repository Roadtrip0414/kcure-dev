package kcure.portal.sys.log.ifr.service.impl;

public class IfrApiConstants {

	public static final String IFR_API_PROJECT_ID = "sJOemt00";
    public static final String IFR_API_DOMAIN = "https://kr1-00zqieqcge.api.gov-nhncloudservice.com";
    public static final String IFR_API_MEDIA_TYPE = "application/json; charset=utf-8";


    public class API {
    	//지표조회
        public static final String URI_METRICS = "/v1/instances/{p1}/metrics/{p2}";
        //알람그룹
        public static final String URI_ALRMGROUPS_01 = "/v2/projects/{p1}/alarm-groups";
        public static final String URI_ALRMGROUPS_02 = "/v2/projects/{p1}/alarm-groups/{p2}";
        //감시설정
        public static final String URI_ALRMCONFIGS = "/v2/projects/{p1}/alarm-groups/{p2}/alarm-configs";
        //알람-인스턴스 연동
        public static final String URI_INSTANCES = "/v2/projects/{p1}/alarm-groups/{p2}/instances";
        //알람-유저그룹 연동
        public static final String URI_ALRMUSERGRPS = "/v2/projects/{p1}/alarm-groups/{p2}/user-groups";
        //사용자그룹
        public static final String URI_USERGRPS_01 = "/v2/projects/{p1}/user-groups";
        public static final String URI_USERGRPS_02 = "/v2/projects/{p1}/user-groups/{p2}";

    }
}
