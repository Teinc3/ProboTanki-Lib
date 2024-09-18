package §>y§
{
   import alternativa.tanks.servermodels.EntranceModel;
   import alternativa.tanks.servermodels.login.LoginModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §;#?§ extends §return package if§
   {
      private var §while catch package§:LoginModel;
      
      private var §final catch super§:EntranceModel;
      
      public var modelId:int;
      
      public function §;#?§()
      {
         super();
         this.modelId = 0;
         this.§while catch package§ = LoginModel(modelRegistry.getModel(Long.getLong(0,300020020)));
         this.§final catch super§ = EntranceModel(modelRegistry.getModel(Long.getLong(0,300020011)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §do catch with§.§0O§:
               this.enter();
               break;
            case §do catch with§.§2"r§:
               this.wrongPassword();
         }
      }
      
      public function wrongPassword() : void
      {
         this.§while catch package§.wrongPassword();
      }
      
      public function enter() : void
      {
         this.§final catch super§.objectUnloaded();
         this.§final catch super§.objectUnloadedPost();
      }
   }
}

