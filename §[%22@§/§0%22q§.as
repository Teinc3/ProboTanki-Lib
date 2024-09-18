package §["@§
{
   import §`"b§.§if for else§;
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import §with for function§.§final set native§;
   
   public class §0"q§ extends §return package if§
   {
      private var §get for const§:§final set native§;
      
      public var modelId:int;
      
      public function §0"q§()
      {
         super();
         this.modelId = 44;
         this.§get for const§ = §final set native§(modelRegistry.getModel(Long.getLong(183455729,-2099733819)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §]4§.§=#1§:
               this.§throw set get§(param1);
               break;
            case §]4§.§]!A§:
               this.§var const native§(param1);
               break;
            case §]4§.§;!K§:
               this.§`#%§(param1);
               break;
            case §]4§.§else var do§:
               this.§-!Z§(param1);
               break;
            case §]4§.§3!Y§:
               this.userConnect(param1);
               break;
            case §]4§.§]"F§:
               this.§dynamic var native§(param1);
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         OSGi.getInstance().registerService(§if for else§,this.§get for const§);
         this.§get for const§.putInitParams(param1.initParams);
         this.§get for const§.objectLoaded();
         this.§get for const§.objectLoadedPost();
      }
      
      private function §var const native§(param1:Object) : void
      {
         this.§get for const§.§var const native§(param1.usersStat,param1.team);
      }
      
      private function §throw set get§(param1:Object) : void
      {
         this.§get for const§.§throw set get§(param1.team,param1.score);
      }
      
      private function §-!Z§(param1:Object) : void
      {
         this.§get for const§.§-!Z§(param1.redUsers,param1.blueUsers);
      }
      
      private function userConnect(param1:Object) : void
      {
         this.§get for const§.userConnect(param1.userId,param1.usersInfo,param1.team);
      }
      
      private function §dynamic var native§(param1:Object) : void
      {
         this.§get for const§.§dynamic var native§(param1.userId);
      }
   }
}

