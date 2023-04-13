// package com.example.task_notify;
// import android.os.Bundle;
// import io.flutter.embedding.android.FlutterActivity;
// import java.util.*;
// import flutter.plugin.common.MethodCall;
// import flutter.plugin.common.MethodChannel;
// import com.FirebaseMessaging.*;
// public class MainActivity extends FlutterActivity {

//     private static final String CHANNEL ="method/notification";

//     @Override
//     protected void onCreate(Bundle savedInstanceState){
        
//         new MethodChannel(getFlutterView(),CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler(){
        
//         final Map<String, Object> arguments=methodCall.arguments();
//         @Override
//         public void onMethodCall(MethodCall methodCall,MethodChannel.Result result){
//         if(call.method.equals("sendMessageToFcmRegistrationToken")){
//             String token=(String) arguments.get("token");
//             sendMessageToFcmRegistrationToken(token);
//         }}
//     });
//     }
    

//     private static void sendMessageToFcmRegistrationToken(String token) throws Exception {
//    String registrationToken = token;
//    Message message =
//        Message.builder()
//            .putData("FCM", "https://firebase.google.com/docs/cloud-messaging")
//            .putData("flutter", "https://flutter.dev/")
//            .setToken(registrationToken)
//            .build();

//    String response = FirebaseMessaging.getInstance().send(message);
//     System.out.println(token);
//    System.out.println("Message to FCM Registration Token sent successfully!!");
//  }}

