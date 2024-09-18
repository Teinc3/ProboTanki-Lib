package Renamed425
{
   import Renamed245.Renamed6624;
   import alternativa.tanks.model.useremailandpassword.UserEmailAndPasswordModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import scpacker.gui.RecoveryWindow;
   
   public class Renamed8763 extends Renamed4886
   {
      private var Renamed7578:UserEmailAndPasswordModel;
      
      public var modelId:int;
      
      public function Renamed8763()
      {
         super();
         this.modelId = 24;
         this.Renamed7578 = UserEmailAndPasswordModel(modelRegistry.getModel(Long.getLong(0,300050070)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8764.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed8764.Renamed8765:
               this.Renamed8766(param1);
               break;
            case Renamed8764.Renamed8767:
               this.activateMessage(param1);
               break;
            case Renamed8764.Renamed8768:
               this.emailConfirmed(param1);
               break;
            case Renamed8764.Renamed8769:
               this.Renamed2287();
               break;
            case Renamed8764.Renamed8770:
               this.Renamed2289();
               break;
            case Renamed8764.Renamed8771:
               this.Renamed2290();
               break;
            case Renamed8764.Renamed8772:
               this.Renamed2291();
               break;
            case Renamed8764.Renamed8773:
               this.passwordChanged();
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed7578.putInitParams(new Renamed6624(param1.email,param1.emailConfirmed));
         this.Renamed7578.objectLoaded();
      }
      
      private function Renamed8766(param1:Object) : void
      {
         var Renamed8774:Object = param1;
         new RecoveryWindow(function(param1:String, param2:String):void
         {
            network.send(new Renamed8756(param1,param2));
         },Renamed8774.email);
      }
      
      private function activateMessage(param1:Object) : void
      {
         this.Renamed7578.activateMessage(param1.message);
      }
      
      private function emailConfirmed(param1:Object) : void
      {
         this.Renamed7578.emailConfirmed(param1.email);
      }
      
      private function Renamed2287() : void
      {
         this.Renamed7578.Renamed2287();
      }
      
      private function Renamed2289() : void
      {
         this.Renamed7578.Renamed2289();
      }
      
      private function Renamed2290() : void
      {
         this.Renamed7578.Renamed2290();
      }
      
      private function Renamed2291() : void
      {
         this.Renamed7578.Renamed2291();
      }
      
      private function passwordChanged() : void
      {
         this.Renamed7578.passwordChanged();
      }
   }
}

