package icarte.armedialab.com.icarte.ui;

import icarte.armedialab.com.icarte.domain.ItemCategory;

/**
 * Interface to be implemented by fragments to be associated with categories
 */
public interface AttachedToCategory {
    void setCategory(ItemCategory category);
}
