package com.example.lab6;

import android.database.Cursor;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    DatabaseHelper myDb;
    EditText editU,editN,editE,editC;
    Button btnAddData,btnViewAll,btnDelete,btnViewUpdate;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        myDb = new DatabaseHelper(this);

        editU = (EditText)findViewById(R.id.usn_et);
        editN = (EditText)findViewById(R.id.name_et);
        editE = (EditText)findViewById(R.id.email_et);
        editC = (EditText)findViewById(R.id.cgpa_et);

        btnAddData = (Button)findViewById(R.id.insert);
        btnDelete = (Button)findViewById(R.id.delete);
        btnViewUpdate = (Button)findViewById(R.id.update);
        btnViewAll = (Button)findViewById(R.id.viewall);

        insertData();
        updateData();
        deleteData();
        viewAll();
    }
    public void deleteData(){
        btnDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Integer deletedRows = myDb.deleteDate(editU.getText().toString());
                if(deletedRows > 0){
                    Toast.makeText(MainActivity.this,"Data deleted",Toast.LENGTH_LONG).show();
                    editU.setText("");
                    editN.setText("");
                    editE.setText("");
                    editC.setText("");
                }
                else{
                    Toast.makeText(MainActivity.this,"Data not deleted",Toast.LENGTH_LONG).show();
                }
            }
        });
    }
    public void updateData(){
        btnViewUpdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean isUpdate = myDb.updateData(editU.getText().toString(),editN.getText().toString(),editE.getText().toString(),editC.getText().toString());
                if(isUpdate){
                    Toast.makeText(MainActivity.this,"Data updated",Toast.LENGTH_LONG).show();
                    editU.setText("");
                    editN.setText("");
                    editE.setText("");
                    editC.setText("");
                }
                else{
                    Toast.makeText(MainActivity.this,"Data not updated",Toast.LENGTH_LONG).show();
                }
            }
        });
    }
    public void insertData(){
        btnAddData.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean isInserted = myDb.insertData(editU.getText().toString(),editN.getText().toString(),editE.getText().toString(),editC.getText().toString());
                if(isInserted){
                    Toast.makeText(MainActivity.this,"Data inserted",Toast.LENGTH_LONG).show();
                    editU.setText("");
                    editN.setText("");
                    editE.setText("");
                    editC.setText("");
                }
                else{
                    Toast.makeText(MainActivity.this,"Data not inserted",Toast.LENGTH_LONG).show();
                }
            }
        });
    }
    public void viewAll(){
        btnViewAll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Cursor res = myDb.getAllData();
                if(res.getCount() == 0){
                    Toast.makeText(MainActivity.this,"No data found",Toast.LENGTH_LONG).show();
                    return;
                }
                StringBuffer buffer = new StringBuffer();
                while(res.moveToNext()){
                    buffer.append("USN: "+ res.getString(0)+"\n");
                    buffer.append("NAME: "+ res.getString(1)+"\n");
                    buffer.append("EMAIL: "+ res.getString(2)+"\n");
                    buffer.append("CGPA: "+ res.getString(3)+"\n\n\n");
                }
                Toast.makeText(MainActivity.this,buffer.toString(),Toast.LENGTH_LONG).show();
            }
        });
    }

}
