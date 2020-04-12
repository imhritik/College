package com.example.admin.labprogram7;
import android.support.v7.app.AppCompatActivity;

import android.app.Activity;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import gps.location.GPStrace;
public class MainActivity extends AppCompatActivity {
Button btnShowLocation;
GPStrace gps;
@Override
protected void onCreate(Bundle savedInstanceState) {
super.onCreate(savedInstanceState);
setContentView(R.layout.activity_main);
btnShowLocation = (Button)findViewById(R.id.Show_Location);
btnShowLocation.setOnClickListener(new View.OnClickListener() {
@Override
public void onClick(View v) {
gps = new GPStrace(MainActivity.this);
if (gps.getLocation() != null) {
double latitude = gps.getLatitude();
double longitude = gps.getLongitude();
Toast.makeText(getApplicationContext(), "Your Location is \nLat:"
+ latitude + "\nLong:" + longitude, Toast.LENGTH_LONG).show();
} else {
//gps.showSettingAlert();
}
}
});
}
}
