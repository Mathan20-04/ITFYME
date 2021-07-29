package com.itfyme.ecommerce.activity;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.itfyme.ecommerce.R;
import com.itfyme.ecommerce.controller.AppController;
import com.itfyme.ecommerce.dbservices.LoginService;
import com.itfyme.ecommerce.dbservices.MyCartService;
import com.itfyme.ecommerce.helpers.LayoutUtility;
import com.itfyme.ecommerce.helpers.Utility;
import com.itfyme.ecommerce.interfaces.ResponseHandler;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;

/*
    This is a base activity which takes care of :
    1. Handling SharedPreferences (get and store)
    2. Exposes methods to check if user is returning or new user
    3. If returning and userInformation is available do the autologin
 */
public class BaseActivity extends AppCompatActivity {
    String mActivityName="";

    public static int count=0;
    static JSONObject userObj  = null ; // used across the application
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        try {
            super.onCreate(savedInstanceState);

            mActivityName = this.getLocalClassName();
            AppController.getInstance().setActivityTag(mActivityName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void onStop() {
        try {
            super.onStop();
            AppController.getInstance().cancelPendingRequests(mActivityName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void onSaveInstanceState(@NonNull Bundle outState) {
        try {
            super.onSaveInstanceState(outState);
            outState.clear();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

    @Override
    public void onBackPressed() {
        try {
            Intent intent = new Intent();
            setResult(AppCompatActivity.RESULT_CANCELED, intent);
            finish();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public  String getDeviceID() {
        return Settings.Secure.getString(getContentResolver(),Settings.Secure.ANDROID_ID);
    }

    public  void storeInSharedPreference(String key, String val) {
        SharedPreferences sharedPreferences = getSharedPreferences(Utility.AppName, MODE_PRIVATE);
        SharedPreferences.Editor myEdit = sharedPreferences.edit();
        // write all the data entered by the user in SharedPreference and apply
        myEdit.putString(key, val);
        myEdit.apply();
    }

    public  String getFromSharedPreference(String key) {
        SharedPreferences sh = getSharedPreferences(Utility.AppName, MODE_PRIVATE);
        return sh.getString(key, "");
    }

    public void doAutoLogin() {
        // if shared preference has user info
        String userName = "" ;
        String pwd = "" ;
        String userInfo = getFromSharedPreference(Utility.userkey);
        String sessionID = getFromSharedPreference(Utility.sessionKey);
        Log.d(Utility.userkey,userInfo);
        if (!userInfo.equals("")) {
            // do login auto
            try {
                userObj = new JSONObject(userInfo) ; ;
                userName = userObj.optString("userid") ;
                pwd = userObj.optString("pwd") ;
            }catch (Exception e) {
//                    Log.d("Exception!", e.toString()) ;
                e.printStackTrace();
            }
            HashMap<String, String> params = new HashMap<>();
            params.put("session_id", sessionID);
            params.put("phone_num", userName);
            params.put("password", pwd);
            new LoginService(this).customer(params,new ResponseHandler() {
                @Override
                public void onSuccess(Object data) {
                    try {
                        Log.d("", data.toString());
                        // store this in the shared preference
                        storeInSharedPreference(Utility.userkey, data.toString());
                        userObj = new JSONObject(data.toString());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                @Override
                public void onFail(Object data) {
                    Log.d("fail","logging") ;
                }

                @Override
                public void onNoData(Object data) {
                }
            });
        }
    }

    public void setCartArr(JSONArray arr){
        storeInSharedPreference("cart", arr.toString());
    }

    public void setCount(TextView cartCount) {
        cartCount.setText(getCartCount());
    }

    public String getCartCount() {
        String cart = getFromSharedPreference("cart");
        try {
            JSONArray arr = new JSONArray(cart) ;
            count = arr.length();
            Log.d("Cart Length", Integer.toString(count));
            return Integer.toString(count) ;

        } catch (Exception e) {
            Log.d("Exception",e.toString());
        }
        return "0";
    }

    public void addCart(JSONObject item){
        String cart = getFromSharedPreference("cart");
        try {
            JSONArray arr = new JSONArray(cart) ;
            arr.put(item);
            storeInSharedPreference("cart", arr.toString());
        } catch (Exception e) {
            Log.d("Exception",e.toString());
        }
    }
    public void cartDelete(int i) {
        String cart = getFromSharedPreference("cart");
        try {
            JSONArray arr = new JSONArray(cart) ;
            arr.remove(i);
            storeInSharedPreference("cart", arr.toString());
        } catch (Exception e) {
            Log.d("Exception",e.toString());
        }
    }
}