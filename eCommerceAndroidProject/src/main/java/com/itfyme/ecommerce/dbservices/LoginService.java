package com.itfyme.ecommerce.dbservices;


import android.content.Context;
import android.util.Log;

import com.itfyme.ecommerce.interfaces.ResponseHandler;
import com.itfyme.ecommerce.network.VolleyNetworkManager;

import java.util.HashMap;

public class LoginService {
    Context mContext;
    private String getListByPageURL ="MyCart/get-list-object-page";
    private String getListURL       ="MyCart/get-list";
    private String getURL           ="MyCart/get";
    private String addURL           ="cart/add";
    private String updateURL        ="MyCart/update";
    private String deleteURL        ="MyCart/delete";
    private String customerURL      ="customer/customer-authentication";


    public LoginService(Context context) {
        mContext = context;

    }
    public void customer(HashMap<String, String> params, ResponseHandler responseHandler) {
        new VolleyNetworkManager(mContext).getRequest(customerURL, params, new ResponseHandler() {
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
    public void addCart(HashMap<String, String> params, ResponseHandler responseHandler) {
        new VolleyNetworkManager(mContext).postRequest(addURL, params, new ResponseHandler() {
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
                responseHandler.onFail("Failed to add data");

            }

            @Override
            public void onNoData(Object data) {

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
    public void deleteCart(String id, ResponseHandler responseHandler) {
        HashMap<String, String> params=new HashMap<>();
        params.put("Categoryid",id);
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
                responseHandler.onFail("Failed to delete data");

            }

            @Override
            public void onNoData(Object data) {

            }
        });


    }

}