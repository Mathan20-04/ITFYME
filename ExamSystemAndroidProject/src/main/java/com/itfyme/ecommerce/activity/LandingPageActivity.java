package com.itfyme.ecommerce.activity;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.google.android.material.navigation.NavigationView;
import com.itfyme.ecommerce.R;
import com.itfyme.ecommerce.controller.AppController;
import com.itfyme.ecommerce.dbservices.CategoryService;
import com.itfyme.ecommerce.dbservices.MyCartService;
import com.itfyme.ecommerce.helpers.LayoutUtility;
import com.itfyme.ecommerce.helpers.Utility;
import com.itfyme.ecommerce.interfaces.ResponseHandler;

import org.json.JSONArray;
import org.json.JSONObject;
import java.util.HashMap;

/*
        Shows Category list in a grid format
        Shows Navigation
        Facilitates search , cart
        internally, check for
        1. If the user is returning or new
        2. If returning and has user information do the autologin
 */
public class LandingPageActivity extends BaseActivity implements NavigationView.OnNavigationItemSelectedListener {
        JSONArray categoryArr;
        RecyclerView recyclerView;
        RelativeLayout cartLayout,searchLayout;
        LandingPageActivity.CategoryAdapter categoryAdapter;
        TextView deviceText,numCount;
        JSONArray myCartArr;

