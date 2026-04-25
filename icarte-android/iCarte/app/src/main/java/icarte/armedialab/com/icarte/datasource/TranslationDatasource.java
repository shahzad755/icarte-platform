package icarte.armedialab.com.icarte.datasource;

import java.util.List;
import java.util.Map;

import icarte.armedialab.com.icarte.domain.Translation;
import ru.noties.storm.DatabaseManager;

/**
 * Created by Maqsood on 5/23/2017.
 */
public class TranslationDatasource implements Datasource<Translation> {

    private DatabaseManager dbMgr;

    public TranslationDatasource(DatabaseManager dbMgr) {
        this.dbMgr = dbMgr;
    }

    @Override
    public void createOrUpdate(Translation object) {

    }

    @Override
    public void delete(Translation object) {

    }

    @Override
    public Translation delete(long id) {
        return null;
    }

    @Override
    public long deleteAll() {
        return 0;
    }

    @Override
    public List<Translation> findAllBy(Map<String, String> keys) {
        return null;
    }

    @Override
    public List<Translation> list() {
        return null;
    }

    @Override
    public Translation find(Translation value) {
        return null;
    }

    @Override
    public void setTranslationDatasource(Datasource datasource) {
        //empty
    }
}
