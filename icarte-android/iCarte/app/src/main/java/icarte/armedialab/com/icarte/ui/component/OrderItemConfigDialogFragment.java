package icarte.armedialab.com.icarte.ui.component;

import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.Order;
import icarte.armedialab.com.icarte.datamodel.OrderItem;
import icarte.armedialab.com.icarte.domain.Item;
import icarte.armedialab.com.icarte.domain.ItemAddon;
import icarte.armedialab.com.icarte.domain.ItemVariant;
import icarte.armedialab.com.icarte.domain.Language;
import icarte.armedialab.com.icarte.ui.ToolBarSupportActivity;
import icarte.armedialab.com.icarte.ui.adapter.CartViewListAdapter;
import icarte.armedialab.com.icarte.util.Utils;

/**
 * Created by Maqsood on 7/24/2017.
 */
//TODO: Load dialog with data if the item is already available in the order

public class OrderItemConfigDialogFragment extends DialogFragment implements View.OnClickListener {

    private Item item;
    private ItemConfigChangeListener itemConfigChangeListener;
    private CartViewListAdapter.OrderItemViewHolder orderItemViewHolder;

    private TextView txtItemConfigTitle;
    private TextView txtItemConfigExisting;
    private String strQuantityPrefix;
    private TextView txtQuantity;
    private SeekBar quantitySelector;
    private LinearLayout itemVariantContainerInDialog;
    private LinearLayout itemAddonContainerInDialog;
    private Spinner itemVariantSelector;
    private Button btnCancel;
    private Button btnSaveOrderItem;
    private EditText editTextSpecialInstructions;

    private static final String KEY_ITEM_IN_FRAGMENT = "bundle_key_item_in_fragment";

    public OrderItemConfigDialogFragment() {
        // Empty constructor is required for DialogFragment
        // Make sure not to add arguments to the constructor
        // Use `newInstance` instead as shown below
    }

    public static OrderItemConfigDialogFragment newInstance(String title) {
        OrderItemConfigDialogFragment frag = new OrderItemConfigDialogFragment();
        Bundle args = new Bundle();
        args.putString("title", title);
        frag.setArguments(args);
        return frag;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setStyle(DialogFragment.STYLE_NORMAL, R.style.Theme_AlertDialogPro_Material);
        if(savedInstanceState!=null && item==null) {
            setItem((Item)savedInstanceState.getSerializable(KEY_ITEM_IN_FRAGMENT));
        }
    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putSerializable(KEY_ITEM_IN_FRAGMENT, item);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.order_item_config_dialog, container);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        txtQuantity = (TextView) view.findViewById(R.id.txtQuantity);
        txtItemConfigTitle = (TextView) view.findViewById(R.id.txtItemConfigTitle);
        txtItemConfigExisting = (TextView) view.findViewById(R.id.txtItemConfigExisting);
        quantitySelector = (SeekBar) view.findViewById(R.id.quantitySelector);
        itemVariantContainerInDialog = (LinearLayout) view.findViewById(R.id.itemVariantContainerInDialog);
        itemAddonContainerInDialog = (LinearLayout) view.findViewById(R.id.itemAddonContainerInDialog);
        itemVariantSelector = (Spinner) view.findViewById(R.id.itemVariantSelector);
        editTextSpecialInstructions = (EditText) view.findViewById(R.id.editTxtSpecialInstructions);
        btnCancel = (Button) view.findViewById(R.id.btnCancel);
        btnSaveOrderItem = (Button) view.findViewById(R.id.btnSaveOrderItem);

        String title = getArguments().getString("title", getResources()
                .getString(R.string.dialog_fragment_title));
        getDialog().setTitle(title);

