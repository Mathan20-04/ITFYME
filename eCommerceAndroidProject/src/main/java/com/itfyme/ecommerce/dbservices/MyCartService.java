package com.itfyme.ecommerce.dbservices;

import android.content.Context;

import com.itfyme.ecommerce.interfaces.ResponseHandler;
import com.itfyme.ecommerce.network.VolleyNetworkManager;

import java.util.HashMap;

public class MyCartService {
    Context mContext;
    private String getListByPageURL ="MyCart/get-list-object-page";
    private String getListURL       ="cart/get-object";
    private String getURL           ="cart/get-object";

    private String updateURL        ="cart/update-item";
    private String deleteURL        ="cart/delete-item";


    public MyCartService(Context context) {
        mContext = context;

    }
    public void getCartList(HashMap<String, String> params, ResponseHandler responseHandler) {
        new VolleyNetworkManager(mContext).getRequest(getListURL, params, new ResponseHandler() {
            @Override
            public void onSuccess(Object data) {
                try {
                    responseHandler.onSuccess(data);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            @Override
            public void onFail(Object data) {
                responseHandler.onFail("Failed to load data");

            }

            @Override
            public void onNoData(Object data) {
                responseHandler.onFail("No data available");
            }
        });


    }



    public void updateCart(HashMap<String, String> params, ResponseHandler responseHandler) {
        new VolleyNetworkManager(mContext).postRequest(updateURL, params, new ResponseHandler() {
            @Override
            public void onSuccess(Object data) {
                try {
                    responseHandler.onSuccess(data);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            @Override
            public void onFail(Object data) {
                responseHandler.onFail("Failed to update data");

            }

            @Override
            public void onNoData(Object data) {

            }
        });


    }

    public void deleteCart(HashMap<String, String> params, ResponseHandler responseHandler) {
        new VolleyNetworkManager(mContext).postRequest(deleteURL, params, new ResponseHandler() {
            @Override
            public void onSuccess(Object data) {
                try {
                    responseHandler.onSuccess(data);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            @Override
            public void onFail(Object data) {
                responseHandler.onFail("Failed to update data");

            }

            @Override
            public void onNoData(Object data) {

            }
        });


    }



}