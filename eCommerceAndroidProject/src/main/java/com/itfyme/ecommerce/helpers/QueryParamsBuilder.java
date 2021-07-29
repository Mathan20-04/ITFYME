package com.itfyme.ecommerce.helpers;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class QueryParamsBuilder {
    public static String urlEncodeUTF8(String s) {
        try {
            return URLEncoder.encode(s, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new UnsupportedOperationException(e);
        }

    }

    public static String urlEncodeUTF8(HashMap<String, String> map) {
        StringBuilder sb = new StringBuilder();
        try {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                if (sb.length() > 0) {
                    sb.append("&");
                }
                sb.append(
                        String.format(
                                "%s=%s",
                                urlEncodeUTF8(entry.getKey().toString()),
                                urlEncodeUTF8(entry.getValue().toString())
                        )
                );

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

    public static String getQueryParameters(String url,  HashMap<String, String> map) {
        if(map.size()>0){
            String query = urlEncodeUTF8(map);
            String str = url + "?" + query;
            return str;
        }else {
            return url;
        }
    }

}
