package icarte.armedialab.com.icarte.ui;


import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.twotoasters.jazzylistview.JazzyHelper;
import com.twotoasters.jazzylistview.recyclerview.JazzyRecyclerViewScrollListener;

import java.util.List;

import butterknife.Bind;
import butterknife.ButterKnife;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.CategoryDataModel;
import icarte.armedialab.com.icarte.domain.ItemCategory;
import icarte.armedialab.com.icarte.ui.adapter.CategoryListFragmentViewAdapter;
import icarte.armedialab.com.icarte.ui.adapter.listeners.OnCategoryClickListener;

/**
 * A simple {@link Fragment} subclass.
 */
public class CategoriesFragment extends Fragment implements AttachedToCategory {

    private CategoryListFragmentViewAdapter viewAdapter;

    @Bind(R.id.categoryListInFragment) RecyclerView recyclerView;

    private JazzyRecyclerViewScrollListener jazzyScrollListener;

    private OnCategoryClickListener listener;
    private ItemCategory category;

    public CategoriesFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.layout_fragment_categories, container, false);
        ButterKnife.bind(this, view);

        recyclerView.setLayoutManager(createLayoutManager());
        recyclerView.setHasFixedSize(true);
        jazzyScrollListener = new JazzyRecyclerViewScrollListener();
        recyclerView.addOnScrollListener(jazzyScrollListener);
        jazzyScrollListener.setTransitionEffect(JazzyHelper.GROW);

        viewAdapter = new CategoryListFragmentViewAdapter(
                new CategoryDataModel(ApplicationController.getInstance().getCarteService().getCategoryList(null)), R.layout.category_item, listener, recyclerView);
        viewAdapter.setHasStableIds(true);
        recyclerView.setAdapter(viewAdapter);

        return view;
    }

    public void scrollToCategory() {
        List<ItemCategory> categories = viewAdapter.getModel().getModel();
        int position = 0;
        int len = categories.size();
        ItemCategory cat = null;
        RecyclerView.ViewHolder viewHolder = null;

        for (int i=0; i<len; i++) {
            cat = categories.get(i);
            if(cat.equals(category)) {
                viewAdapter.setSelectedItem(i);
                recyclerView.scrollToPosition(i);
            }
        }
    }


    @Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        if(activity instanceof OnCategoryClickListener) {
            listener = (OnCategoryClickListener) activity;
        } else {
            throw new ClassCastException(activity.toString()
                    + " must implement CategoriesFragment.OnCategorySelectedListener");
        }
    }

    private RecyclerView.LayoutManager createLayoutManager() {
            return new LinearLayoutManager(getActivity(), LinearLayoutManager.VERTICAL, false);
    }

    @Override
    public void setCategory(ItemCategory category) {
        this.category = category;
        scrollToCategory();
    }
}
