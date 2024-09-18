package Renamed452
{
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.models.weapon.machinegun.Renamed44;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed9081 extends Renamed4886
   {
      private var Renamed9082:Renamed44;
      
      public var modelId:int;
      
      public function Renamed9081()
      {
         super();
         this.modelId = 74;
         this.Renamed9082 = Renamed44(modelRegistry.getModel(Long.getLong(1635158664,1411719504)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9083.Renamed9084:
               this.startFire(param1);
               break;
            case Renamed9083.Renamed9085:
               this.Renamed4862(param1);
               break;
            case Renamed9083.Renamed9086:
               this.Renamed3114(param1);
         }
      }
      
      private function startFire(param1:Object) : void
      {
         this.Renamed9082.onStart(Renamed2775.Renamed695(param1.shooter));
      }
      
      private function Renamed4862(param1:Object) : void
      {
         this.Renamed9082.Renamed3124(Renamed2775.Renamed695(param1.shooter));
      }
      
      private function Renamed3114(param1:Object) : void
      {
         this.Renamed9082.Renamed3125(Renamed2775.Renamed695(param1.shooter),Renamed668.Renamed681(param1.direction),param1.targets);
      }
   }
}

