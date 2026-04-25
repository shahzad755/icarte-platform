package icarte.armedialab.com.icarte;

import android.app.Application;
import android.text.TextUtils;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.cache.plus.BitmapImageCache;
import com.android.volley.cache.plus.ImageLoader;
import com.android.volley.toolbox.Volley;
import com.ctrlplusz.anytextview.Util;
import com.esotericsoftware.kryo.Kryo;
import com.esotericsoftware.kryo.io.Input;
import com.esotericsoftware.kryo.io.Output;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;

import java.util.Date;

import icarte.armedialab.com.icarte.datamodel.Order;
import icarte.armedialab.com.icarte.datamodel.Staff;
import icarte.armedialab.com.icarte.datasource.CarteDatabaseManager;
import icarte.armedialab.com.icarte.datasource.RestaurantDatasource;
import icarte.armedialab.com.icarte.datasource.TranslationDatasource;
import icarte.armedialab.com.icarte.domain.Language;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.service.CarteService;
import icarte.armedialab.com.icarte.ui.LanguageToolbarSupport;
import icarte.armedialab.com.icarte.util.ExcludeFromJsonSerialization;
import icarte.armedialab.com.icarte.util.Utils;
import icarte.armedialab.com.icarte.util.Utils.ApplicationMode;
import ru.noties.storm.Storm;
import ru.noties.storm.sd.ByteArraySerializer;
import ru.noties.storm.sd.LongSerializer;
import ru.noties.storm.sd.StringSerializer;

import static icarte.armedialab.com.icarte.util.Utils.ApplicationMode.ROAMING;


/**
 * Created by Maqsood on 3/16/2017.
 */
public class ApplicationController extends Application {
    public static final String TAG = ApplicationController.class.getSimpleName();
    private RequestQueue mRequestQueue;
    private ImageLoader mImageLoader;
    private static ApplicationController mInstance;

    private Restaurant restaurantInfo;

    private Language userLanguage;
    private String currencyCode;
    private CarteDatabaseManager carteDatabaseManager;
    private RestaurantDatasource restaurantDatasource;
    private TranslationDatasource translationDatasource;
    private CarteService carteService;
    private Order order;
    private Staff staff;
    private String tableReference;

    private LanguageToolbarSupport languageToolbarSupport;
    private String deviceId;

    @Override
    public void onCreate() {
        super.onCreate();
        mInstance = this;
        init();
    }

    private void init() {
        Storm.getInstance().init(this, true);
        final Storm storm = Storm.getInstance();

        carteDatabaseManager = CarteDatabaseManager.getCarteDatabaseManager();
        carteDatabaseManager.init();

        restaurantDatasource = new RestaurantDatasource(carteDatabaseManager.getDatabaseManager());
        carteDatabaseManager.setRestaurantDatasource(restaurantDatasource);

        translationDatasource = new TranslationDatasource(carteDatabaseManager.getDatabaseManager());
        restaurantDatasource.setTranslationDatasource(translationDatasource);

        carteService = new CarteService();
        carteService.setDatabaseManager(carteDatabaseManager);

        storm.registerTypeSerializer(Date.class, new LongSerializer<Date>() {
            @Override
            public Date deserialize(long value) {
                return new Date(value);
            }

            @Override
            public long serialize(Date value) {
                return value.getTime();
            }
        });

        Fresco.initialize(getApplicationContext());

        languageToolbarSupport = LanguageToolbarSupport.getInstance();
        languageToolbarSupport.setupUI();


        //registerGson(storm, SampleObject.Wrapper.class);

        //storm.registerTypeSerializer(TableModel.SomeEnum.class, new EnumSerializer<>(TableModel.SomeEnum.values()));
//        storm.registerTypeSerializer(ApiModel.class, new GenericBytesSerializer<>(ApiModel.class));

    }

    public static synchronized ApplicationController getInstance(){
        return mInstance;
    }

    public <T> void registerGson(Storm storm, Class<T> clazz) {
        storm.registerTypeSerializer(clazz, new GenericGsonSerializer<>(clazz));
    }

