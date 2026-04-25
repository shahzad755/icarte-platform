package icarte.armedialab.com.icarte.datamodel;

import java.util.List;

/**
 * Created by Maqsood on 5/16/2017.
 */
public interface DataModel <E>{
    public List<E> getModel();
    public E getModelItem(int position);
}
