package icarte.armedialab.com.icarte.parsers;

/**
 * Created by Maqsood on 4/28/2017.
 */
@Deprecated
public interface Parser<PResult, Data> {
    public PResult parse(Data data);
}
