Packagecom.example.exn
Importandroid.app.AlarmManager;

Importandroid.app.PendingIntent;
Importandroid.content.Intent;
Importandroid.os.Bundle;
Importandroid.support.v7.app.AppCompatActivity;
Importandroid.view.View;
Importandroid.widget.TimePicker;
Importandroid.widget.Toast;
Importandroid.widget.ToggleButton;
Importjava.util.Calendar;
publicclassMainActivity extendsAppCompatActivity
{
TimePicker alarmTimePicker;
PendingIntent pendingIntent;
AlarmManager alarmManager;
@Override
ProtectedvoidonCreate(Bundle savedInstanceState)
{
super.onCreate(savedInstanceState);
setContentView(R.layout.activity_main);
alarmTimePicker = (TimePicker) findViewById(R.id.timePicker);
alarmManager = (AlarmManager) getSystemService(ALARM_SERVICE);
}
PublicvoidOnToggleClicked(View view)
{
longtime;
if(((ToggleButton) view).isChecked())
{
Toast.makeText(MainActivity.this, "ALARM ON", Toast.LENGTH_SHORT).show();
Calendar calendar = Calendar.getInstance();
calendar.set(Calendar.HOUR_OF_DAY, alarmTimePicker.getCurrentHour());
calendar.set(Calendar.MINUTE, alarmTimePicker.getCurrentMinute());
Intent intent = newIntent(this, AlarmReceiver.class);
pendingIntent = PendingIntent.getBroadcast(this, 0, intent, 0);
time=(calendar.getTimeInMillis()-(calendar.getTimeInMillis()%60000));
if(System.currentTimeMillis()>time)
{
if(calendar.AM_PM == 0)
time = time + (1000*60*60*12);
else
time = time + (1000*60*60*24);
}
alarmManager.setRepeating(AlarmManager.RTC_WAKEUP, time, 10000, pendingIntent);
}

else
{
alarmManager.cancel(pendingIntent);
Toast.makeText(MainActivity.this, "ALARM OFF", Toast.LENGTH_SHORT).show();
}
}
}
