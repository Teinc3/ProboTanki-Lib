package Renamed354
{
   import alternativa.tanks.servermodels.loginbyhash.LoginByHashModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed8121 extends Renamed4886
   {
      private var Renamed8122:LoginByHashModel;
      
      public var modelId:int;
      
      public function Renamed8121()
      {
         super();
         this.modelId = 1;
         this.Renamed8122 = LoginByHashModel(modelRegistry.getModel(Long.getLong(0,300020019)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8117.Renamed8119:
               this.rememberUsersHash(param1);
               break;
            case Renamed8117.Renamed8120:
               this.loginByHashFailed(param1);
         }
      }
      
      private function rememberUsersHash(param1:Object) : void
      {
         this.Renamed8122.rememberUsersHash(param1.hash);
      }
      
      private function loginByHashFailed(param1:Object) : void
      {
         this.Renamed8122.loginByHashFailed();
      }
   }
}

