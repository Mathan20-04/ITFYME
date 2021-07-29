package com.itfyme.ecommerce.controller;

import android.app.Application;
import android.os.StrictMode;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.Volley;

public class AppController extends Application {
    public static int count=0;
    private RequestQueue mRequestQueue;

    private static AppController mInstance;
    String mStrVolleyTag = "";

    @Override
    public void onCreate() {
        super.onCreate();
        mStrVolleyTag =getApplicationContext().getClass().getSimpleName();
        mInstance = this;
        setUpMode();
    }

    public static synchronized AppController getInstance() {
        return mInstance;
    }

    public void setActivityTag(String tag) {
        mStrVolleyTag = tag;
    }

    public RequestQueue getRequestQueue() {
        if (mRequestQueue == null) {
            mRequestQueue = Volley.newRequestQueue(getApplicationContext());
        }

        return mRequestQueue;
    }

    public <T> void addToRequestQueue(Request<T> req) {
        req.setTag(mStrVolleyTag);
        getRequestQueue().add(req);
    }

    public void cancelPendingRequests(Object tag) {
        if (mRequestQueue != null) {
            mRequestQueue.cancelAll(tag);
        }
    }
    /*
    * The advantages of defining stictmode policies within your application is to force you in the development phase to make your application more well behaved within the device it is running on: avoid running IO operations on the UI thread,
    * avoids Activity leakages, and so on. When you define these in your code, you make your application crashes if the defined strict polices has been compromised, which makes you fixes the issues you've done (the not well behaved approaches,
    * like network operations on the UI thread).
    * */
    private void setUpMode() {
        try {
            StrictMode.VmPolicy.Builder builder = new StrictMode.VmPolicy.Builder();
            StrictMode.setVmPolicy(builder.build());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}