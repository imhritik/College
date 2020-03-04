package com.example.calci;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import android.text.Selection;
import android.text.TextUtils;

import android.view.View;

import android.view.View.OnClickListener;

import android.widget.Button;

import android.widget.EditText;

import android.widget.TextView;

public class MainActivity extends AppCompatActivity implements OnClickListener

{



    EditText Num1;

    EditText Num2;

    Button Add;

    Button Sub;

    Button Mul;

    Button Div;

    Button Clr;

    TextView Result;

    int clr=0;

    @Override

    public void onCreate(Bundle savedInstanceState)

    {

        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);



        Num1 = (EditText) findViewById(R.id.editText1);

        Num2 = (EditText) findViewById(R.id.editText2);

        Add = (Button) findViewById(R.id.Add);

        Sub = (Button) findViewById(R.id.Sub);

        Mul = (Button) findViewById(R.id.Mul);

        Div = (Button) findViewById(R.id.Div);

        Clr = (Button) findViewById(R.id.Clr);



        Result = (TextView) findViewById(R.id.textView);



        Add.setOnClickListener(this);

        Sub.setOnClickListener(this);

        Mul.setOnClickListener(this);

        Div.setOnClickListener(this);

        Clr.setOnClickListener(this);

    }

    @Override

    public void onClick (View v)

    {

        float num1 = 0;

        float num2 = 0;

        float result = 0;

        String oper = "";



        if(TextUtils.isEmpty(Num1.getText().toString()) || TextUtils.isEmpty(Num2.getText().toString()))

            return;




        num1 = Float.parseFloat(Num1.getText().toString());

        num2 = Float.parseFloat(Num2.getText().toString());



        switch(v.getId())

        {

            case R.id.Add:

                oper = "+";

                result = num1 + num2;

                break;

            case R.id.Sub:

                oper = "-";

                result = num1 - num2;

                break;

            case R.id.Mul:

                oper = "*";

                result = num1 * num2;

                break;

            case R.id.Div:

                oper = "/";

                result = num1 / num2;

                break;

            case R.id.Clr:
                Num1.setText(" ");
                Num2.setText(" ");
                Num1.setSelection(1);
                clr=1;
                break;

            default:

                break;

        }


        if(clr!=1)
            Result.setText("Answer : "+result);

        else
            Result.setText("Answer");
        clr=0;


    }

}
