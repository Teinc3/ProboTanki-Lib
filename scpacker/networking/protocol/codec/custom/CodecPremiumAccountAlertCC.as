package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.premiumaccount.alert.PremiumAccountAlertCC;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecPremiumAccountAlertCC implements ICodec
   {
      private var Renamed10699:ICodec;
      
      private var Renamed10700:ICodec;
      
      private var Renamed10701:ICodec;
      
      private var Renamed10702:ICodec;
      
      private var Renamed10703:ICodec;
      
      public function CodecPremiumAccountAlertCC(param1:Renamed536)
      {
         super();
         this.Renamed10699 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10700 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10701 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10702 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10703 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:PremiumAccountAlertCC = new PremiumAccountAlertCC();
         _loc2_.needShowNotificationCompletionPremium = this.Renamed10699.decode(param1) as Boolean;
         _loc2_.needShowWelcomeAlert = this.Renamed10700.decode(param1) as Boolean;
         _loc2_.reminderCompletionPremiumTime = this.Renamed10701.decode(param1) as Number;
         _loc2_.wasShowAlertForFirstPurchasePremium = this.Renamed10702.decode(param1) as Boolean;
         _loc2_.wasShowReminderCompletionPremium = this.Renamed10703.decode(param1) as Boolean;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:PremiumAccountAlertCC = PremiumAccountAlertCC(param2);
         this.Renamed10699.encode(param1,_loc3_.needShowNotificationCompletionPremium);
         this.Renamed10700.encode(param1,_loc3_.needShowWelcomeAlert);
         this.Renamed10701.encode(param1,_loc3_.reminderCompletionPremiumTime);
         this.Renamed10702.encode(param1,_loc3_.wasShowAlertForFirstPurchasePremium);
         this.Renamed10703.encode(param1,_loc3_.wasShowReminderCompletionPremium);
         return 4;
      }
   }
}