    public void setRestaurantInfo(Restaurant restaurantInfo) {
        if(restaurantInfo!=null) {
            this.restaurantInfo = restaurantInfo;
            ApplicationMode applicationMode = Utils.ApplicationMode.getApplicationMode(this.restaurantInfo.getApplicationMode());
            //now set the table reference if the mode is not roaming
            switch (applicationMode){
                case FIXED: case KIOSK:
                    tableReference = restaurantInfo.getTableReference();
                    break;
                default:
                    this.restaurantInfo.setApplicationMode(applicationMode.getApplicationMode());
                    break;
            }
        }
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    public boolean isContactNumberMandatoryForOrder() {
        return restaurantInfo.isContactNumberMandatory();
    }

    public void resetTableIfRequired() {
        //TODO: omitting table reset for now
/*        if(ROAMING.getApplicationMode() == restaurantInfo.getApplicationMode()){
            tableReference = null;
        }*/
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String sId) {
        this.deviceId = sId;
    }

    private static class  GenericGsonSerializer<T> extends StringSerializer<T> {

        private static final Gson gson;
        static {
            gson = new Gson();
        }
        private final Class<T> clazz;

        GenericGsonSerializer(Class<T> clazz) {
            this.clazz = clazz;
        }

        @Override
        public T deserialize(String in) {
            return gson.fromJson(in, clazz);
        }

        @Override
        public String serialize(T in) {
            return gson.toJson(in);
        }
    }

    private static class GenericBytesSerializer<T> extends ByteArraySerializer<T> {

        private static final Kryo kryo;
        static {
            kryo = new Kryo();
        }
        private final Class<T> clazz;

        private GenericBytesSerializer(Class<T> clazz) {
            this.clazz = clazz;
        }

        @Override
        public T deserialize(byte[] value) {
            kryo.register(clazz);
            final Input input = new Input(value);
            try {
                return kryo.readObject(input, clazz);
            } finally {
                input.close();
            }
        }

        @Override
        public byte[] serialize(Object value) {
            kryo.register(clazz);
            final Output output = new Output(4096);
            kryo.writeObject(output, value);
            try {
                return output.toBytes();
            } finally {
                output.close();
            }
        }
    }


    public RequestQueue getRequestQueue() {
        if (mRequestQueue == null) {
            mRequestQueue = Volley.newRequestQueue(getApplicationContext());
        }

        return mRequestQueue;
    }

    public ImageLoader getImageLoader() {
        getRequestQueue();
        if (mImageLoader == null) {
            mImageLoader = new ImageLoader(this.mRequestQueue,
                    BitmapImageCache.getInstance(null));
        }
        return this.mImageLoader;
    }

    public <T> void addToRequestQueue(Request<T> req, String tag) {
        // set the default tag if tag is empty
        req.setTag(TextUtils.isEmpty(tag) ? TAG : tag);
        getRequestQueue().add(req);
    }

    public <T> void addToRequestQueue(Request<T> req) {
        req.setTag(TAG);
        getRequestQueue().add(req);
    }

    public void cancelPendingRequests(Object tag) {
        if (mRequestQueue != null) {
            mRequestQueue.cancelAll(tag);
        }
    }

    public Restaurant getRestaurantInfo() {
        return this.restaurantInfo;
    }

    public Language getUserLanguage() {
        if(this.userLanguage==null ) {
            String lang = getResources().getConfiguration().locale.getLanguage();
            setUserLanguage(lang != null ?
                    Utils.LanguageCodes.findLanguage(lang) : Utils.DEFAULT_LANGUAGE);
        }
        return userLanguage;
    }

    public String getCurrencyCode() {
        if (this.currencyCode == null) {
            setCurrencyCode(Utils.CURRENCY);
        }
        return currencyCode;
    }

    public void setUserLanguage(Language userLanguage) {
        this.userLanguage = userLanguage;
        Utils.setLanguage(this, this.userLanguage, true);
    }

    @Override
    public void onTerminate() {
        CarteDatabaseManager.getCarteDatabaseManager().close();
        super.onTerminate();
    }

    public CarteService getCarteService() {
        return carteService;
    }

    private Order createNewOrder() {
        synchronized (this) {
            order = new Order();
            order.setStaff(staff);
        }
        return order;
    }

    public boolean isOrderExist() {
        return order!=null;
    }

    public Order getOrder() {
        if(order==null) {
            return createNewOrder() ;
        } else
            return order;
    }

    public void resetOrder() {
        order.removeAll();
        order = null;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public String getTableReference() {
        return tableReference;
    }

    public void setTableReference(String tableReference) {
        this.tableReference = tableReference;
    }
}
