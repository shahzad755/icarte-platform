package icarte.armedialab.com.icarte.ui;


import android.app.Fragment;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.List;

import butterknife.Bind;
import butterknife.ButterKnife;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.AddressDataModel;
import icarte.armedialab.com.icarte.datamodel.DataModel;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.ui.adapter.ContactUsListViewAdapter;
import icarte.armedialab.com.icarte.ui.component.RecyclerViewDividerItemDecoration;

/**
 * A simple {@link Fragment} subclass.
 */
public class ContactUsListFragment extends Fragment {

    private static final String TAG = ContactUsListFragment.class.getName();

    @Bind(R.id.contactUsListInFragment)
    RecyclerView recyclerView;

    ContactUsListViewAdapter contactUsListViewAdapter;

    public ContactUsListFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.layout_contact_list_fragment, container, false);
        ButterKnife.bind(this, view);

        contactUsListViewAdapter = new ContactUsListViewAdapter(loadDataModel());

        recyclerView.setLayoutManager(createLayoutManager());
        recyclerView.addItemDecoration(new RecyclerViewDividerItemDecoration(getActivity()));
        recyclerView.setHasFixedSize(true);
        recyclerView.setAdapter(contactUsListViewAdapter);
        return view;
    }

    private RecyclerView.LayoutManager createLayoutManager() {
        return new LinearLayoutManager(getActivity(), LinearLayoutManager.VERTICAL, false);
    }

    private DataModel<Restaurant.Branch> loadDataModel() {

        return new AddressDataModel(
                ApplicationController.getInstance().getRestaurantInfo().getBranches());
/*
        AddressDataModel model = new AddressDataModel();
        ArrayList<Restaurant.Address> addresses = new ArrayList<>();
        Restaurant.Address address = new Restaurant.Address();
        address.addressId = 1;
        address.city = "Dubai";
        address.country = "UAE";
        address.phone1 = "0509936162";
        addresses.add(address);

        address = new Restaurant.Address();
        address.addressId = 2;
        address.city = "Abu Dhabi";
        address.country = "UAE";
        address.phone1 = "0509936154";
        addresses.add(address);

        model.setModel(addresses);
        return model;
*/

    }

}
