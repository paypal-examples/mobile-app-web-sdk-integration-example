package com.example.androidpaypalwebsdkintegrationexample;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

import com.example.androidpaypalwebsdkintegrationexample.databinding.FragmentCatalogBinding;

/**
 * This Fragment is a sample fragment to demonstrate a view to host the fully Catalog of products
 * the merchant's android app may be offering.
 */
public class CatalogFragment extends Fragment {

    private FragmentCatalogBinding binding;

    @Override
    public View onCreateView(
            LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState
    ) {

        binding = FragmentCatalogBinding.inflate(inflater, container, false);
        return binding.getRoot();
    }

    public void onViewCreated(@NonNull View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}