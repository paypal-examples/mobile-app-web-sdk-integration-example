package com.example.androidpaypalwebsdkintegrationexample;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

import com.example.androidpaypalwebsdkintegrationexample.databinding.ActivityOnPaymentCompletionBinding;

import org.json.JSONObject;

/**
 * This is a sample activity which demonstrates an example payment success activity page.
 * This Activity should be invoked after the buyer has reviewed and approved their payment
 * on web application hosted by merchant.
 * The web application should use payment methods like PayPal, Braintree to collect payments from buyer
 */
public class OnPaymentCompletionActivity extends AppCompatActivity {
    private ActivityOnPaymentCompletionBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_on_payment_completion);
        binding = ActivityOnPaymentCompletionBinding.inflate(getLayoutInflater());
        // get can also get the appLinkIntent using getIntent() to retrieve any associated data
    }

    @Override
    protected void onStart() {
        super.onStart();
        Uri uri = getIntent().getData();
        String payPalOrderID = null;

        if (uri != null) {
            payPalOrderID = uri.getQueryParameter("payPalOrderID");
            Log.i("OnPayment", "onStart payPalOrderID = " + payPalOrderID);
        } else {
            Log.i("OnPayment", "onStart No payPalOrderID Found");
        }

        TextView textView = (TextView) findViewById(R.id.payPalOrderId);
        textView.setText(payPalOrderID);

        // Fetch the PayPal Order Details from your REST APIs. The REST APIs should only exposes minimal data as required by your APP.
        // You should also capture or authorize the amounts before fulfilling the buyer order.
    }
}