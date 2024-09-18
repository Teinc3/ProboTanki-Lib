package §else for implements§
{
   import alternativa.tanks.servermodels.registartion.password.PasswordRegistrationModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import projects.tanks.client.entrance.model.entrance.registration.RegistrationModelCC;
   
   public class §try for with§ extends §return package if§
   {
      private var §>k§:PasswordRegistrationModel;
      
      public var modelId:int;
      
      public function §try for with§()
      {
         super();
         this.modelId = 8;
         this.§>k§ = PasswordRegistrationModel(modelRegistry.getModel(Long.getLong(0,300020025)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §7"X§.§break for use§:
               this.§<""§(param1);
               break;
            case §7"X§.§if catch do§:
               this.enteredUidIsBusy(param1);
               break;
            case §7"X§.§if for native§:
               this.enteredUidIsFree();
               break;
            case §7"X§.§continue set include§:
               this.enteredUidIsIncorrect();
         }
      }
      
      private function §<""§(param1:Object) : void
      {
         var _loc2_:RegistrationModelCC = new RegistrationModelCC();
         _loc2_.bgResource = param1.bgResource;
         _loc2_.enableRequiredEmail = param1.enableRequiredEmail;
         _loc2_.maxPasswordLength = param1.maxPasswordLength;
         _loc2_.minPasswordLength = param1.minPasswordLength;
         this.§>k§.putInitParams(_loc2_);
         this.§>k§.objectLoaded();
      }
      
      private function enteredUidIsFree() : void
      {
         this.§>k§.enteredUidIsFree();
      }
      
      private function enteredUidIsIncorrect() : void
      {
         this.§>k§.enteredUidIsIncorrect();
      }
      
      private function enteredUidIsBusy(param1:Object) : void
      {
         this.§>k§.enteredUidIsBusy(param1.advicedUids);
      }
   }
}

