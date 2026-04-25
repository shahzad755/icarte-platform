package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;
import java.util.Map;

/**
 * Created by Maqsood on 5/21/2017.
 */
public class BaseDomain implements Serializable {

    private Map<String, Translation> translations;
    private final String DEFAULT_LANGUAGE_CODE = "en";

    public Map<String, Translation> getTranslations() {
        return translations;
    }

    public void setTranslations(Map<String, Translation> translations) {
        this.translations = translations;
    }

    public String getTitle(Language lang) {
        Translation translation = getTranslationFor(lang.getCode());
        if(translation!=null)
            return translation.getTitle();
        else
            return "";
    }

    public Translation getTranslationFor(String lang) {
        if(translations!=null) {
            if (translations.containsKey(lang)) {
                return translations.get(lang);
            } // lets try default language
            else if(translations.containsKey(DEFAULT_LANGUAGE_CODE)) {
                return translations.get(DEFAULT_LANGUAGE_CODE);
            }
        }
        return null;
    }

    public String getDescription(Language lang) {
        Translation translation = getTranslationFor(lang.getCode());
        if(translation!=null)
            return translation.getDescription();
        else
            return "";
    }

/*
    public String getTranslatedText(String lang, String fieldName) {
        Map<String, String> trans = null;
        if(translations!=null && translations.containsKey(lang)){
            trans = translations.get(lang);
            if(trans!=null && trans.containsKey(fieldName)) {
                return trans.get(fieldName);
            }
        }
        return null;
    }
*/

}
