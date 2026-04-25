package icarte.armedialab.com.icarte.datasource;

import java.util.List;
import java.util.Map;

/**
 * Created by Maqsood on 5/22/2017.
 */
public interface Datasource<T> {
    public void createOrUpdate(T object);
    public void delete(T object);
    public T delete (long id);
    public long deleteAll();
    public List<T> findAllBy(Map<String, String> keys);
    public List<T> list();
    public T find(T value);
    public void setTranslationDatasource(Datasource datasource);
}
