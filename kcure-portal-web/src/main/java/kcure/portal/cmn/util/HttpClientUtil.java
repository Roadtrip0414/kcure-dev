package kcure.portal.cmn.util;

import java.io.IOException;
import java.util.Map;

import com.google.gson.Gson;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class HttpClientUtil {

	/**
	  * @Method Name : post
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : post 호출
	  * @param : String
	  * @param : body
	  * @param : mediaType
	  * @return : String
	  */
    public static String post(String url, Map<String, Object> body, MediaType mediaType) {
        OkHttpClient client = new OkHttpClient();
        RequestBody requestBody = RequestBody.create(new Gson().toJson(body), mediaType);
        Request request = new Request.Builder()
                    .url(url)
                    .post(requestBody)
                    .build();
        try (Response response = client.newCall(request).execute()) {
            return response.body().string();
        } catch (IOException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }
    }

    /**
	  * @Method Name : put
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : put 호출
	  * @param : String
	  * @param : body
	  * @param : mediaType
	  * @return : String
	  */
    public static String put(String url, Map<String, String> body, MediaType mediaType) {
        OkHttpClient client = new OkHttpClient();
        RequestBody requestBody = RequestBody.create(new Gson().toJson(body), mediaType);
        Request request = new Request.Builder()
                    .url(url)
                    .put(requestBody)
                    .build();
        try (Response response = client.newCall(request).execute()) {
            return response.body().string();
        } catch (IOException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }
    }
   
    /**
	  * @Method Name : delete
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : delete 호출
	  * @param : String
	  * @return : String
	  */
    public static String delete(String url) {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                    .url(url)
                    .delete(null)
                    .build();
        try (Response response = client.newCall(request).execute()) {
        	return response.body().string();
        } catch (IOException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }
    }
    
    /**
	  * @Method Name : delete
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : delete 호출
	  * @param : String
	  * @param : body
	  * @param : mediaType
	  * @return : String
	  */
    public static String delete(String url, Map<String, Object> body, MediaType mediaType) {
        OkHttpClient client = new OkHttpClient();
        RequestBody requestBody = RequestBody.create(new Gson().toJson(body), mediaType);
        Request request = new Request.Builder()
                    .url(url)
                    .delete(requestBody)
                    .build();
        try (Response response = client.newCall(request).execute()) {
        	return response.body().string();
        } catch (IOException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }
    }
    
    /**
	  * @Method Name : get
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : get 호출
	  * @param : String
	  * @return : String
	  */
    public static String get(String url) {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                .url(url)
                .get()
                .build();
        try (Response response = client.newCall(request).execute()) {
            return response.body().string();
        } catch (IOException e) {
        	System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }
    }

    
    /**
	  * @Method Name : get
	  * @작성일 : 2023. 3. 28.
	  * @작성자 : bhs
	  * @Method 설명 : get 호출
	  * @param : String
	  * @return : String
	  */
  public static String get(String url, String keyNm, String keyVal) {
      OkHttpClient client = new OkHttpClient();
      Request request = new Request.Builder()
    		  .addHeader(keyNm,  keyVal)
              .url(url)
              .get()
              .build();
      try (Response response = client.newCall(request).execute()) {
          return response.body().string();
      } catch (IOException e) {
      	System.out.println(e.getMessage());
          throw new RuntimeException(e);
      }
  }
}
