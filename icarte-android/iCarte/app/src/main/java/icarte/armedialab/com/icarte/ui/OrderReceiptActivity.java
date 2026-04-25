package icarte.armedialab.com.icarte.ui;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.Button;
import android.widget.ImageView;

import com.ctrlplusz.anytextview.AnyTextView;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.jwetherell.quick_response_code.data.Contents;
import com.jwetherell.quick_response_code.qrcode.QRCodeEncoder;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.OrderResponse;
import icarte.armedialab.com.icarte.util.Utils;

public class OrderReceiptActivity extends AppCompatActivity {

    @Bind(R.id.qrcodeOrderResponse)
    ImageView qrcodeOrderResponse;

    @Bind(R.id.txtOrderRefNum)
    AnyTextView txtOrderRefNum;

    @Bind(R.id.txtOrderPreparationTime)
    AnyTextView txtOrderPreparationTime;

    @Bind(R.id.btnFinishMe)
    Button imageButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order_reciept);
        ButterKnife.bind(this);

        Intent intent = getIntent();
        Bundle extras = intent.getExtras();
        if (extras != null) {
/*            WindowManager manager = (WindowManager) getSystemService(WINDOW_SERVICE);
            Display display = manager.getDefaultDisplay();
            Point point = new Point();
            display.getSize(point);
            int width = point.x;
            int height = point.y;
            int smallerDimension = width < height ? width : height;
            smallerDimension = smallerDimension * 7 / 8;*/

            OrderResponse orderResponse = (OrderResponse) extras.get(Utils.KEY_ORDER_RESPONSE);
            txtOrderRefNum.setText(orderResponse.getOrderRef());
            txtOrderPreparationTime.setText(orderResponse.getEstimatedTime());

            try {
                QRCodeEncoder qrCodeEncoder = new QRCodeEncoder(orderResponse.getOrderRef(),
                        null, Contents.Type.TEXT, BarcodeFormat.QR_CODE.toString(), 250);
                qrcodeOrderResponse.setImageBitmap(qrCodeEncoder.encodeAsBitmap());
                qrcodeOrderResponse.setAdjustViewBounds(true);
            } catch (WriterException e) {
                Utils.showToast(this, getResources().getString(R.string.receipt_display_error));
            }


        } else {
            Utils.showToast(this, getResources().getString(R.string.receipt_display_error));
        }
    }

    @Override
    public void onBackPressed() {
        complete();
    }

    @OnClick(R.id.btnFinishMe)
    void complete() {
        startActivity(new Intent(this, HomeActivity.class));
        finish();
    }
}
