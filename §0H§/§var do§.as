package §0H§
{
   import §?#f§.§8#o§;
   import §`"b§.§if for else§;
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §var do§ extends §return package if§
   {
      private var §while for function§:§8#o§;
      
      public var modelId:int;
      
      public function §var do§()
      {
         super();
         this.modelId = 48;
         this.§while for function§ = §8#o§(modelRegistry.getModel(Long.getLong(575618390,177970779)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §override var in§.§]!A§:
               this.§var const native§(param1);
               break;
            case §override var in§.§;!K§:
               this.§`#%§(param1);
               break;
            case §override var in§.§do package get§:
               this.§4"c§(param1);
               break;
            case §override var in§.§3!Y§:
               this.userConnect(param1);
               break;
            case §override var in§.§]"F§:
               this.§dynamic var native§(param1);
         }
      }
      
      private function §var const native§(param1:Object) : void
      {
         this.§while for function§.§var const native§(param1.usersStat);
      }
      
      private function §`#%§(param1:Object) : void
      {
         OSGi.getInstance().registerService(§if for else§,this.§while for function§);
         this.§while for function§.putInitParams(param1.initParams);
         this.§while for function§.objectLoaded();
         this.§while for function§.objectLoadedPost();
      }
      
      private function §4"c§(param1:Object) : void
      {
         this.§while for function§.§4"c§(param1.usersStat);
      }
      
      private function userConnect(param1:Object) : void
      {
         this.§while for function§.userConnect(param1.userId,param1.usersInfo);
      }
      
      private function §dynamic var native§(param1:Object) : void
      {
         this.§while for function§.§dynamic var native§(param1.userId);
      }
   }
}

