package com.itfyme.ecommerce.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.content.Intent;
import android.content.SharedPreferences;
import android.icu.text.Edits;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.itfyme.ecommerce.R;
import com.itfyme.ecommerce.dbservices.LoginService;
import com.itfyme.ecommerce.dbservices.MyCartService;
import com.itfyme.ecommerce.helpers.Utility;
import com.itfyme.ecommerce.interfaces.ResponseHandler;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

public class LoginActivity extends BaseActivity {
    EditText phoneEdt,passEdt;
    TextView textView;
    ImageView imageView;
    Button login,cancel;
    JSONObject dataObj;
    String phone;
    String password;
    String sessionId ;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        phoneEdt=(EditText) findViewById(R.id.edtPhone);
        passEdt=(EditText) findViewById(R.id.edtPassword);
        sessionId = getFromSharedPreference("SessionID");
        login=(Button)findViewById(R.id.btnLogin);
        cancel=(Button)findViewById(R.id.btnCancel);
        textView=findViewById(R.id.deviceId);
        imageView=(ImageView)findViewById(R.id.log);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                authenticateUser();
            }
        });
    }


    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }
    private void authenticateUser(){
        phone    = phoneEdt.getText().toString();
        password = passEdt.getText().toString();
        HashMap<String, String> params = new HashMap<>();
        params.put("session_id", String.valueOf(sessionId));
        params.put("phone_num",String.valueOf(phone));
        params.put("password",String.valueOf(password));
        new LoginService(this).customer(params,new ResponseHandler() {
            @Override
            public void onSuccess(Object data) {
                try {
                    Log.d("",data.toString());
                    // store this in the shared preference
                    storeInSharedPreference(Utility.userkey,data.toString());
                    JSONObject obj = new JSONObject(data.toString());
                    Intent intent = new Intent(getApplicationContext(), PaymentActivity.class);
                    Log.d("Login", obj.toString());
                    startActivity(intent);
                } catch (Exception e) {
                    Log.d("Exception!", e.toString()) ;
                    e.printStackTrace();
                }
            }

            @Override
            public void onFail(Object data) {
                Toast.makeText(LoginActivity.this,"user/password wrong Please try enter ",Toast.LENGTH_LONG).show();
            }

            @Override
            public void onNoData(Object data) {

            }
        });
    }
}