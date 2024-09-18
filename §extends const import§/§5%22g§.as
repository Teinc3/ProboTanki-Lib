package §extends const import§
{
   import alternativa.tanks.servermodels.loginbyhash.LoginByHashModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §5"g§ extends §return package if§
   {
      private var §&"o§:LoginByHashModel;
      
      public var modelId:int;
      
      public function §5"g§()
      {
         super();
         this.modelId = 1;
         this.§&"o§ = LoginByHashModel(modelRegistry.getModel(Long.getLong(0,300020019)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §41§.§with for extends§:
               this.rememberUsersHash(param1);
               break;
            case §41§.§else static§:
               this.loginByHashFailed(param1);
         }
      }
      
      private function rememberUsersHash(param1:Object) : void
      {
         this.§&"o§.rememberUsersHash(param1.hash);
      }
      
      private function loginByHashFailed(param1:Object) : void
      {
         this.§&"o§.loginByHashFailed();
      }
   }
}

