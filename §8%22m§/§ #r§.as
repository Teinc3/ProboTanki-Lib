package §8"m§
{
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckModel;
   
   public class § #r§ extends §return package if§
   {
      private var §#" §:UidCheckModel;
      
      public var modelId:int;
      
      public function § #r§()
      {
         super();
         this.modelId = 35;
         this.§#" § = UidCheckModel(modelRegistry.getModel(Long.getLong(1543089237,611543143)));
         this.§#" §.objectLoaded();
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §`!v§.§%#Y§:
               this.validateResult(param1);
         }
      }
      
      private function validateResult(param1:Object) : void
      {
         this.§#" §.validateResult(param1.status);
      }
   }
}

