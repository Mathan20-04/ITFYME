package com.itfyme.ecommerce.activity;

import androidx.annotation.Nullable;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.google.android.material.navigation.NavigationView;
import com.itfyme.ecommerce.R;
import com.itfyme.ecommerce.controller.AppController;
import com.itfyme.ecommerce.dbservices.MyCartService;
import com.itfyme.ecommerce.dbservices.ProductListService;
import com.itfyme.ecommerce.helpers.LayoutUtility;
import com.itfyme.ecommerce.helpers.NetworkUtility;
import com.itfyme.ecommerce.helpers.Utility;
import com.itfyme.ecommerce.interfaces.ResponseHandler;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;


public class ProductListActivity extends BaseActivity {
    RecyclerView recyclerView;
    TextView textView;
    JSONArray productArr;
    private int pageNum=0;
    private String totalRec = "";
    private TextView txtTotalRec;
    RelativeLayout cartLayout,searchLayout;
    ProductAdapter productAdapter;
    String subCategoryId;
    TextView numCount;
    @Override
    protected void onCreate(Bundle savedInstanceProduct) {
        try {
            super.onCreate(savedInstanceProduct);
            setContentView(R.layout.activity_product_list);
            recyclerView = (RecyclerView) findViewById(R.id.productlist);
            textView = (TextView) findViewById(R.id.txt);
            Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
            cartLayout=toolbar.findViewById(R.id.cartLayout);
            searchLayout=toolbar.findViewById(R.id.searchLayout);
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

            cartLayout.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent intent =new Intent(ProductListActivity.this,MyCartActivity.class);

                    startActivity(intent);
                }
            });
            searchLayout.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent intent =new Intent(ProductListActivity.this,SearchActivity.class);
                    startActivity(intent);
                }
            });
            if(getIntent().hasExtra("subCategoryObj")){
               String str = getIntent().getStringExtra("subCategoryObj");
                JSONObject dataObj= new JSONObject(str);
                subCategoryId=dataObj.optString("SubCategoryID");
            }

//            numCount=findViewById(R.id.count);
            initDataSet();
            initListView();
            getProductList();
            numCount=findViewById(R.id.count);
            setCount(numCount);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }

    private void showListView() {
        try {
            productAdapter.setData(productArr);
            productAdapter.notifyDataSetChanged();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    public void onResume(){
        super.onResume();
        numCount.setText(getCartCount());
    }
    private void getProductList() {
        HashMap<String, String> params = new HashMap<>();
        params.put("sub_cat_id", String.valueOf(subCategoryId));
        params.put("page_num", String.valueOf(pageNum));
        params.put("page_size", NetworkUtility.numOfRecords);
        new ProductListService(this).getProductList(params, new ResponseHandler() {
            @Override
            public void onSuccess(Object data) {
                try {
                    JSONObject obj = new JSONObject(data.toString());
                    JSONObject pageObj = obj.optJSONObject("pages");
                    totalRec = pageObj.optString("Total");
//                    txtTotalRec.setText("Total Records: " + totalRec);
                    JSONArray arr = obj.optJSONArray("data");
                    productArr = NetworkUtility.mergeArray(productArr, arr);
                    showListView();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            @Override
            public void onFail(Object data) {

            }

            @Override
            public void onNoData(Object data) {

            }
        });
//
    }


    private void initDataSet(){
        productArr = new JSONArray();
        pageNum = 1;
    }
    private void initListView(){
        try {
            productAdapter = new ProductAdapter(productArr);
            recyclerView.setHasFixedSize(true);
            LinearLayoutManager manager = new LinearLayoutManager(this, RecyclerView.VERTICAL, false);
            recyclerView.setLayoutManager(manager);
            recyclerView.setAdapter(productAdapter);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // getting next page data
    private void getNextPage(int position) {
        try {
            if (position == productArr.length() - 1) {
                pageNum++;
                getProductList();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public void getCartList() {
//        try {
//            HashMap<String, String> mapList = new HashMap<>();
//            if (this.userObj != null) {
//                // you have user information already available
//                mapList.put("customerid",this.userObj.optString("CustomerID"));
//                mapList.put("sessionid",getFromSharedPreference(Utility.sessionKey));
//            } else {
//                mapList.put("customerid","-1");
//                mapList.put("sessionid",getFromSharedPreference(Utility.sessionKey));
//            }
//            new MyCartService(this).getCartList(mapList, new ResponseHandler() {
//                @Override
//                public void onSuccess(Object data) {
//                    try {
//                        myCartArr=new JSONArray();
//                        JSONObject obj = new JSONObject(data.toString());
//                        myCartArr = obj.optJSONArray("items");
//                        count = myCartArr.length();
//                        numCount.setText(String.valueOf(count));
//                    }catch(Exception e){
//                        e.printStackTrace();
//                    }
//                }
//                @Override
//                public void onFail(Object data) {
//                    Log.d("", "");
//                }
//                @Override
//                public void onNoData(Object data) {
//                    Log.d("", "");
//                }
//            });
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    //getting result back after add and refreshing the list
    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        try {
            if (requestCode == 1 && resultCode == Activity.RESULT_OK) {
                initDataSet();
                getProductList();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    // adapter class
    private class ProductAdapter extends RecyclerView.Adapter<ProductListActivity.ProductAdapter.ViewHolder> {
        private JSONArray dataSource;

        public ProductAdapter(JSONArray listdata) {
            this.dataSource = listdata;
        }
        public void setData(JSONArray listdata) {
            this.dataSource = listdata;
        }
        @Override
        public ProductListActivity.ProductAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
            View listItem = layoutInflater.inflate(R.layout.template_product_list, parent, false);
            ProductListActivity.ProductAdapter.ViewHolder viewHolder = new ProductListActivity.ProductAdapter.ViewHolder(listItem);
            return viewHolder;
        }

        @Override
        public void onBindViewHolder(ProductListActivity.ProductAdapter.ViewHolder holder, int position) {
            try {

                JSONObject obj = dataSource.optJSONObject(position);
                String name=obj.optString("Name");
                String price=obj.optString("Price");
                String imageURL=obj.optString("ImageURL");
                holder.txtName.setText(name);
                holder.txtPrice.setText(price);
                LayoutUtility.setImageByUrl(ProductListActivity.this,holder.imgImage,imageURL);
                holder.linearLayout.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        Intent intent = new Intent(getApplicationContext(),ProductDetailActivity.class);
                        intent.putExtra("product",obj.toString());
                        Log.d("",obj.toString());
                        startActivity(intent);
                    }
                });
                getNextPage(position);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        @Override
        public int getItemCount() {
            return dataSource.length();
        }


        private class ViewHolder extends RecyclerView.ViewHolder {
            public TextView txtName, txtPrice;
            public ImageView imgImage;
            public LinearLayout linearLayout;

            public ViewHolder(View itemView) {
                super(itemView);
                this.txtName = (TextView) itemView.findViewById(R.id.txtProductName);
                this.txtPrice = (TextView) itemView.findViewById(R.id.txtProductPrice);
                this.imgImage = (ImageView) itemView.findViewById(R.id.imgProductimage);
                linearLayout = (LinearLayout) itemView.findViewById(R.id.productlay);
            }
        }
    }
}