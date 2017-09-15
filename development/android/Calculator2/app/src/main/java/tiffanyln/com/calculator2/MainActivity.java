package tiffanyln.com.calculator2;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    EditText loanAmount;
    EditText numberOfYears;
    EditText yearlyInterestRate;
    TextView result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        result = (TextView) findViewById(R.id.result);
        loanAmount = (EditText) findViewById(R.id.loanAmount);
        numberOfYears = (EditText) findViewById(R.id.nbYears);
        yearlyInterestRate = (EditText) findViewById(R.id.yearlyInterest);
    }

    // TODO: input validation: set text to show error
    public void calculateLoan(View v) {
        double loan = Double.parseDouble(loanAmount.getText().toString());
        int years = Integer.parseInt(numberOfYears.getText().toString());
        double interest = Double.parseDouble(yearlyInterestRate.getText().toString());

        result.setText(Double.toString(loan + loan * interest ));
    }

}
