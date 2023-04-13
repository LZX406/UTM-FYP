const admin= require("firebase-admin");
const serviceAccount=require("./firebase-service-account.json");
const FIREBASE_DATABASE_URL="";
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: FIREBASE_DATABASE_URL
});

export async function sendNotificationEvent(){
    try{
        var payload={notification:{title:'FCM',body:'we'},data:{click_action:"FLUTTER_NOTIFICATION_CLICK"}}
        await admin.messaging().sendToTopic('Events',payload);
    }
    catch(error){
        console.log(error);
    }
}