package §`Q§
{
   import alternativa.tanks.model.news.NewsShowingModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §6"w§ extends §return package if§
   {
      private var §^#O§:NewsShowingModel;
      
      public var modelId:int;
      
      public function §6"w§()
      {
         super();
         this.modelId = 68;
         this.§^#O§ = NewsShowingModel(modelRegistry.getModel(Long.getLong(0,300050034)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §implements set implements§.§;!K§:
               this.§`#%§(param1);
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         this.§^#O§.putInitParams(param1.initParams);
         this.§^#O§.objectLoaded();
      }
   }
}

