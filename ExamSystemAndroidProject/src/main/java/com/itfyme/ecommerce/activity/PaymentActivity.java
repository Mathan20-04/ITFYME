package com.itfyme.ecommerce.activity;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.cardview.widget.CardView;
import androidx.constraintlayout.widget.ConstraintLayout;

import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.transition.AutoTransition;
import android.transition.TransitionManager;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.itfyme.ecommerce.R;
import com.itfyme.ecommerce.dbservices.CategoryService;
import com.itfyme.ecommerce.dbservices.MyCartService;
import com.itfyme.ecommerce.dbservices.PaymentService;
import com.itfyme.ecommerce.dbservices.ProductDetailService;
import com.itfyme.ecommerce.helpers.LayoutUtility;
import com.itfyme.ecommerce.helpers.NetworkUtility;
import com.itfyme.ecommerce.helpers.Utility;
import com.itfyme.ecommerce.interfaces.ResponseHandler;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

public class PaymentActivity extends BaseActivity {
    String customerId,paymentType,paymentStatus,totalPrice,addressId;
    JSONArray myCartArr;
    TextView txtTotal,add1,add2,add3,state,city,pinCode,cusName,email,phone;
    RadioGroup radioGroup;
    RadioButton cod,debit,credit;
    Button continueBtn;
    JSONObject item;
    ConstraintLayout viewAddress,viewAddress1;
    Button arrowBtn,arrowBtn1;
    CardView cardView,cardView1;
    //String CustomerAddressID,CustomerID,Add1,Add2,Add3,CityID,StateID,PinCode,id="1";
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        Log.d("", "");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_payment);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);

        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setHomeAsUpIndicator(R.drawable.ic_baseline_keyboard_backspace_24);
        toolbar.setTitleTextColor(getResources().getColor(R.color.white));
        ActionBar actionBar;
        actionBar = getSupportActionBar();
        ColorDrawable colorDrawable
                = new ColorDrawable(Color.parseColor("#000000"));
        // Set BackgroundDrawable
        actionBar.setBackgroundDrawable(colorDrawable);
        add1=findViewById(R.id.addr1);
        add2=findViewById(R.id.add2);
        add3=findViewById(R.id.addr3);
        state=findViewById(R.id.state);
        city=findViewById(R.id.city);
        pinCode=findViewById(R.id.pincode);
        continueBtn=findViewById(R.id.btncontinue);
        cusName=findViewById(R.id.cusID);
        email=findViewById(R.id.Email);
        phone=findViewById(R.id.phone);
        radioGroup=findViewById(R.id.group);
        cod=findViewById(R.id.cod);
        debit=findViewById(R.id.Debit);
        credit=findViewById(R.id.credit);
        txtTotal = findViewById(R.id.totalCost);
        viewAddress = findViewById(R.id.viewAddress);
        arrowBtn = findViewById(R.id.arrowBtn);
        cardView = findViewById(R.id.cardView);

        arrowBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (viewAddress.getVisibility()==View.GONE){
                    TransitionManager.beginDelayedTransition(cardView, new AutoTransition());
                    viewAddress.setVisibility(View.VISIBLE);
                    arrowBtn.setBackgroundResource(R.drawable.ic_keyboard_arrow_up_black_24dp);
                }
                else {
                    TransitionManager.beginDelayedTransition(cardView, new AutoTransition());
                    viewAddress.setVisibility(View.GONE);
                    arrowBtn.setBackgroundResource(R.drawable.ic_keyboard_arrow_down_black_24dp);
                }
            }
        });



        continueBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                orderConfirmation();
