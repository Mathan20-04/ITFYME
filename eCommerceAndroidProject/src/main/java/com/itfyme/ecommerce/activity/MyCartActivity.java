package com.itfyme.ecommerce.activity;

import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.Nullable;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.itfyme.ecommerce.R;
import com.itfyme.ecommerce.dbservices.MyCartService;
import com.itfyme.ecommerce.helpers.LayoutUtility;
import com.itfyme.ecommerce.helpers.Utility;
import com.itfyme.ecommerce.interfaces.ResponseHandler;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

/*
        Shows  list in items in the cart
        User can update, delete the items

        On next, either goes for Login or Payment Page

        get data by calling the web service by passing sessionid, customerid
 */
public class MyCartActivity extends BaseActivity {
    JSONArray mycartArr;
    TextView  textPrice, textTotal;
    ImageView delete;
    Spinner spinner;
    double tot;
    Button buttonContinue;
    RecyclerView recyclerView;
    MyCartAdapter myCartAdapter;
    RelativeLayout relative;
    LinearLayout cartEmptyLayout;
    TextView cartEmpty,clickHere,continueShop;
    ArrayList<Integer> qtyList = new ArrayList<>();

    protected void onCreate(Bundle savedInstanceState) {
        try {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_my_cart);
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

            spinner = (Spinner) findViewById(R.id.qtySpn);
            textPrice = findViewById(R.id.txtPrice);
            recyclerView = findViewById(R.id.cartList);
            cartEmptyLayout = findViewById(R.id.cartEmpty);
            textTotal = findViewById(R.id.txtTotal);
            delete = findViewById(R.id.delete);
            buttonContinue = findViewById(R.id.btncontinue);
            relative=findViewById(R.id.re);
            cartEmpty=findViewById(R.id.txtCartEmpty);
            clickHere=findViewById(R.id.txtClickHere);
            continueShop=findViewById(R.id.txtContine);
            clickHere.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent intent = new Intent(getApplicationContext(),LandingPageActivity.class);
                    startActivity(intent);
                }
            });
            buttonContinue.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // check in shared preference if user is logged in or sessionid only
                    if (getFromSharedPreference(Utility.userkey).equals("")  ) {
                        // new user
                        Log.d("Login", "new user") ;
                        Intent intent = new Intent(getApplicationContext(),LoginActivity.class);
                        startActivity(intent);

                    } else {
                        Log.d("Payment", "returning user") ;
                        Intent intent = new Intent(getApplicationContext(),PaymentActivity.class);
                        startActivity(intent);
                    }
                }
            });
            initDataSet();
            initListView();
            getCartList();
            generateItems();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }


    //spinner
    private void generateItems() {
        qtyList.add(1);
        qtyList.add(2);
        qtyList.add(3);
        qtyList.add(4);
        qtyList.add(5);
    }
    private void showListView() {
        try {
            myCartAdapter.setData(mycartArr);
            myCartAdapter.notifyDataSetChanged();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void showTotal(){
        double total_sum=0;
        for(int i=0;i< mycartArr.length();i++){
            JSONObject obj = mycartArr.optJSONObject(i) ;
            total_sum+= obj.optInt("qty") * obj.optDouble("price");
        }
        Log.d("total" , Double.toString(total_sum));
        textTotal.setText(total_sum + "");
        tot=total_sum;
    }

    private void initDataSet() {
        mycartArr = new JSONArray();
    }
    private void initListView() {
        myCartAdapter = new MyCartAdapter(mycartArr);
        recyclerView.setHasFixedSize(true);
        LinearLayoutManager maneger = new LinearLayoutManager(this, RecyclerView.VERTICAL, false);
        recyclerView.setLayoutManager(maneger);
        recyclerView.setAdapter(myCartAdapter);
    }

    public void getCartList() {
        try {
            HashMap<String, String> mapList = new HashMap<>();
            if (this.userObj != null) {
                // you have user information already available
                mapList.put("customerid",this.userObj.optString("CustomerID"));
                mapList.put("sessionid",getFromSharedPreference(Utility.sessionKey));
            } else {
                mapList.put("customerid","-1");
                mapList.put("sessionid",getFromSharedPreference(Utility.sessionKey));
            }
            new MyCartService(this).getCartList(mapList, new ResponseHandler() {
                @Override
                public void onSuccess(Object data) {
                    try {
                        JSONObject obj = new JSONObject(data.toString());
                        mycartArr = obj.optJSONArray("items");
                        if(mycartArr==null||mycartArr.length()==0){
                            relative.setVisibility(View.INVISIBLE);
                            recyclerView.setVisibility(View.GONE);
                            cartEmptyLayout.setVisibility(View.VISIBLE);
                        }else{
                            relative.setVisibility(View.VISIBLE);
                            recyclerView.setVisibility(View.VISIBLE);
                            cartEmptyLayout.setVisibility(View.GONE);
                            showListView();
                            showTotal();
                        }
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
                    try {
                        relative.setVisibility(View.INVISIBLE);
                        recyclerView.setVisibility(View.GONE);
                        cartEmptyLayout.setVisibility(View.VISIBLE);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                }
            });
        } catch (Exception e) {
            e.printStackTrace();


        }
    }



    private void updateCart(JSONObject item) {
        try {
            HashMap<String, String> params = new HashMap<>();
            JSONObject obj = new JSONObject();
            obj.put("cartitem_id", item.optInt("cartitemid"));
            obj.put("qty", item.optInt("qty"));
            params.put("cart_json", obj.toString());
            Log.d("update", obj.toString());
            new MyCartService(this).updateCart(params, new ResponseHandler() {
                @Override
                public void onSuccess(Object data) {

                    Toast.makeText(MyCartActivity.this, "Cart Update successfully", Toast.LENGTH_LONG).show();
                    Log.d("cart",data.toString());

                }
                @Override
                public void onFail(Object data) {
                    Toast.makeText(MyCartActivity.this, "Cart Update fail", Toast.LENGTH_LONG).show();
                    Log.d("cart",data.toString());
                }
                @Override
                public void onNoData(Object data) {
                    Toast.makeText(MyCartActivity.this, "Cart Update nodata", Toast.LENGTH_LONG).show();
                    Log.d("",data.toString());
                }
            });

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    private class MyCartAdapter extends RecyclerView.Adapter<MyCartAdapter.ViewHolder> {
        private JSONArray dataSource;

        public MyCartAdapter(JSONArray listdata) {
            this.dataSource = listdata;
        }
        public void setData(JSONArray listdata) {
            this.dataSource = listdata;
        }
        @Override
        public MyCartActivity.MyCartAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
            View listItem = layoutInflater.inflate(R.layout.template_my_cart, parent, false);
            MyCartActivity.MyCartAdapter.ViewHolder viewHolder = new ViewHolder(listItem);
            return viewHolder;

        }
        @Override
        public void onBindViewHolder(MyCartActivity.MyCartAdapter.ViewHolder holder, int position) {
            try {
                int total=0;
                JSONObject obj = dataSource.optJSONObject(position);
                String name = obj.optString("productname");
                String qty = obj.optString("qty");
                String price = obj.optString("price");
                String imgimage = obj.optString("imageurl");
                LayoutUtility.setImageByUrl(MyCartActivity.this, holder.imgImage, imgimage);
                holder.txtName.setText(name);
                setSpinner(holder.spn, qty);
                updatePrice(holder.txtCst, qty, price);

                holder.spn.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                    @Override
                    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                        try {
                            String selQty = (qtyList.get(i)).toString();
                            obj.put("qty", selQty);
                            updatePrice(holder.txtCst, selQty, price);
                            Log.d("qty", selQty);
                            showTotal();
                            updateCart(obj);

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    @Override
                    public void onNothingSelected(AdapterView<?> adapterView) {
                    }
                });
                holder.del.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Delete(obj) ; // ws call delete the item from the cart
                        // delete item from the array at index position
                        mycartArr.remove(position) ;
                        myCartAdapter.notifyDataSetChanged();
                        Delete(obj);
                        cartDelete(position);
                    }
                });
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        @Override
        public int getItemCount() {
            return dataSource.length();

        }
        private class ViewHolder extends RecyclerView.ViewHolder {
            public TextView txtName, txtCst;
            public ImageView imgImage;
            public Spinner spn;
            public ImageView del;
            public LinearLayout linearLayout;
            public ViewHolder(View itemView) {
                super(itemView);
                this.txtName = (TextView) itemView.findViewById(R.id.info_text);
                this.del = (ImageView) itemView.findViewById(R.id.delete);
                this.txtCst = (TextView) itemView.findViewById(R.id.txtcost);
                this.imgImage = (ImageView) itemView.findViewById(R.id.image);
                this.spn = (Spinner) itemView.findViewById(R.id.qtySpn);
                linearLayout = (LinearLayout) itemView.findViewById(R.id.cartlay);

            }
        }
    }
    public void setSpinner(Spinner spinner, String qty) {
        try {
            int iQty = Integer.parseInt(qty);
            spinner.setAdapter(new ArrayAdapter<Integer>(MyCartActivity.this,
                    android.R.layout.simple_spinner_dropdown_item, qtyList));
            spinner.setSelection(qtyList.indexOf(iQty));
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
    private void Delete(JSONObject item) {
        try {
            HashMap<String, String> mapList = new HashMap<>();
            JSONObject obj = new JSONObject();
            obj.put("cartid",item.optInt("cartid"));
            obj.put("productid",item.optInt("productid"));
            mapList.put("cart_json", obj.toString());
            new MyCartService(this).deleteCart(mapList, new ResponseHandler() {
                @Override
                public void onSuccess(Object data) {
                    try {
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

    private void updatePrice(TextView txtCst, String qty, String price) {
        int iQty = Integer.parseInt(qty);
        Float iPrice = Float.parseFloat(price);
        Float totalPrice = iQty*iPrice;
        String strPrice = totalPrice.toString();
        txtCst.setText(strPrice);
    }
}