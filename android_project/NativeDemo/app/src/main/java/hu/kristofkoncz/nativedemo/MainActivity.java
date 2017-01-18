package hu.kristofkoncz.nativedemo;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

import hu.kristofkoncz.helloworld.HelloWorld;

public class MainActivity extends AppCompatActivity {

    private TextView helloWorldTextView;

    static {
        System.loadLibrary("helloworld_jni");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        helloWorldTextView = (TextView)findViewById(R.id.helloWorldTextView);

        HelloWorld hw = HelloWorld.create();
        helloWorldTextView.setText(hw.getHelloWorld());
    }
}
