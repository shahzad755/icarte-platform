package icarte.armedialab.com.icarte.ui.component;

import com.yalantis.contextmenu.lib.MenuObject;

import icarte.armedialab.com.icarte.domain.Language;

/**
 * Created by Maqsood on 9/16/2017.
 */
public class LanguageMenuObject extends MenuObject {
    public Language language;

    public LanguageMenuObject(Language language) {
        super(language.getName());
        this.language = language;
    }
}
