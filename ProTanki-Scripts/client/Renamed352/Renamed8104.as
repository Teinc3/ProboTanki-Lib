package Renamed352
{
   import alternativa.tanks.servermodels.registartion.password.PasswordRegistrationModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import projects.tanks.client.entrance.model.entrance.registration.RegistrationModelCC;
   
   public class Renamed8104 extends Renamed4886
   {
      private var Renamed8105:PasswordRegistrationModel;
      
      public var modelId:int;
      
      public function Renamed8104()
      {
         super();
         this.modelId = 8;
         this.Renamed8105 = PasswordRegistrationModel(modelRegistry.getModel(Long.getLong(0,300020025)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8090.Renamed8093:
               this.Renamed8106(param1);
               break;
            case Renamed8090.Renamed8095:
               this.enteredUidIsBusy(param1);
               break;
            case Renamed8090.Renamed8097:
               this.enteredUidIsFree();
               break;
            case Renamed8090.Renamed8091:
               this.enteredUidIsIncorrect();
         }
      }
      
      private function Renamed8106(param1:Object) : void
      {
         var _loc2_:RegistrationModelCC = new RegistrationModelCC();
         _loc2_.bgResource = param1.bgResource;
         _loc2_.enableRequiredEmail = param1.enableRequiredEmail;
         _loc2_.maxPasswordLength = param1.maxPasswordLength;
         _loc2_.minPasswordLength = param1.minPasswordLength;
         this.Renamed8105.putInitParams(_loc2_);
         this.Renamed8105.objectLoaded();
      }
      
      private function enteredUidIsFree() : void
      {
         this.Renamed8105.enteredUidIsFree();
      }
      
      private function enteredUidIsIncorrect() : void
      {
         this.Renamed8105.enteredUidIsIncorrect();
      }
      
      private function enteredUidIsBusy(param1:Object) : void
      {
         this.Renamed8105.enteredUidIsBusy(param1.advicedUids);
      }
   }
}

