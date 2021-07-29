package com.itfyme.ecommerce.activity;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.MenuItemCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.TextView;
import android.widget.Toast;

import com.itfyme.ecommerce.R;
import com.itfyme.ecommerce.dbservices.ProductListService;
import com.itfyme.ecommerce.dbservices.SearchService;
import com.itfyme.ecommerce.helpers.LayoutUtility;
import com.itfyme.ecommerce.helpers.NetworkUtility;
import com.itfyme.ecommerce.interfaces.ResponseHandler;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class SearchActivity extends BaseActivity {
    RecyclerView recyclerView;
    TextView textView;
    JSONArray searchArr;
    GridView gridView;
    String searchValue="";
    private int pageNum=0;
    private String totalRec = "";
    private TextView txtTotalRec;
    SearchActivity.SearchAdapter searchAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_search);

        // initialise ListView with id
        recyclerView=findViewById(R.id.searchList);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);
//        getSupportActionBar().setHomeAsUpIndicator(R.drawable.ic_baseline_keyboard_backspace_24);
        toolbar.setTitleTextColor(getResources().getColor(R.color.black));
        ActionBar actionBar;
        actionBar = getSupportActionBar();
        ColorDrawable colorDrawable = new ColorDrawable(Color.parseColor("#ffffff"));
        // Set BackgroundDrawable
        actionBar.setBackgroundDrawable(colorDrawable);
        initDataSet();
        initListView();
    }

    private void initDataSet(){
        searchArr = new JSONArray();
        pageNum = 1;
    }
    //recycleView
    private void initListView(){
        try {
            searchAdapter = new SearchActivity.SearchAdapter(searchArr);
            recyclerView.setHasFixedSize(true);
            LinearLayoutManager manager = new LinearLayoutManager(this, RecyclerView.VERTICAL, false);
            recyclerView.setLayoutManager(manager);
            recyclerView.setAdapter(searchAdapter);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // getting next page data
    private void getNextPage(int position) {
        try {
            if (position == searchArr.length() - 1) {
                pageNum++;
//              getSearchList();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }
    //web api
    private void getSearchList(String seartchText) {
        searchArr=new JSONArray();
        HashMap<String, String> params = new HashMap<>();
        params.put("search",seartchText);
        params.put("page_num", String.valueOf(pageNum));
        params.put("page_size", NetworkUtility.numOfRecords);
        new SearchService(this).getSearchList(params, new ResponseHandler() {
            @Override
            public void onSuccess(Object data) {
                try {
                    JSONObject obj = new JSONObject(data.toString());
//                    JSONObject pageObj = obj.optJSONObject("pages");
                    JSONArray arr = obj.optJSONArray("data");
                    searchArr = NetworkUtility.mergeArray(searchArr, arr);

                    showListView();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            @Override
            public void onFail(Object data) {
                searchArr=new JSONArray();
                showListView();
            }
            @Override
            public void onNoData(Object data) {
            searchArr=new JSONArray();
            showListView();
            }
        });
//
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu)
    {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu, menu);
        MenuItem searchViewItem = menu.findItem(R.id.search_bar);
        SearchView searchView = (SearchView) MenuItemCompat.getActionView(searchViewItem);
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
                    @Override
                    public boolean onQueryTextSubmit(String query) {
                        getSearchList(query);

                        return false;
                    }
                    @Override
                    public boolean onQueryTextChange(String newText) {
                        getSearchList(newText);
                        return false;
                    }
                });
        return super.onCreateOptionsMenu(menu);
    }
    private void showListView() {
        try {
            searchAdapter.setData(searchArr);
            searchAdapter.notifyDataSetChanged();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private class SearchAdapter extends RecyclerView.Adapter<SearchActivity.SearchAdapter.ViewHolder> {
        private JSONArray dataSource;
        public SearchAdapter(JSONArray listdata) {
            this.dataSource = listdata;
        }
        public void setData(JSONArray listdata) {
            this.dataSource = listdata;
        }
        @Override
        public SearchActivity.SearchAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
            View listItem = layoutInflater.inflate(R.layout.template_search, parent, false);
            SearchActivity.SearchAdapter.ViewHolder
                    viewHolder = new SearchActivity.SearchAdapter.ViewHolder(listItem);
            return viewHolder;
        }
        @Override
        public void onBindViewHolder(SearchActivity.SearchAdapter.ViewHolder holder, int position) {
            try {
                JSONObject obj = dataSource.optJSONObject(position);
                String name=obj.optString("Name");
                String price=obj.optString("Price");
                String imageURL=obj.optString("ImageURL");
                holder.txtName.setText(name);
                holder.txtPrice.setText(price);
                LayoutUtility.setImageByUrl(SearchActivity.this,holder.imgImage,imageURL);
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
            public TextView     txtName, txtPrice;
            public ImageView    imgImage;
            public LinearLayout linearLayout;

            public ViewHolder(View itemView) {
                super(itemView);
                this.txtName  = (TextView)     itemView.findViewById(R.id.txtCategoryName);
                this.txtPrice = (TextView)     itemView.findViewById(R.id.txtCategoryPrice);
                this.imgImage = (ImageView)    itemView.findViewById(R.id.imgCategoryImage);
                linearLayout  = (LinearLayout) itemView.findViewById(R.id.searchLayout);
            }
        }
    }

}