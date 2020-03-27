package com.example.lab4;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Bitmap bg = Bitmap.createBitmap(720,1280,Bitmap.Config.ARGB_8888);
        ImageView i = (ImageView)findViewById(R.id.ivv);
        i.setBackgroundDrawable(new BitmapDrawable(bg));
        Canvas canvas = new Canvas(bg);
        Paint paint = new Paint();
        paint.setColor(Color.BLUE);
        canvas.drawText("RECTANGLE",420,150,paint);
        canvas.drawRect(400,200,650,700,paint);
        canvas.drawLine(100,100,100,500,paint);
        canvas.drawCircle(100,700,100,paint);
        canvas.drawRect(150,150,200,200,paint);
    }
}
