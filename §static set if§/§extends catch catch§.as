package §static set if§
{
   import §4#U§.§<"+§;
   import alternativa.tanks.model.useremailandpassword.UserEmailAndPasswordModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import scpacker.gui.RecoveryWindow;
   
   public class §extends catch catch§ extends §return package if§
   {
      private var §implements set finally§:UserEmailAndPasswordModel;
      
      public var modelId:int;
      
      public function §extends catch catch§()
      {
         super();
         this.modelId = 24;
         this.§implements set finally§ = UserEmailAndPasswordModel(modelRegistry.getModel(Long.getLong(0,300050070)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §^# §.§;!K§:
               this.§`#%§(param1);
               break;
            case §^# §.§if do§:
               this.§-"Z§(param1);
               break;
            case §^# §.§import package try§:
               this.activateMessage(param1);
               break;
            case §^# §.§import if§:
               this.emailConfirmed(param1);
               break;
            case §^# §.§""!§:
               this.§6!B§();
               break;
            case §^# §.§+!c§:
               this.§each package each§();
               break;
            case §^# §.§6"_§:
               this.§finally package package§();
               break;
            case §^# §.§package extends§:
               this.§use catch use§();
               break;
            case §^# §.§2]§:
               this.passwordChanged();
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         this.§implements set finally§.putInitParams(new §<"+§(param1.email,param1.emailConfirmed));
         this.§implements set finally§.objectLoaded();
      }
      
      private function §-"Z§(param1:Object) : void
      {
         var §-#H§:Object = param1;
         new RecoveryWindow(function(param1:String, param2:String):void
         {
            network.send(new §5!_§(param1,param2));
         },§-#H§.email);
      }
      
      private function activateMessage(param1:Object) : void
      {
         this.§implements set finally§.activateMessage(param1.message);
      }
      
      private function emailConfirmed(param1:Object) : void
      {
         this.§implements set finally§.emailConfirmed(param1.email);
      }
      
      private function §6!B§() : void
      {
         this.§implements set finally§.§6!B§();
      }
      
      private function §each package each§() : void
      {
         this.§implements set finally§.§each package each§();
      }
      
      private function §finally package package§() : void
      {
         this.§implements set finally§.§finally package package§();
      }
      
      private function §use catch use§() : void
      {
         this.§implements set finally§.§use catch use§();
      }
      
      private function passwordChanged() : void
      {
         this.§implements set finally§.passwordChanged();
      }
   }
}

