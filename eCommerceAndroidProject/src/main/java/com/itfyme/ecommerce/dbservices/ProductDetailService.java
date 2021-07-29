package com.itfyme.ecommerce.dbservices;

import android.content.Context;

import com.itfyme.ecommerce.interfaces.ResponseHandler;
import com.itfyme.ecommerce.network.VolleyNetworkManager;

import java.util.HashMap;

public class ProductDetailService {
    Context mContext;
    private String addURL           ="cart/add";
    public ProductDetailService(Context context) {
        mContext = context;

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
}