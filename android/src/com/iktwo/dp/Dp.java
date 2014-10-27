package com.iktwo.dp;

import android.util.DisplayMetrics;
import android.util.Log;

public class Dp extends org.qtproject.qt5.android.bindings.QtActivity
{
    private static final String TAG = "Dp";
    private static Dp mInstance;

    public Dp()
    {
        mInstance = this;
    }

    public static int getDpi()
    {
        Log.d(TAG, "getDpi()");
        DisplayMetrics dm = mInstance.getResources().getDisplayMetrics();
        return dm.densityDpi;
    }
}
