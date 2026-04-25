package icarte.armedialab.com.icarte.ui;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.TextInputLayout;
import android.support.v4.app.NavUtils;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;

import com.alertdialogpro.AlertDialogPro;
import com.android.volley.error.TimeoutError;
import com.android.volley.error.VolleyError;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.Customer;
import icarte.armedialab.com.icarte.datamodel.Order;
import icarte.armedialab.com.icarte.datamodel.OrderResponse;
import icarte.armedialab.com.icarte.datamodel.RequestWrapper;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.listeners.ResponseListener;
import icarte.armedialab.com.icarte.responses.ServerResponse;
import icarte.armedialab.com.icarte.service.ServerProxy;
import icarte.armedialab.com.icarte.ui.adapter.CartViewListAdapter;
import icarte.armedialab.com.icarte.util.Utils;
import me.fichardu.circleprogress.CircleProgress;

public class CartViewActivity extends AppCompatActivity {

    @Bind(R.id.toolbar)
    Toolbar toolbar;

    private CartViewListAdapter cartViewListAdapter;

    @Bind(R.id.orderListRecyclerView )
    RecyclerView orderListRecyclerView;

    @Bind(R.id.textTotalOrderPrice)
    TextView textTotalOrderPrice;

    @Bind(R.id.btnSubmitOrder)
    FloatingActionButton btnOrderNow;

    @Bind(R.id.empty_view)
    TextView textEmptyView;

