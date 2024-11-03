package Renamed318
{
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import Renamed87.Renamed88;
   
   public class Renamed7689 extends Renamed4886
   {
      private var Renamed114:Renamed88;
      
      public var modelId:int;
      
      public function Renamed7689()
      {
         super();
         this.modelId = 62;
         this.Renamed114 = Renamed88(modelRegistry.getModel(Long.getLong(479007306,2075268288)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7682.Renamed7685:
               this.Renamed7690(param1);
               break;
            case Renamed7682.Renamed7684:
               this.Renamed7691(param1);
               break;
            case Renamed7682.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed7682.Renamed7687:
               this.Renamed7692(param1);
               break;
            case Renamed7682.Renamed7683:
               this.Renamed7693(param1);
         }
      }
      
      private function Renamed7690(param1:Object) : void
      {
         this.Renamed114.Renamed7690(param1.mineId);
      }
      
      private function Renamed7691(param1:Object) : void
      {
         this.Renamed114.Renamed7691(param1.mineId,param1.targetId);
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed114.putInitParams(param1.initParams);
         this.Renamed114.objectLoaded();
      }
      
      private function Renamed7692(param1:Object) : void
      {
         this.Renamed114.Renamed7692(param1.mineId,param1.x,param1.y,param1.z,param1.userId);
      }
      
      private function Renamed7693(param1:Object) : void
      {
         this.Renamed114.Renamed7693(param1.ownerId);
      }
   }
}

