package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.premiumaccount.alert.PremiumAccountAlertCC;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecPremiumAccountAlertCC implements ICodec
   {
      private var §final const default§:ICodec;
      
      private var §set set package§:ICodec;
      
      private var §&"E§:ICodec;
      
      private var §##E§:ICodec;
      
      private var §7#,§:ICodec;
      
      public function CodecPremiumAccountAlertCC(param1:§?"s§)
      {
         super();
         this.§final const default§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§set set package§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§&"E§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.§##E§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§7#,§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:PremiumAccountAlertCC = new PremiumAccountAlertCC();
         _loc2_.needShowNotificationCompletionPremium = this.§final const default§.decode(param1) as Boolean;
         _loc2_.needShowWelcomeAlert = this.§set set package§.decode(param1) as Boolean;
         _loc2_.reminderCompletionPremiumTime = this.§&"E§.decode(param1) as Number;
         _loc2_.wasShowAlertForFirstPurchasePremium = this.§##E§.decode(param1) as Boolean;
         _loc2_.wasShowReminderCompletionPremium = this.§7#,§.decode(param1) as Boolean;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:PremiumAccountAlertCC = PremiumAccountAlertCC(param2);
         this.§final const default§.encode(param1,_loc3_.needShowNotificationCompletionPremium);
         this.§set set package§.encode(param1,_loc3_.needShowWelcomeAlert);
         this.§&"E§.encode(param1,_loc3_.reminderCompletionPremiumTime);
         this.§##E§.encode(param1,_loc3_.wasShowAlertForFirstPurchasePremium);
         this.§7#,§.encode(param1,_loc3_.wasShowReminderCompletionPremium);
         return 4;
      }
   }
}

