package icarte.armedialab.com.icarte.ui;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.util.Utils;

public class ConfigurationActivity extends AppCompatActivity {

    @Bind(R.id.editTableReference)EditText editTableReference;
    @Bind(R.id.txtStaffName) TextView txtStaffName;
    @Bind(R.id.txtStaffCode) TextView txtStaffCode;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_configuration);
        ButterKnife.bind(this);
        ApplicationController controller = ApplicationController.getInstance();
        String tableReference = controller.getTableReference();
        if(!Utils.isEmptyString(tableReference)){
            editTableReference.setText(tableReference);
        }
        txtStaffName.setText(controller.getStaff().getFirstName() + " " +
                controller.getStaff().getLastName());
        txtStaffCode.setText(controller.getStaff().getStaffCode());
    }

    @OnClick(R.id.btnSaveSettings)
    void onSaveSettings(final View view){
        if(validateData()) {
            final AlertDialog.Builder alertDlg = new AlertDialog.Builder(view.getContext(),
                    R.style.Theme_AlertDialogPro_Material_Light);
            alertDlg.setMessage(R.string.configuration_settings_submit_form_msg);
            alertDlg.setCancelable(false);
            final Activity activity = this;
            alertDlg.setPositiveButton(R.string.label_btn_yes, new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    saveSettings();
                    Utils.navigateToHomeScreen(activity);
                }
            });

            alertDlg.setNegativeButton(R.string.label_btn_no, null);
            alertDlg.create().show();
        }
    }

    private void saveSettings() {
        ApplicationController.getInstance().setTableReference(editTableReference.getText().toString());
    }

    private boolean validateData() {
        boolean validated = true;
        if(Utils.isEmptyEditText(editTableReference)){
            editTableReference.setError(
                    getResources().getString(R.string.customer_name_empty_error));
            validated = false;
        } else {
            editTableReference.setError(null);
        }
        return validated;
    }

    @OnClick(R.id.btnCancel)
    void onCancel(final View view) {
        onBackPressed();
    }

    @Override
    public void onBackPressed() {
        startActivity(new Intent(getApplicationContext(), HomeActivity.class));
        finish();
    }
}
