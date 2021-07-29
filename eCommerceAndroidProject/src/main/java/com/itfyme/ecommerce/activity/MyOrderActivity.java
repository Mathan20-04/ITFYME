package com.itfyme.ecommerce.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.itfyme.ecommerce.R;
import com.itfyme.ecommerce.dbservices.OrderService;
import com.itfyme.ecommerce.helpers.LayoutUtility;
import com.itfyme.ecommerce.helpers.NetworkUtility;
import com.itfyme.ecommerce.interfaces.ResponseHandler;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;


public class MyOrderActivity extends BaseActivity {
    RecyclerView recyclerView;
    JSONArray orderArr;
    JSONObject dataObj;
    GridView gridView;
    private int pageNum=0;
    OrderAdapter orderAdapter;
    String customerId="";
    ImageView search;
    @Override
    protected void onCreate(Bundle savedInstanceOrder) {
        try {
            super.onCreate(savedInstanceOrder);
            setContentView(R.layout.activity_my_order);
            recyclerView = (RecyclerView) findViewById(R.id.orderlist);
            initDataSet();
            initListView();
            getOrderList();

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
            orderAdapter.setData(orderArr);
            orderAdapter.notifyDataSetChanged();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void getOrderList() {
        HashMap<String, String> params = new HashMap<>();

        params.put("customerid", String.valueOf(this.userObj.optString("CustomerID")));
        params.put("page_num", String.valueOf(pageNum));
        params.put("page_size", NetworkUtility.numOfRecords);
        new OrderService(this).getOrderList(params, new ResponseHandler() {
            @Override
            public void onSuccess(Object data) {
                try {
                    JSONObject obj = new JSONObject(data.toString());
                    JSONArray arr = obj.optJSONArray("data");
//                    JSONArray listArr = new JSONArray();
//                    for(int i=0;i<arr.length();i++){
//                        JSONObject obj1 = arr.optJSONObject(i);
//                        JSONArray itemArr = obj1.optJSONArray("items");
//                        JSONObject itemObj = itemArr.optJSONObject(0);
//                        listArr.put(itemObj);
//                    }
                    orderArr = NetworkUtility.mergeArray(orderArr, arr);
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

        orderArr = new JSONArray();

    }
    private void initListView(){
        try {
            orderAdapter = new OrderAdapter(orderArr);
            recyclerView.setHasFixedSize(true);
            LinearLayoutManager maneger = new LinearLayoutManager(this, RecyclerView.VERTICAL, false);
            recyclerView.setLayoutManager(maneger);
            recyclerView.setAdapter(orderAdapter);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    // adapter class
    private class OrderAdapter extends RecyclerView.Adapter<OrderAdapter.ViewHolder> {
        private JSONArray dataSource;

        public OrderAdapter(JSONArray listdata) {
            this.dataSource = listdata;
        }
        public void setData(JSONArray listdata) {
            this.dataSource = listdata;
        }
        @Override
        public MyOrderActivity.OrderAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
            View listItem = layoutInflater.inflate(R.layout.template_order, parent, false);
            MyOrderActivity.OrderAdapter.ViewHolder viewHolder = new ViewHolder(listItem);
            return viewHolder;

        }

        @Override
        public void onBindViewHolder(MyOrderActivity.OrderAdapter.ViewHolder holder, int position) {
            try {
                JSONObject obj = dataSource.optJSONObject(position);
                String date = obj.optString("orderdate");
                JSONArray itemArr = obj.optJSONArray("items");

                holder.childLayout.removeAllViews();
                if(itemArr!=null && itemArr.length()>0) {
                    for(int i=0;i<itemArr.length();i++) {
                        JSONObject itemObj = itemArr.optJSONObject(i);
                        View child = LayoutInflater.from(MyOrderActivity.this).inflate(R.layout.template_order_child,null);
                        holder.childLayout.addView(child);
                        TextView txtName = (TextView) child.findViewById(R.id.txtOrderName);
                        TextView txtPrice = (TextView) child.findViewById(R.id.txtOrderPrice);
                        TextView txtOrderDate = (TextView) child.findViewById(R.id.txtOrderDate);
                        TextView txtStatus = (TextView) child.findViewById(R.id.txtStatus);
                        ImageView imgImage = (ImageView) child.findViewById(R.id.imgOrderimage);
                        String name=itemObj.optString("productname");
                        String price=itemObj.optString("price");
                        String status=itemObj.optString("status");
                        String imageURL=itemObj.optString("imageurl");
                        txtName.setText(name);
                        txtPrice.setText(price);
                        txtOrderDate.setText(date);
                        txtStatus.setText(status);
                        LayoutUtility.setImageByUrl(MyOrderActivity.this,imgImage,imageURL);

                    }

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        @Override
        public int getItemCount() {

            return dataSource.length();

        }


        private class ViewHolder extends RecyclerView.ViewHolder {
            //            public TextView txtName, txtPrice,txtOrderDate,txtStatus;
//            public ImageView imgImage;
            public LinearLayout linearLayout,childLayout;

            public ViewHolder(View itemView) {
                super(itemView);
//                this.txtName = (TextView) itemView.findViewById(R.id.txtOrderName);
//                this.txtPrice = (TextView) itemView.findViewById(R.id.txtOrderPrice);
//              //  this.txtOrderDate = (TextView) itemView.findViewById(R.id.txtOrderDate);
//                this.txtStatus = (TextView) itemView.findViewById(R.id.txtStatus);
//                this.imgImage = (ImageView) itemView.findViewById(R.id.imgOrderimage);
                linearLayout = (LinearLayout) itemView.findViewById(R.id.orderlay);
                childLayout = (LinearLayout) itemView.findViewById(R.id.childLayout);
            }
        }
    }
}