        @Override
        protected void onCreate(Bundle savedInstanceState) {
                try {
                        super.onCreate(savedInstanceState);
                        setContentView(R.layout.activity_landing_page);
                        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
                        setSupportActionBar(toolbar);
                        cartLayout=toolbar.findViewById(R.id.cartLayout);
                        searchLayout=toolbar.findViewById(R.id.searchLayout);
                        getSupportActionBar().setDisplayHomeAsUpEnabled(false);
                        getSupportActionBar().setDisplayShowHomeEnabled(false);
                        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
                        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
                        drawer.addDrawerListener(toggle);
                        toggle.syncState();
                        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
                        navigationView.setNavigationItemSelectedListener(this);
                        cartLayout.setOnClickListener(new View.OnClickListener() {
                                @Override
                                public void onClick(View v) {
                                        Intent intent =new Intent(LandingPageActivity.this,MyCartActivity.class);

                                        startActivity(intent);
                                }
                        });
                        searchLayout.setOnClickListener(new View.OnClickListener() {
                                @Override
                                public void onClick(View v) {
                                        Intent intent =new Intent(LandingPageActivity.this,SearchActivity.class);
                                        startActivity(intent);
                                }
                        });
                        deviceText=findViewById(R.id.deviceId);
                        numCount=findViewById(R.id.count);
                        //image slider

                        // check if returning or new user
                        if (getFromSharedPreference(Utility.sessionKey).equals("")) {
                                storeInSharedPreference(Utility.sessionKey, getDeviceID()); // new user
                                Log.d("user", "new user") ;
                        } else {
                                this.doAutoLogin(); //this is base class

                                Log.d("user", "returning user") ;
                                Log.d("user", getFromSharedPreference(Utility.userkey)) ;
                        }

                        recyclerView=findViewById(R.id.CategoryList);
                        initDataSet();
                        initGridView();
                        getMenuList();
                        getCartList();

                }catch (Exception e ){
                        e.printStackTrace();
                }
//            SharedPreferences sharedPreferences = getSharedPreferences("CartCount", MODE_PRIVATE);
//            String count  = sharedPreferences.getString("count","");
//            numCount.setText(count);
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
                                                myCartArr=new JSONArray();
                                                JSONObject obj = new JSONObject(data.toString());
                                                myCartArr = obj.optJSONArray("items");
                                                setCartArr(myCartArr);
                                                numCount.setText(getCartCount());
                                                Log.d("cart", myCartArr.toString());
//                        numCount.setText(String.valueOf(count));
                                        }catch(Exception e){
                                                e.printStackTrace();
                                        }
                                }
                                @Override
                                public void onFail(Object data) {
                                        Log.d("", "");
                                }
                                @Override
                                public void onNoData(Object data) {
                                        Log.d("", "");
                                }
                        });
                } catch (Exception e) {
                        e.printStackTrace();
                }
        }

        @Override
        public void onBackPressed() {
                DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
                if (drawer.isDrawerOpen(GravityCompat.START)) {
                        drawer.closeDrawer(GravityCompat.START);
                } else {
                        super.onBackPressed();
                }
        }

        @SuppressWarnings("StatementWithEmptyBody")
        @Override
        public boolean onNavigationItemSelected(MenuItem item) {
                // Handle navigation view item clicks here.
                int id = item.getItemId();
                if (id == R.id.nav_order) {
                        Intent intent =new Intent(LandingPageActivity.this,MyOrderActivity.class);
                        startActivity(intent);
                } else if (id == R.id.nav_account) {
                }
                DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
                drawer.closeDrawer(GravityCompat.START);
                return true;
        }
        //refresh page
        private void showListView() {
                try {

                        categoryAdapter.setData(categoryArr);
                        categoryAdapter.notifyDataSetChanged();
                } catch (Exception e) {
                        e.printStackTrace();
                }
        }
        private void getMenuList(){
                try {
                        HashMap<String,String> mapList=new HashMap<>();
                        new CategoryService(this).getMenuList(mapList, new ResponseHandler() {
                                @Override
                                public void onSuccess(Object data) {
                                        try {
                                                //converting array into json array
                                                categoryArr=new JSONArray(data.toString());
                                                showListView();
                                        }catch (Exception e){
                                                e.printStackTrace();
                                        }
                                }
                                @Override
                                public void onFail(Object data) {
                                        Log.d("","");
                                }
                                @Override
                                public void onNoData(Object data) {
                                }
                        });}catch (Exception e){
                        e.printStackTrace();
                }
        }
        // initializing data set
        private void initDataSet() {
                categoryArr = new JSONArray();
        }
        private void initGridView() {
                try {
                        categoryAdapter = new CategoryAdapter(categoryArr);
                        recyclerView.setHasFixedSize(true);
                        GridLayoutManager manager=new    GridLayoutManager(this,2);
                        recyclerView.setLayoutManager(manager);
                        recyclerView.setAdapter(categoryAdapter);
                }catch (Exception e){
                        e.printStackTrace();
                }
        }


        @Override
        public void onResume(){
           super.onResume();
           numCount.setText(getCartCount());
        }
        // adapter class
        private class CategoryAdapter extends RecyclerView.Adapter<CategoryAdapter.ViewHolder> {
                private JSONArray dataSource;
                public CategoryAdapter(JSONArray listdata) {
                        this.dataSource = listdata;
                }
                public void setData(JSONArray listdata) {
                        this.dataSource = listdata;
                }
                @Override
                public LandingPageActivity.CategoryAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
                        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
                        View listItem = layoutInflater.inflate(R.layout.template_content_main, parent, false);
                        LandingPageActivity.CategoryAdapter.ViewHolder
                                viewHolder = new ViewHolder(listItem);
                        return viewHolder;
                }
                @Override
                public void onBindViewHolder(LandingPageActivity.CategoryAdapter.ViewHolder holder, int position) {
                        try {
                                JSONObject obj = dataSource.optJSONObject(position);
//                                String name=obj.optString("Name");
                                String image=obj.optString("ImageURL");
                                LayoutUtility.setImageByUrl(LandingPageActivity.this,holder.imgImage,image);
//                                holder.txtName.setText(name);
                                holder.linearLayout.setOnClickListener(new View.OnClickListener() {
                                        @Override
                                        public void onClick(View view) {
                                                Intent intent = new Intent(getApplicationContext(),SubCategoryActivity.class);
                                                intent.putExtra("categoryObject",obj.toString());
                                                Log.d("",obj.toString());
                                                startActivity(intent);
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
                        //                        public TextView txtName;
                        public ImageView imgImage;
                        public LinearLayout linearLayout;
                        public ViewHolder(View itemView) {
                                super(itemView);
//                              this.txtName = (TextView) itemView.findViewById(R.id.txtCategoryNme);
                                this.imgImage = (ImageView) itemView.findViewById(R.id.imgCategoryImage);
                                linearLayout  = (LinearLayout) itemView.findViewById(R.id.categoryLayout);
                        }
                }
        }
}