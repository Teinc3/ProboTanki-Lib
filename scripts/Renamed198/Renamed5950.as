package Renamed5947
{
   import alternativa.tanks.model.garage.availableitems.AvailableItemsModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed5950 extends Renamed4886
   {
      private var Renamed5951:AvailableItemsModel;
      
      public var modelId:int;
      
      public function Renamed5950()
      {
         super();
         this.modelId = 27;
         this.Renamed5951 = AvailableItemsModel(modelRegistry.getModel(Long.getLong(0,300050003)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed5948.Renamed5949:
               this.showAvailableItems(param1);
         }
      }
      
      private function showAvailableItems(param1:Object) : void
      {
         this.Renamed5951.showAvailableItems(param1.items);
      }
   }
}

