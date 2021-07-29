package com.itfyme.ecommerce.helpers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class NetworkUtility {
    public static String Base_URL="http://examsystem.itfyme.com/api/main/";
    public static String numOfRecords = "10";

    public static Boolean isValidJSONArr(String str) {
        try {
            new JSONArray(str);
        } catch (JSONException e) {

            return false;
        }
        return true;
    }

    public static Boolean isValidJSONObject(String str) {
        try {
            new JSONObject(str);
        } catch (JSONException e) {

            return false;
        }
        return true;
    }

    public static JSONArray mergeArray(JSONArray mainArr, JSONArray respArr) {
        try {
            for(int i=0;i<respArr.length();i++){
                mainArr.put(respArr.optJSONObject(i));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mainArr;
    }
    public static int getTotalNoPages(JSONObject jsonObject) {
        int total = 0;
        try {
            JSONObject pageObj = jsonObject.optJSONObject("pages");
            String strPage = pageObj.optString("total_pages", "0");
            total = Integer.parseInt(strPage);
        } catch ( Exception e) {

        }

        return total;
    }

}
