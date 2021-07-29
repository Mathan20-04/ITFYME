package com.itfyme.ecommerce.helpers;

import android.content.Context;
import android.widget.ImageView;

import com.bumptech.glide.Glide;

public class LayoutUtility {

    public static void setImageByUrl(Context context, ImageView imgView,String url){

        try {
            Glide.with(context).load(url).into(imgView);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}