//                deleteAllCartItems();
            }
        });
        radioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                switch (checkedId){
                    case    R.id.cod:
                        paymentType="cash";
                        paymentStatus="unpaid";
                        Toast.makeText(PaymentActivity.this,"Cod Selected",Toast.LENGTH_LONG).show();
                        break;
                    case    R.id.Debit:
                        paymentType="debit";
                        paymentStatus="paid";
                        Toast.makeText(PaymentActivity.this,"Debit card Selected",Toast.LENGTH_LONG).show();
                        break;
                    case    R.id.credit:
                        paymentType="credit";
                        paymentStatus="paid";
                        Toast.makeText(PaymentActivity.this,"Credit card Selected",Toast.LENGTH_LONG).show();
                        break;

                }


            }
        });


        try {
            JSONObject userInfo = new JSONObject(getFromSharedPreference(Utility.userkey));
            Log.d("userInfo", userInfo.toString()) ;
            JSONArray addr = userInfo.optJSONArray("address") ;
            for(int i = 0;i  < addr.length();i++) {
                add1.setText(addr.getJSONObject(i).optString("Add1"));
                add2.setText(addr.getJSONObject(i).optString("Add2"));
                add3.setText(addr.getJSONObject(i).optString("Add3"));
                state.setText(addr.getJSONObject(i).optString("StateID"));
                city.setText(addr.getJSONObject(i).optString("CityID"));
                pinCode.setText(addr.getJSONObject(i).optString("PinCode"));
                addressId = addr.getJSONObject(i).optString("CustomerAddressID");
            }
            customerId = userInfo.optString("CustomerID");
            cusName.setText(userInfo.optString("Name"));
            email.setText(userInfo.optString("Email"));
            phone.setText(userInfo.optString("Phone"));
            getCartList();
        } catch (Exception exception) {
            Log.d("Exc", exception.toString()) ;
        }

    }
    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }
    public void getCartList(){
        try {
            HashMap<String, String> mapList = new HashMap<>();
            if (this.userObj != null) {
                // you have user information already available
                mapList.put("customerid",this.userObj.optString("CustomerID"));
                mapList.put("sessionid",getFromSharedPreference(Utility.sessionKey));
            } else {
                mapList.put("customerid","-1");
                mapList.put("sessionid", getFromSharedPreference(Utility.sessionKey));
            }
            new MyCartService(this).getCartList(mapList, new ResponseHandler() {
                @Override
                public void onSuccess(Object data) {
                    try {
                        JSONObject obj = new JSONObject(data.toString());
                        myCartArr = obj.getJSONArray("items");
                        Log.d("cart", myCartArr.toString());
                        showTotal();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                @Override
                public void onFail(Object data) {
                    Log.d("", "");
                }
                @Override
                public void onNoData(Object data) {
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }




    private void showTotal(){
        double total_sum=0;
        for(int i=0;i< myCartArr.length();i++){
            JSONObject obj = myCartArr.optJSONObject(i) ;
            total_sum+= obj.optInt("qty") * obj.optDouble("price");
        }

        Log.d("total" , Double.toString(total_sum));
        totalPrice = Double.toString(total_sum) ;
        txtTotal.setText(total_sum + "");
    }

    private void orderConfirmation() {
        try {
            HashMap<String, String> params = new HashMap<>();
            JSONObject postObj = new JSONObject();
            postObj.put("customerid", customerId);
            postObj.put("addressid",addressId);
            postObj.put("paymenttype", paymentType);
            postObj.put("paymentstatus", paymentStatus);
            postObj.put("totalprice",totalPrice);
            JSONArray cartItems = new JSONArray();
            for(int i=0;i< myCartArr.length();i++){
                JSONObject obj = myCartArr.optJSONObject(i) ;
                item = new JSONObject();
                item.put("productid", obj.optString("productid"));
                item.put("qty",obj.optString("qty"));
                item.put("price" , obj.optString("price"));
                cartItems.put(item) ;
            }
            postObj.put("orderitem",cartItems);
            params.put("order_json",postObj.toString());
            Log.d("param",params.toString());
            new PaymentService(this).addOrder(params, new ResponseHandler() {
                @Override
                public void onSuccess(Object data) {
                    Log.d("order",data.toString());
//                    Toast.makeText(PaymentActivity.this, "ordered successfully", Toast.LENGTH_LONG).show();
                    deleteAllCartItems();
                }

                @Override
                public void onFail(Object data) {
                    Log.d("order failure",data.toString());
                }

                @Override
                public void onNoData(Object data) {
                }
            });
        } catch(Exception e) {
            Log.d("order exception", e.toString());
            e.printStackTrace();
        }
    }
    private void deleteAllCartItems(){
        try {
            HashMap<String, String> mapList = new HashMap<>();
            JSONObject obj = new JSONObject();
            for(int i=0;i< myCartArr.length();i++) {
                JSONObject obj1 = myCartArr.optJSONObject(i);
                obj.put("cartid", obj1.optInt("cartid"));
                obj.put("productid", obj1.optString("productid"));
            }
            mapList.put("cart_json", obj.toString());
            new MyCartService(this).deleteCart(mapList, new ResponseHandler() {
                @Override
                public void onSuccess(Object data) {
                    try {
//                        Intent intent =new Intent(PaymentActivity.this,LandingPageActivity.class);
//                        startActivity(intent);
                        new MaterialAlertDialogBuilder(PaymentActivity.this)
                                .setTitle("Order Confirmation")
                                .setMessage("Are You Sure To Place The Order.")
                                .setPositiveButton("Confirm", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        Intent intent = new Intent(getApplicationContext(),LandingPageActivity.class);
                                        Toast.makeText(PaymentActivity.this, "ordered successfully", Toast.LENGTH_LONG).show();
                                        startActivity(intent);
                                    }
                                })
                                .setNegativeButton("CANCEL", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialogInterface, int i) {

                                    }
                                })
                                .show();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                @Override
                public void onFail(Object data) {
                    Log.d("", "");
                }
                @Override
                public void onNoData(Object data) {
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}