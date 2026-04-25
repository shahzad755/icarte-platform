package icarte.armedialab.com.icarte.ui.adapter;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.DataModel;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.util.Utils;

/**
 * Created by Maqsood on 11/6/2017.
 */
public class ContactUsListViewAdapter extends RecyclerView.Adapter <ContactUsListViewAdapter.ContactUsAddressViewHolder>{

    DataModel<Restaurant.Branch> model;

    public ContactUsListViewAdapter(DataModel<Restaurant.Branch> model) {
        this.model = model;
    }

    @Override
    public ContactUsAddressViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View view = inflater.inflate(R.layout.layout_contactus_address_item, parent, false);
        return new ContactUsAddressViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ContactUsAddressViewHolder holder, int position) {
        Restaurant.Branch branch = model.getModelItem(position);
        holder.setAddress(branch);
        holder.position = position;
        holder.txtAddressTitle.setText(branch.branchName);
        if(branch.address!=null) {
            holder.txtAddress.setText(branch.address.description);
            holder.txtTel.setText(branch.address.phone1);
            holder.txtEmail.setText(branch.address.email);
            //holder.txtLocation.setText(branch.address.mapsURL);
        }
    }
    @Override
    public long getItemId(int position) {
        return getItemCount() > 0 ? model.getModelItem(position).branchId : 0;
    }

    @Override
    public int getItemCount() {
        return model!=null? model.getModel().size(): 0;
    }

    public class ContactUsAddressViewHolder extends RecyclerView.ViewHolder{
        private Restaurant.Branch branch;
        int position;

        @Bind(R.id.txtBranchName) TextView txtAddressTitle;
        @Bind(R.id.txtAddress) TextView txtAddress;
        @Bind(R.id.txtTel) TextView txtTel;
        @Bind(R.id.txtEmail) TextView txtEmail;
        @Bind(R.id.txtLocation) TextView txtLocation;

        public ContactUsAddressViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);
        }

        @OnClick(R.id.txtLocation)
        public void onClickLocationMap(View view){
            // Create a Uri from an intent string. Use the result to create an Intent.
            Uri gmmIntentUri = Uri.parse("geo:"+ branch.address.lat+", "+ branch.address.lon);

            // Create an Intent from gmmIntentUri. Set the action to ACTION_VIEW
            Intent mapIntent = new Intent(Intent.ACTION_VIEW, gmmIntentUri);
            // Make the Intent explicit by setting the Google Maps package
            mapIntent.setPackage("com.google.android.apps.maps");
            if (mapIntent.resolveActivity(view.getContext().getPackageManager()) != null) {
                // Attempt to start an activity that can handle the Intent
                view.getContext().startActivity(mapIntent);
            }
        }
        public void setAddress(Restaurant.Branch address) {
            this.branch = address;
        }
    }
}
