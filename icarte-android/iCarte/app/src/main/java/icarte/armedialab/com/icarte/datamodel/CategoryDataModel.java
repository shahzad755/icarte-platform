package icarte.armedialab.com.icarte.datamodel;

import java.util.ArrayList;
import java.util.List;

import icarte.armedialab.com.icarte.domain.ItemCategory;

/**
 * Created by Maqsood on 5/16/2017.
 */
public class CategoryDataModel implements DataModel<ItemCategory>  {

    private List<ItemCategory> model = new ArrayList<>();

    public CategoryDataModel() {
    }

    public CategoryDataModel(List<ItemCategory> model) {
        this.model = model;
    }

    @Override
    public ItemCategory getModelItem(int position) {
        if(model!=null)
            return position<model.size()?  model.get(position): null;
        else
            return null;
    }

    @Override
    public List getModel() {
        return model;
    }

    public void setModel(List<ItemCategory> model) {
        this.model = model;
    }
}
