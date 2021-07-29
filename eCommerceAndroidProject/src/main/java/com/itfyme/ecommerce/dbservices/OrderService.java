package com.itfyme.ecommerce.dbservices;

import android.content.Context;

import com.itfyme.ecommerce.interfaces.ResponseHandler;
import com.itfyme.ecommerce.network.VolleyNetworkManager;

import java.util.HashMap;

public class OrderService {
    Context mContext;
    private String getListByPageURL ="order/get-list-object-page";
    public OrderService(Context context) {
        mContext = context;

    }
    public void getOrderList(HashMap<String, String> params, ResponseHandler responseHandler) {
        new VolleyNetworkManager(mContext).getRequest(getListByPageURL, params, new ResponseHandler() {
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
}