    @Bind(R.id.btnClearCart)
    ImageButton btnClearCart;

/*
    @Bind(R.id.imgOrderItemImage)
    SimpleDraweeView imgOrderItemImage;
*/

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cart_view);
        ButterKnife.bind(this);

        orderListRecyclerView.setLayoutManager(createLayoutManager());
        orderListRecyclerView.setHasFixedSize(true);

        final Order order = ApplicationController.getInstance().getOrder();
        cartViewListAdapter = new CartViewListAdapter(order, this);

        orderListRecyclerView.setAdapter(cartViewListAdapter);

        setTotalOrderPriceText(order.getOrderTotal().toString());
        if(order.getOrderCount()>0) {
            showOrderButtonFromCartView();
            //orderListRecyclerView.setVisibility(View.VISIBLE);
            textEmptyView.setVisibility(View.GONE);
        } else {
            //orderListRecyclerView.setVisibility(View.GONE);
            textEmptyView.setVisibility(View.VISIBLE);
            btnClearCart.setVisibility(View.GONE);
        }

        setSupportActionBar(toolbar);

        getSupportActionBar().setHomeButtonEnabled(true);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

    }

    private RecyclerView.LayoutManager createLayoutManager() {
        return new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_cart_view, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if(id==R.id.home) {
            NavUtils.navigateUpFromSameTask(this);
            return true;
        }
        else if(item.getItemId()==R.id.order) {
            startActivity(new Intent(this, CartViewActivity.class));
        } else if(item.getItemId()==R.id.navigate_home) {
            startActivity(new Intent(this, HomeActivity.class));
            finish();
        }else if(item.getItemId()==R.id.callWaiter) {
            new CallWaiterOnClickHandler(this).onClick(this.findViewById(R.id.callWaiter));
        }

        return super.onOptionsItemSelected(item);
    }

    public void setTotalOrderPriceText(String value) {
        this.textTotalOrderPrice.setText(value + " " + ApplicationController.getInstance().getCurrencyCode());
    }

    public RecyclerView getOrderListRecyclerView() {
        return orderListRecyclerView;
    }

    public void hideOrderButtonFromCartView() {
        btnClearCart.setVisibility(View.GONE);
        btnOrderNow.setVisibility(View.INVISIBLE);
        textEmptyView.setVisibility(View.VISIBLE);
    }

    public void showOrderButtonFromCartView() {
        btnOrderNow.setVisibility(View.VISIBLE);
        btnClearCart.setVisibility(View.VISIBLE);

    }

    @OnClick(R.id.btnSubmitOrder)
    void submitOrder(final View v) {
        final View inflatedView = getLayoutInflater().inflate(R.layout.layout_order_confirmation_alert, null);

        final AlertDialogPro.Builder builder = new AlertDialogPro.Builder(v.getContext()){

            final TextInputLayout layoutEditContactNumber = (TextInputLayout) inflatedView.findViewById(R.id.layoutEditContactNumber);
            final CircleProgress mProgressView = (CircleProgress) inflatedView.findViewById(R.id.progressCart);
            final View containerConfirmationDetails = (View) inflatedView.findViewById(R.id.containerConfirmationDetails);

            void hideProgressIndicator() {
                if(mProgressView!=null) {
                    mProgressView.stopAnim();
                    mProgressView.setVisibility(View.INVISIBLE);
                }
                //containerConfirmationDetails.setVisibility(View.VISIBLE);

            }
            void showProgressIndicator() {
                if (mProgressView != null) {
                    // Set the content view to 0% opacity but visible, so that it is visible
                    // (but fully transparent) during the animation.
                    mProgressView.setAlpha(0f);
                    mProgressView.setVisibility(View.VISIBLE);
                    mProgressView.startAnim();

                    // Animate the content view to 100% opacity, and clear any animation
                    // listener set on the view.
                    mProgressView.animate()
                            .alpha(1f)
                            .setDuration(getResources().getInteger(
                                    android.R.integer.config_mediumAnimTime))
                            .setListener(null);
                }
            }

            @Override
            public AlertDialogPro show() {
                if(ApplicationController.getInstance().isContactNumberMandatoryForOrder()) {
                    layoutEditContactNumber.setErrorEnabled(true);
                    //layoutEditContactNumber.setError(getString(R.string.contact_number_error_message));
                }
                final AlertDialogPro d = create();

                d.setOnShowListener(new DialogInterface.OnShowListener() {

                    @Override
                    public void onShow(DialogInterface dialog) {

                        //Button b = d.getButton(AlertDialog.BUTTON_POSITIVE);
                        final Button btnPositive = d.getButton(DialogInterface.BUTTON_POSITIVE);
                        final Button btnNegative = d.getButton(DialogInterface.BUTTON_NEGATIVE);
                        btnPositive.setOnClickListener(new View.OnClickListener() {

                            @Override
                            public void onClick(View view) {
                                hideKeyboard();
                                EditText editText = layoutEditContactNumber.getEditText();
                                String contactNumber = editText!=null? editText.getText().toString(): "";
                                boolean isInputError = false;
                                if (!Utils.validateContactNumber(contactNumber)) {
                                    layoutEditContactNumber.setError(getString(R.string.contact_number_error_message));
                                    isInputError = true;
                                } else {
                                    layoutEditContactNumber.setErrorEnabled(false);
                                }
                                //TODO: This should have been set already by the staff before handing over the tablet to the customer (if the table mode is not kiosk, handle the case)

                                if(!Utils.isTableNumberAvailable()) {
                                    isInputError = true;
                                    final AlertDialog.Builder alertDlg = new AlertDialog.Builder(v.getContext(),
                                            R.style.Base_Theme_AlertDialogPro_Material);
                                    alertDlg.setTitle(R.string.title_attention);
                                    alertDlg.setMessage(R.string.table_ref_error_message);
                                    alertDlg.setNegativeButton(R.string.label_btn_ok, null);
                                    alertDlg.setCancelable(true);
                                    alertDlg.create().show();
                                }

                                if(!isInputError) {
                                    Order o = ApplicationController.getInstance().getOrder();
                                    o.setServingTableRef(Utils.getTableReferenceId());
                                    Customer customer = new Customer();
                                    customer.setMobile(contactNumber);
                                    o.setCustomer(customer);
                                    o.setStaff(ApplicationController.getInstance().getStaff());
                                    o.setServingTableRef(ApplicationController.getInstance().getTableReference());

                                    btnPositive.setEnabled(false);
                                    btnNegative.setEnabled(false);
                                    layoutEditContactNumber.getEditText().setEnabled(false);

                                    showProgressIndicator();

                                    Restaurant restaurant = ApplicationController.getInstance().getRestaurantInfo();

                                    final RequestWrapper<Order.OrderJsonWrapper> request = new RequestWrapper<>(Utils.RequestCode.SUBMIT_ORDER.getRequestCode());
                                    request.setDeviceSerialNum(Utils.getDeviceId(d.getContext()));
                                    request.setDeviceRegistrationCode(restaurant.getDeviceRegistrationCode());
                                    request.setRestaurantActivationKey(restaurant.getActivationKey());
                                    request.setRestaurantCode(restaurant.getRestaurantCode());
                                    request.setRequest(o.getJsonWrapper());
                                    if(Utils.isNetworkAvailable(getContext())) {
                                        ServerProxy.submitOrder(request, new ResponseListener.ResponseProcessor<ServerResponse<OrderResponse>>() {
                                            @Override
                                            public void onSuccess(ServerResponse<OrderResponse> response) {
                                                if (response.isSuccess()) {
                                                    Utils.showToast(getContext(), getResources().getString(R.string.order_submitted_success));
                                                    cartViewListAdapter.getOrder().removeAll();//Also try if removing directly from order works
                                                    cartViewListAdapter.notifyDataSetChanged();
                                                    setTotalOrderPriceText("0");
                                                    ApplicationController.getInstance().resetOrder();
                                                    ApplicationController.getInstance().resetTableIfRequired();

                                                    Intent intent = new Intent(getContext(), OrderReceiptActivity.class);
                                                    intent.putExtra(Utils.KEY_ORDER_RESPONSE, response.getModel());
                                                    d.dismiss();
//                                                textEmptyView.setVisibility(View.VISIBLE);
                                                    startActivity(intent);
                                                    finish();
                                                } else {
                                                    adjustControlsAfterFault(getResources().getString(R.string.order_submitted_failed));
                                                }
                                            }

                                            @Override
                                            public void onFault(VolleyError response) {
                                                String errMsg = null;
                                                if(response instanceof TimeoutError)
                                                    errMsg = getResources().getString(R.string.error_host_unreachable);
                                                else
                                                    errMsg = response.getMessage();
                                                if(errMsg==null) {
                                                    errMsg = getResources().getString(R.string.error_host_unreachable);
                                                }
                                                adjustControlsAfterFault(errMsg);
                                            }

                                        });
                                    } else {
                                        adjustControlsAfterFault(getResources().getString(R.string.error_no_connection_cart_activity));
                                    }
                                }
                            }
                            void adjustControlsAfterFault(String msg) {
                                hideProgressIndicator();
                                Utils.showToast(getContext(), msg);
                                layoutEditContactNumber.getEditText().setEnabled(true);
                                btnPositive.setEnabled(true);
                                btnNegative.setEnabled(true);
                            }
                        });
                    }
                });
                d.show();
                return d;
            }
        };
        builder
            //.setIcon(R.drawable.close)
            .setTitle(R.string.title_order_confirmation_dialog)
            .setMessage(R.string.msg_confirm_order)
            .setCancelable(false)
            .setView(inflatedView)
            .setPositiveButton(R.string.label_btn_place_order_confirmation_dialog, null)
            .setNegativeButton(R.string.label_btn_cancel_confirmation_dialog, null)
            .show();
    }

    void hideKeyboard() {
        View view = getCurrentFocus();
        if (view != null) {
            ((InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE)).
                    hideSoftInputFromWindow(view.getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);
        }
    }

    @OnClick(R.id.btnClearCart)
    public void onCartEmpty(View v) {
        if (v != null) {
            AlertDialog.Builder alertDlg = new AlertDialog.Builder(this);
            alertDlg.setMessage(R.string.cartview_clear_all_confirm_msg);
            alertDlg.setCancelable(false);
            alertDlg.setPositiveButton(R.string.label_btn_yes, new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    resetCart();
                }
            });

            alertDlg.setNegativeButton(R.string.label_btn_no, new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    //Do Nothing
                }
            });
            alertDlg.create().show();
        }
    }

    private void resetCart() {
        if(cartViewListAdapter.getOrder().getOrderCount()>0) {
            cartViewListAdapter.getOrder().removeAll();
            cartViewListAdapter.notifyDataSetChanged();
            setTotalOrderPriceText(cartViewListAdapter.getOrder().getOrderTotal().toString());
            //Hide the Buttons
            hideOrderButtonFromCartView();
        }
    }

    @Override
    public void onBackPressed() {
        NavUtils.navigateUpFromSameTask(this);
    }
}
