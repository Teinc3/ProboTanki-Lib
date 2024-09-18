package §'"f§
{
   import alternativa.tanks.model.garage.availableitems.AvailableItemsModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   
   public class §03§ extends §return package if§
   {
      private var §override package implements§:AvailableItemsModel;
      
      public var modelId:int;
      
      public function §03§()
      {
         super();
         this.modelId = 27;
         this.§override package implements§ = AvailableItemsModel(modelRegistry.getModel(Long.getLong(0,300050003)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §-!m§.§catch catch use§:
               this.showAvailableItems(param1);
         }
      }
      
      private function showAvailableItems(param1:Object) : void
      {
         this.§override package implements§.showAvailableItems(param1.items);
      }
   }
}

