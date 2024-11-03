package Renamed5645
{
   import alternativa.tanks.servermodels.EntranceModel;
   import alternativa.tanks.servermodels.login.LoginModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed5653 extends Renamed4886
   {
      private var Renamed5654:LoginModel;
      
      private var Renamed5655:EntranceModel;
      
      public var modelId:int;
      
      public function Renamed5653()
      {
         super();
         this.modelId = 0;
         this.Renamed5654 = LoginModel(modelRegistry.getModel(Long.getLong(0,300020020)));
         this.Renamed5655 = EntranceModel(modelRegistry.getModel(Long.getLong(0,300020011)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed5656.Renamed5657:
               this.enter();
               break;
            case Renamed5656.Renamed5658:
               this.wrongPassword();
         }
      }
      
      public function wrongPassword() : void
      {
         this.Renamed5654.wrongPassword();
      }
      
      public function enter() : void
      {
         this.Renamed5655.objectUnloaded();
         this.Renamed5655.objectUnloadedPost();
      }
   }
}