        btnCancel.setOnClickListener(this);
        btnSaveOrderItem.setOnClickListener(this);
        setCancelable(false);
        setupView(view);
        getDialog().getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);
    }

    private void setupView(View view) {
        strQuantityPrefix = getString(R.string.label_quantity);
        ApplicationController controller = ApplicationController.getInstance();
        txtItemConfigTitle.setText(item.getTitle(controller.getUserLanguage()));

        Order order = controller.getOrder();
        OrderItem orderItem = null;
        String txtQuantity = null;

        String txtSpecialInstr = null;
        if(order!=null) {
            orderItem = order.getOrderItem(this.item);

            if(orderItem!=null) {
                txtItemConfigExisting.setText(R.string.order_item_already_existing);
                txtItemConfigExisting.setVisibility(View.VISIBLE);

                txtQuantity = strQuantityPrefix + String.valueOf(orderItem.getQuantity());
                txtSpecialInstr = orderItem.getSpecialRemarks();
                quantitySelector.setProgress(orderItem.getQuantity());
            } else {
                txtQuantity = strQuantityPrefix + " " + Utils.MIN_ITEM_ORDER_QTY;
                quantitySelector.setProgress(Utils.MIN_ITEM_ORDER_QTY);
            }
        } else {
            txtItemConfigExisting.setVisibility(View.GONE);
        }
        this.txtQuantity.setText(txtQuantity);
        editTextSpecialInstructions.setText(txtSpecialInstr);

        quantitySelector.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            int val = quantitySelector.getProgress();

            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                val = progress;
                OrderItemConfigDialogFragment.this.txtQuantity.setText(strQuantityPrefix + val);
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });
        setupItemVariants(view, orderItem);
        setupItemAddons(view, orderItem);
    }

    private void setupItemVariants(View view, final OrderItem orderItem) {
        //here add the required views in itemVariantContainer based on item variant
        if(item!=null) {
            List<ItemVariant> itemVariants = item.getItemVariants().subList(0, item.getItemVariants().size());
            if (itemVariants.size() > 0) {
                if(itemVariants.size() == 1) {
                    itemVariants.add(0,
                            new ItemVariant(
                                    item.getPrimaryVariantId(),
                                    0,
                                    item.getPrice(),
                                    item.getImageUrl(),
                                    item.getApproxPreperationTime(),
                                    item,
                                    item.getTranslations()));
                }
                /*
                int variantSize = itemVariants.size();
                Language userLanguage = ApplicationController.getInstance().getUserLanguage();
                ItemVariantSpinnerField itemVariantSpinnerFields[] = new ItemVariantSpinnerField[variantSize];
                ItemVariant itemVariant = null;
                for (int i=0; i<variantSize; i++) {
                    itemVariant = itemVariants.get(i);
                    itemVariantSpinnerFields[i] = new ItemVariantSpinnerField(
                            itemVariant.getItemVariantId(),
                            itemVariant.getVariantId(),
                            itemVariant.getTitle(userLanguage),
                            itemVariant.getDescription(userLanguage),
                            itemVariant.getPrice(),
                            ApplicationController.getInstance().getCurrencyCode());
                }
                */
                ArrayAdapter<ItemVariant> adapter = new ArrayAdapter<>(
                        view.getContext(),
                        R.layout.spinner_layout_item, itemVariants);

                adapter.setDropDownViewResource(R.layout.spinner_layout_item);
                itemVariantSelector.setAdapter(adapter);
                if(orderItem!=null) {
                    ItemVariant prevSelectedVariant = orderItem.getItemVariant();
                    ItemVariant v = null;
                    if(prevSelectedVariant!=null) {
                        for (int i=0; i<itemVariants.size(); i++) {
                            v = itemVariants.get(i);
                            if (v.equals(prevSelectedVariant)) {
                                itemVariantSelector.setSelection(i);
                                break;
                            }
                        }
                    }
                }

                itemVariantSelector.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                    @Override
                    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
/*
                        ItemVariant itemVariant = (ItemVariant)parent.getItemAtPosition(position);
*/
                    }

                    @Override
                    public void onNothingSelected(AdapterView<?> parent) {

                    }
                });

                itemVariantContainerInDialog.setVisibility(View.VISIBLE);
            }
        }
    }

    private void setupItemAddons(View view, OrderItem orderItem) {
        //here add the requried views in addOnViewContainer based on ItemAddons
        if(item!=null) {
            List<ItemAddon> addons = item.getAddons();
            if (addons != null && addons.size() > 0) {
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
/*
                params.setMargins(R.dimen.nopadding,
                        R.dimen.activity_vertical_margin,
                        R.dimen.nopadding,
                        R.dimen.nopadding);
*/
                params.setMargins(0, 30, 0, 0);
                itemAddonContainerInDialog.setLayoutParams(params);

                int addonSize = addons.size();
                Language userLanguage = ApplicationController.getInstance().getUserLanguage();
                CheckBox checkBox = null;
                ItemAddon itemAddon = null;
                List<ItemAddon> addonsInOrder = null;
                if(orderItem!=null) {
                    addonsInOrder = orderItem.getItemAddons();
                }
                for (int i=0; i<addonSize; i++) {
                    itemAddon = addons.get(i);
                    checkBox = new CheckBox(view.getContext());
                    checkBox.setId((int)itemAddon.getAddonId());
                    checkBox.setTextColor(getResources().getColor(R.color.primary_text));
                    checkBox.setText(new StringBuilder(itemAddon.getTitle(userLanguage))
                            .append(" (")
                            .append(itemAddon.getPrice())
                            .append(" ")
                            .append(ApplicationController.getInstance().getCurrencyCode())
                            .append(")"));
                    //checkBox.setTextAppearance(view.getContext(), android.R.style.TextAppearance_Medium);
                    selectAddonCheckBoxIfInOrder(checkBox, itemAddon, addonsInOrder);
                    itemAddonContainerInDialog.addView(checkBox);
                }

                itemAddonContainerInDialog.setVisibility(View.VISIBLE);
            }
        }
    }

    private void selectAddonCheckBoxIfInOrder(CheckBox checkBox, ItemAddon itemAddon, List<ItemAddon> addonsInOrder) {
        if(addonsInOrder!=null) {
            for (ItemAddon orderAddOn: addonsInOrder) {
                if(itemAddon.getItemAddonId() == orderAddOn.getItemAddonId()) {
                    checkBox.setChecked(true);
                }
            }
        }
    }

    @Override
    public void onClick(View v) {
        if(v instanceof Button) {
            Button btn = (Button) v;
            if(btn.equals(btnCancel)) {
                dismiss();
            }
            else if(btn.equals(btnSaveOrderItem)) {
                int quantity = quantitySelector.getProgress();
                if(quantity>0) {
                    String specialInstructions = editTextSpecialInstructions.getText().toString();

                    List<ItemAddon> selectedAddons = null;

                    if (item.getAddons() != null) {
                        List<ItemAddon> originalAddonList = item.getAddons();
                        int addOnCount = originalAddonList.size();
                        selectedAddons = new ArrayList<>(addOnCount);
                        ItemAddon originalAddonInstance = null;
                        View view = null;
                        for (int i = 0; i < addOnCount; i++) {
                            originalAddonInstance = originalAddonList.get(i);
                            view = itemAddonContainerInDialog.findViewById((int) originalAddonInstance.getAddonId());
                            if (view instanceof CheckBox) {
                                if (((CheckBox)view).isChecked()) {
                                    selectedAddons.add(new ItemAddon(originalAddonInstance.getItemAddonId(),
                                            originalAddonInstance.getAddonId(), originalAddonInstance.getPrice(),
                                            originalAddonInstance.getImageUrl(), this.item,
                                            originalAddonInstance.getTranslations()));
                                }
                            }
                        }
                    }
                    ItemVariant selectedVariant = (ItemVariant) itemVariantSelector.getSelectedItem();
                    Order order = ApplicationController.getInstance().getOrder();
                    boolean isItemAddedOrUpdated = false;
                    OrderItem oItem = null;
                    if(orderItemViewHolder!=null){
                        oItem = orderItemViewHolder.getOrderItem();
                        if(oItem!=null) {
                            oItem = new OrderItem(this.item, quantity, specialInstructions,
                                    selectedVariant==null? null:
                                            new ItemVariant(selectedVariant.getItemVariantId(), selectedVariant.getVariantId(),
                                                    selectedVariant.getPrice(), selectedVariant.getImageUrl(),
                                                    selectedVariant.getApproxPreperationTime(), this.item,
                                                    selectedVariant.getTranslations()),
                                    selectedAddons);
                            order.addOrderItem(oItem, true);
                            orderItemViewHolder.updateQuantity(quantity);
                            isItemAddedOrUpdated = true;
                            if(itemConfigChangeListener!=null) {
                                itemConfigChangeListener.onConfigChange(oItem);
                            }
                            Utils.showToast(v.getContext(),
                                    this.item.getTitle(ApplicationController.getInstance().getUserLanguage())
                                            + " " + getString(R.string.item_updated_in_order_success_msg));
                        }
                    }
                    else {
                        oItem = new OrderItem(this.item, quantity, specialInstructions,
                                    selectedVariant==null? null:
                                            new ItemVariant(selectedVariant.getItemVariantId(), selectedVariant.getVariantId(),
                                                    selectedVariant.getPrice(), selectedVariant.getImageUrl(),
                                                    selectedVariant.getApproxPreperationTime(), this.item,
                                                    selectedVariant.getTranslations()),
                                selectedAddons);
                        order.addOrderItem(oItem, true);
                        isItemAddedOrUpdated = true;
                        if(itemConfigChangeListener!=null) {
                            itemConfigChangeListener.onConfigChange(oItem);
                        }
                        Utils.showToast(v.getContext(),
                                this.item.getTitle(ApplicationController.getInstance().getUserLanguage())
                                        + " " + getString(R.string.item_added_to_order_success_msg));
                    }
                    if(isItemAddedOrUpdated) {
                        Activity activity = getActivity();
                        if(activity instanceof ToolBarSupportActivity) {
                            ((ToolBarSupportActivity)activity ).setCartItemCounter(order.getOrderCount());
                        }

                    }
                    dismiss();
                } else {
                    Utils.showToast(v.getContext(),
                            getString(R.string.zero_qty_not_allowed)+ " " + Utils.MIN_ITEM_ORDER_QTY);
                }
            }
        }
    }

    public void setOrderItemViewHolder(CartViewListAdapter.OrderItemViewHolder orderItemViewHolder) {
        this.orderItemViewHolder = orderItemViewHolder;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public void setItemConfigChangeListener(ItemConfigChangeListener listener) {
        this.itemConfigChangeListener = listener;
    }

    public interface ItemConfigChangeListener {
        void onConfigChange(OrderItem oItem);
    }
}
