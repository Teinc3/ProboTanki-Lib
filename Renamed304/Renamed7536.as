package Renamed304
{
   import alternativa.tanks.models.weapon.smoky.Renamed47;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed7536 extends Renamed4886
   {
      private var Renamed102:Renamed47;
      
      public var modelId:int;
      
      public function Renamed7536()
      {
         super();
         this.modelId = 49;
         this.Renamed102 = Renamed47(modelRegistry.getModel(Long.getLong(505740619,208573179)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7529.Renamed7531:
               this.Renamed3495(param1);
               break;
            case Renamed7529.Renamed7535:
               this.Renamed3454(param1);
               break;
            case Renamed7529.Renamed7533:
               this.Renamed3493(param1);
               break;
            case Renamed7529.Renamed7534:
               this.Renamed3494(param1);
         }
      }
      
      private function Renamed3454(param1:Object) : void
      {
         this.Renamed102.Renamed3454(Renamed2775.Renamed695(param1.shooter));
      }
      
      private function Renamed3493(param1:Object) : void
      {
         this.Renamed102.Renamed3493(Renamed2775.Renamed695(param1.shooter),param1.hitPoint);
      }
      
      private function Renamed3494(param1:Object) : void
      {
         this.Renamed102.Renamed3494(Renamed2775.Renamed695(param1.shooter),Renamed2775.Renamed695(param1.target),param1.hitPoint,param1.weakeningCoeff,param1.isCritical);
      }
      
      private function Renamed3495(param1:Object) : void
      {
         this.Renamed102.Renamed3495(Renamed2775.Renamed695(param1.target));
      }
   }
}

