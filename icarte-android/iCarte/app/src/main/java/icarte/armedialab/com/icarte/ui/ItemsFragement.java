package icarte.armedialab.com.icarte.ui;


import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;

import com.android.volley.error.VolleyError;
import com.twotoasters.jazzylistview.JazzyHelper;
import com.twotoasters.jazzylistview.recyclerview.JazzyRecyclerViewScrollListener;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import butterknife.ButterKnife;
import butterknife.Bind;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.RequestWrapper;
import icarte.armedialab.com.icarte.ui.adapter.ItemListFragmentViewAdapter;
import icarte.armedialab.com.icarte.ui.adapter.listeners.OnItemClickListener;
import icarte.armedialab.com.icarte.datamodel.ItemDataModel;
import icarte.armedialab.com.icarte.domain.Item;
import icarte.armedialab.com.icarte.domain.ItemCategory;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.listeners.ResponseListener;
import icarte.armedialab.com.icarte.responses.ServerResponse;
import icarte.armedialab.com.icarte.service.ServerProxy;
import icarte.armedialab.com.icarte.util.ItemWrapper;
import icarte.armedialab.com.icarte.util.Utils;
import me.fichardu.circleprogress.CircleProgress;

/**
 * A simple {@link Fragment} subclass.
 */
public class ItemsFragement extends Fragment {

    private static final String TAG = ItemsFragement.class.getName();

    @Bind(R.id.progress)
    CircleProgress mProgressView;

    @Bind(R.id.itemListInFragment)
    RecyclerView recyclerView;

    @Bind(R.id.btnRetry)
    ImageButton btnRetry;

    @Bind(R.id.txtConnectionError)
    TextView txtConnectionError;

    private ItemListFragmentViewAdapter viewAdapter;

    public ItemsFragement() {
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.layout_fragment_items, container, false);
        ButterKnife.bind(this, view);
        recyclerView.setLayoutManager(createLayoutManager());
        recyclerView.setHasFixedSize(true);
        JazzyRecyclerViewScrollListener jazzyScrollListener = new JazzyRecyclerViewScrollListener();
        recyclerView.addOnScrollListener(jazzyScrollListener);
        jazzyScrollListener.setTransitionEffect(JazzyHelper.SLIDE_IN);

        viewAdapter = new ItemListFragmentViewAdapter(
                new ItemDataModel(), R.layout.product_item, new OnItemClickListener() {
            @Override
            public void onItemSelected(View view, Item item) {
                //Utils.showToast(getActivity(), "Item selected in ItemFragment: "+ item.getItemId());
            }
        }, getFragmentManager(), this);

        recyclerView.setAdapter(viewAdapter);

        return view;
    }

    protected void loadItems(final ItemCategory itemCategory) {
        Utils.hideErrorView(btnRetry, txtConnectionError);
        List<Item> items = itemCategory.getItems();
        if(items!=null && items.size()>0) {
            Log.d(TAG, "Items already available for the category: " + itemCategory.getItemCategoryId());
            viewAdapter.setModel(new ItemDataModel(items));
            Utils.hideErrorView(btnRetry, txtConnectionError);
            recyclerView.scrollToPosition(0);
        } else {
            Log.d(TAG, "Items not found for the category: " + itemCategory.getItemCategoryId());
            showProgressIndicator();
            Restaurant restaurant = ApplicationController.getInstance().getRestaurantInfo();

            RequestWrapper<Map<String, String>> request = new RequestWrapper<>(Utils.RequestCode.LOAD_ITEMS.getRequestCode());
            request.setDeviceSerialNum(Utils.getDeviceId(getActivity()));
            request.setRestaurantActivationKey(restaurant.getActivationKey());
            request.setRestaurantCode(restaurant.getRestaurantCode());
            request.setDeviceRegistrationCode(restaurant.getDeviceRegistrationCode());

            Map<String, String> model = new HashMap<>(1);
            model.put(Utils.KEY_SELECTED_CATEGORY, String.valueOf(itemCategory.getItemCategoryId()));
            request.setRequest(model);

            if(Utils.isNetworkAvailable(getActivity())) {
                ServerProxy.loadItems(request, new ResponseListener.ResponseProcessor<ServerResponse<ItemWrapper>>() {
                    @Override
                    public void onSuccess(ServerResponse<ItemWrapper> response) {

                        if (response.isSuccess()) {
                            Utils.hideErrorView(btnRetry, txtConnectionError);
                            if(recyclerView.getVisibility()!=View.VISIBLE)
                                recyclerView.setVisibility(View.VISIBLE);
                            List<Item> itemList = response.getModel().getItems();
                            itemCategory.setItems(itemList);
                            viewAdapter.setModel(new ItemDataModel(itemList));
                            recyclerView.scrollToPosition(0);
                        } else {
                            Utils.showToast(getActivity(), "Operation Failed...");
                        }
                        hideProgressIndicator();
                    }

                    @Override
                    public void onFault(VolleyError error) {
                        adjustViewForFault(R.string.error_no_connection, itemCategory);
                    }
                });
            } else {
                adjustViewForFault(R.string.error_no_connection, itemCategory);
            }
        }
    }

    private void adjustViewForFault(int msgResourceId, final ItemCategory itemCategory) {
        btnRetry.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                loadItems(itemCategory);
            }
        });
        hideProgressIndicator();
        txtConnectionError.setText(getResources().getString(msgResourceId));
        recyclerView.setVisibility(View.GONE);
        Utils.showErrorView(btnRetry, txtConnectionError);
    }

    private RecyclerView.LayoutManager createLayoutManager() {
        return new LinearLayoutManager(getActivity(), LinearLayoutManager.VERTICAL, false);
    }

    protected void showProgressIndicator() {
            mProgressView.setAlpha(0f);
            mProgressView.setVisibility(View.VISIBLE);
            mProgressView.startAnim();
            mProgressView.animate()
                    .alpha(1f)
                    .setDuration(getResources().getInteger(
                            android.R.integer.config_mediumAnimTime))
                    .setListener(null);
    }

    protected void hideProgressIndicator() {
        mProgressView.stopAnim();
        mProgressView.setVisibility(View.INVISIBLE);
    }
}
