package com.example.androidpaypalwebsdkintegrationexample;

import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.browser.customtabs.CustomTabsIntent;
import androidx.fragment.app.Fragment;
import androidx.navigation.fragment.NavHostFragment;

import com.example.androidpaypalwebsdkintegrationexample.databinding.FragmentShoppingCartBinding;

/**
 * This Fragment demonstrates a sample shopping cart fragment which should be rendered after buyer
 * has added items to their cart and clicks shopping cart button.
 * This view should also render a list of selected payment methods like PayPal and link / button to
 * view full list of all available payment options.
 *
 * This example demonstrates two buttons,
 * 1. Render a PayPal Web SDK integration and Orders API using a Chrome Custom Tab
 * 2. Render a PayPal Checkout integration using Orders API.
 *
 * The buttons rendered on this page takes the buyers to a web application hosted by merchant which should
 * lists down payment methods available, e.g. PayPal.
 *
 * When the buyer clicks the PayPal button inside the Chrome Custom tab, they would be redirected
 * to PayPal.com to review and approve their payment.
 * After they approve the payment on PayPal.com, they would be taken back to the web application
 * hosted by the merchant.
 *
 * The web application needs to render a redirect button which should take the buyers back to this
 * Android App using App Links/Deep Links.
 */
public class ShoppingCartFragment extends Fragment {

    private FragmentShoppingCartBinding binding;

    @Override
    public View onCreateView(
            LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState
    ) {

        binding = FragmentShoppingCartBinding.inflate(inflater, container, false);
        return binding.getRoot();

    }

    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        Uri payPalSpbUrl = Uri.parse(getString(R.string.merchant_hosted_checkout_web_url_spb));
        Uri payPalApiCheckoutUrl = Uri.parse(getString(R.string.merchant_hosted_checkout_web_url_api));
        CustomTabsIntent customTabsIntent = new CustomTabsIntent.Builder().build();

        binding.checkoutButtonPaypalSpb.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                customTabsIntent.launchUrl(binding.getRoot().getContext(), payPalSpbUrl);
            }
        });
        binding.checkoutButtonPaypalApi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                customTabsIntent.launchUrl(binding.getRoot().getContext(), payPalApiCheckoutUrl);
            }
        });
        binding.productCatalogButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                NavHostFragment.findNavController(ShoppingCartFragment.this)
                        .navigate(R.id.action_ShoppingCartFragment_to_CatalogFragment);
            }
        });
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }
}