package icarte.armedialab.com.icarte.ui;

import android.content.Intent;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.Event;
import icarte.armedialab.com.icarte.ui.adapter.EventsListViewAdapter;
import icarte.armedialab.com.icarte.ui.component.RecyclerViewDividerItemDecoration;

public class EventListingActivity extends AppCompatActivity {

    @Bind(R.id.eventsRecyclerView) RecyclerView eventsRecyclerView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_event_listing);
        ButterKnife.bind(this);

        ((TextView)ButterKnife.findById(this, R.id.txtFeedbackTitle)).setText(R.string.title_activity_event_listing);

        eventsRecyclerView.setAdapter(new EventsListViewAdapter(loadEvents()));
        eventsRecyclerView.setLayoutManager(createLayoutManager());
        eventsRecyclerView.addItemDecoration(new RecyclerViewDividerItemDecoration(this));
        eventsRecyclerView.setHasFixedSize(true);

    }

    private List<Event> loadEvents() {
        return ApplicationController.getInstance().getRestaurantInfo().getEvents();
/*        List<Event> events = new ArrayList<>(5);
        Event event = null;
        for (int i=0; i<5; i++) {
            event = new Event(i, Calendar.getInstance().getTime(), "dubai_skyline1.png");

            events.add(event);
        }
        return events;*/
    }

    @OnClick (R.id.btnBackHome)
    void onClickNavigateToHome(View v) {
        startActivity(new Intent(getApplicationContext(), HomeActivity.class));
        finish();
    }

    private RecyclerView.LayoutManager createLayoutManager() {
        return new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false);
    }

}
