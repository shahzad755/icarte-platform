package icarte.armedialab.com.icarte.datamodel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import icarte.armedialab.com.icarte.domain.Item;
import icarte.armedialab.com.icarte.domain.ItemCategory;
import icarte.armedialab.com.icarte.util.Utils;

/**
 * Created by Maqsood on 5/16/2017.
 */
public class ItemDataModel implements DataModel<Item>  {

    private List<Item> model = new ArrayList<>();

    public ItemDataModel() {
    }

    public ItemDataModel(List<Item> model) {
        this.model = model;
    }

    @Override
    public Item getModelItem(int position) {
        if(model!=null)
            return position<model.size()?  model.get(position): null;
        else
            return null;
    }

    @Override
    public List getModel() {
        return model;
    }

    public void setModel(List<Item> model) {
        this.model = model;
    }
}
