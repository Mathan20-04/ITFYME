package com.itfyme.ecommerce.network;

import android.content.Context;
import android.util.Log;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.itfyme.ecommerce.controller.AppController;
import com.itfyme.ecommerce.helpers.NetworkUtility;
import com.itfyme.ecommerce.helpers.QueryParamsBuilder;
import com.itfyme.ecommerce.interfaces.ResponseHandler;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class VolleyNetworkManager {
    Context mContext;
    private int mVolleyTimeoutMS = 500000000;
    private int mMaxRetries = 3;

    public VolleyNetworkManager(Context context) {
        this.mContext = context;
    }

    public void getRequest(String url, HashMap<String, String> params, ResponseHandler responseHandler) {
        String queryUrl = NetworkUtility.Base_URL + QueryParamsBuilder.getQueryParameters(url, params);

        try {
            StringRequest strRequest = new StringRequest(Request.Method.GET,queryUrl,
                    new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            Log.d("GET Response Volley  :", response);
                            handleResp(response, responseHandler);


                        }
                    },
                    new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError volleyError) {
                            Log.d("GET Response Error  :", volleyError.toString());
                            responseHandler.onFail(volleyError.toString());
                        }
                    }
            );
            AppController.getInstance().addToRequestQueue(strRequest);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public void postRequest(String url, HashMap<String, String> params, ResponseHandler responseHandler) {
        String queryURL = NetworkUtility.Base_URL + url;

        try {
            StringRequest stringRequest = new StringRequest(Request.Method.POST,queryURL,
                    new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            try {
                                Log.d("POST Response Volley  :", response);
                                handleResp(response, responseHandler);
                            } catch (Exception jsonExp) {
                                jsonExp.printStackTrace();
                            }
                        }
                    },
                    new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError volleyError) {
                            Log.d("POST Response Error  :", volleyError.toString());
                            responseHandler.onFail(volleyError.toString());
                        }
                    } ){
                @Override
                protected Map<String, String> getParams() {
                    // at last we are
                    // returning our params.
                    return params;
                }
            };
            AppController.getInstance().addToRequestQueue(stringRequest);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }


    public void handleResp(String str, ResponseHandler callback) {
        try {
            if (NetworkUtility.isValidJSONObject(str)) {
                JSONObject result = new JSONObject(str);
                if (result.has("response_object")) {
                    String strRespObj = result.opt("response_object").toString();
                    if (strRespObj == null || strRespObj == "" || strRespObj == "null") {
                        callback.onNoData("No Data available");
                    } else {
                        callback.onSuccess(strRespObj);
                    }

                } else {
                    callback.onSuccess(result.toString());
                }

            } else {
                callback.onFail(str);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
