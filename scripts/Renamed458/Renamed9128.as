package Renamed458
{
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.models.weapon.shotgun.Renamed46;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import scpacker.tanks.WeaponsManager;
   
   public class Renamed9126 extends Renamed4886
   {
      private var Renamed110:Renamed46;
      
      public var modelId:int;
      
      public function Renamed9126()
      {
         super();
         this.modelId = 70;
         this.Renamed110 = Renamed46(modelRegistry.getModel(Long.getLong(1366230363,-857495328)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9127.Renamed7535:
               this.Renamed3454(param1);
         }
      }
      
      private function Renamed3454(param1:Object) : void
      {
         this.Renamed110.Renamed3444(Renamed2775.Renamed695(param1.shooter),Renamed668.Renamed681(param1.direction),param1.targets);
         WeaponsManager.Renamed3439(Renamed2775.Renamed695(param1.shooter)).Renamed3444(Renamed2775.Renamed695(param1.shooter),Renamed668.Renamed681(param1.direction),param1.targets);
      }
   }
}

