package icarte.armedialab.com.icarte.ui.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.android.volley.ui.NetworkImageViewPlus;

import java.util.Date;
import java.util.List;

import butterknife.Bind;
import butterknife.ButterKnife;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.Event;
import icarte.armedialab.com.icarte.domain.Language;
import icarte.armedialab.com.icarte.service.ServerProxy;
import icarte.armedialab.com.icarte.util.Utils;

/**
 * Created by Maqsood on 11/13/2017.
 */
public class EventsListViewAdapter extends RecyclerView.Adapter<EventsListViewAdapter.EventViewHolder> {

    List<Event> events;

    public EventsListViewAdapter(List<Event> events) {
        this.events = events;
    }

    @Override
    public EventViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View itemView = inflater.inflate(R.layout.layout_event_list_item, parent, false);
        return new EventViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(EventViewHolder holder, int position) {
        Language language = ApplicationController.getInstance().getUserLanguage();
        Event event = events.get(position);
        holder.txtDay.setText(Utils.getDateAsString(event.eventDate, Utils.DAY));
        holder.txtMonth.setText(Utils.getDateAsString(event.eventDate, Utils.MONTH));
        holder.txtYear.setText(Utils.getDateAsString(event.eventDate, Utils.YEAR));
        holder.txtEventName.setText(event.getTitle(language));
        holder.txtEventDescription.setText(event.getDescription(language));
        holder.imgEvent.setDefaultImageResId(R.drawable.bg_def_event_dubai_skyline);
        holder.imgEvent.setErrorImageResId(R.drawable.bg_def_event_dubai_skyline);
        holder.imgEvent.setImageUrl(Utils.getImagePath()
                + event.imageURL, ApplicationController.getInstance().getImageLoader());
    }

    @Override
    public int getItemCount() {
        return events!=null? events.size(): 0;
    }

    class EventViewHolder extends RecyclerView.ViewHolder {

        @Bind(R.id.txtCalDay) TextView txtDay;
        @Bind(R.id.txtCalMonth) TextView txtMonth;
        @Bind(R.id.txtCalYear) TextView txtYear;
        @Bind(R.id.txtEventName) TextView txtEventName;
        @Bind(R.id.txtEventDescription) TextView txtEventDescription;
        @Bind(R.id.imgEvent) NetworkImageViewPlus imgEvent;

        public EventViewHolder(View itemView) {
            super(itemView);
            ButterKnife.bind(this, itemView);
        }
    }
}
