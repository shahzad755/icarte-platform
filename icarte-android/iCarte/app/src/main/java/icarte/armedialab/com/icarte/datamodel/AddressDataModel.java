package icarte.armedialab.com.icarte.datamodel;

import java.util.ArrayList;
import java.util.List;

import icarte.armedialab.com.icarte.domain.Restaurant;

/**
 * Created by Maqsood on 5/16/2017.
 */
public class AddressDataModel implements DataModel<Restaurant.Branch>  {

    private List<Restaurant.Branch> model = new ArrayList<>();

    public AddressDataModel() {
    }

    public AddressDataModel(List<Restaurant.Branch> model) {
        this.model = model;
    }

    @Override
    public Restaurant.Branch getModelItem(int position) {
        if(model!=null)
            return position<model.size()?  model.get(position): null;
        else
            return null;
    }

    @Override
    public List getModel() {
        return model;
    }

    public void setModel(List<Restaurant.Branch> model) {
        this.model = model;
    }
}
