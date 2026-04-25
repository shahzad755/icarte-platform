package icarte.armedialab.com.icarte.datamodel;

import java.util.Date;

import icarte.armedialab.com.icarte.domain.BaseDomain;
import icarte.armedialab.com.icarte.domain.Translation;

/**
 * Created by Maqsood on 11/13/2017.
 */
public class Event extends BaseDomain {

    public long eventId;
    public Date eventDate;
    public String imageURL;

    public Event(long eventId, Date eventDate, String imageURL) {
        this.eventId = eventId;
        this.eventDate = eventDate;
        this.imageURL = imageURL;
    }
}
