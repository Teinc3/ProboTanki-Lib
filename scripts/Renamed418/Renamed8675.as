package Renamed418
{
   import Renamed4548.Renamed4551;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed8675 extends Renamed4886
   {
      private var Renamed2969:Renamed2407;
      
      private var Renamed5350:Renamed4551;
      
      public var modelId:int;
      
      public function Renamed8675()
      {
         super();
         this.modelId = 39;
         this.Renamed2969 = Renamed2407(modelRegistry.getModel(Long.getLong(500772743,-1275562344)));
         this.Renamed5350 = Renamed4551(modelRegistry.getModel(Long.getLong(1545673170,1705258317)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8676.Renamed8677:
               this.Renamed2897(param1);
               break;
            case Renamed8676.Renamed8678:
               this.Renamed2921(param1);
               break;
            case Renamed8676.Renamed8679:
               this.Renamed2923(param1);
               break;
            case Renamed8676.Renamed8680:
               this.kill(param1);
               break;
            case Renamed8676.Renamed8681:
               this.Renamed2851(param1);
               break;
            case Renamed8676.Renamed8682:
               this.move(param1);
               break;
            case Renamed8676.Renamed8683:
               this.Renamed2846(param1);
               break;
            case Renamed8676.Renamed8684:
               this.Renamed2909(param1);
               break;
            case Renamed8676.Renamed8685:
               this.Renamed1095(param1);
               break;
            case Renamed8676.Renamed8686:
               this.setHealth(param1);
               break;
            case Renamed8676.Renamed8687:
               this.Renamed2918(param1);
               break;
            case Renamed8676.Renamed8688:
               this.Renamed1089(param1);
               break;
            case Renamed8676.Renamed8689:
               this.spawn(param1);
               break;
            case Renamed8676.Renamed8690:
               this.Renamed8691(param1);
         }
      }
      
      private function Renamed2897(param1:Object) : void
      {
         this.Renamed2969.Renamed2897(Renamed2775.Renamed695(param1.tankId));
      }
      
      private function kill(param1:Object) : void
      {
         this.Renamed2969.kill(Renamed2775.Renamed695(param1.tankId),param1.killerTankId,param1.respawnDelay);
      }
      
      private function Renamed2851(param1:Object) : void
      {
         this.Renamed2969.Renamed2851(Renamed2775.Renamed695(param1.tankId),param1.moveCommand,param1.turretDirection);
      }
      
      private function move(param1:Object) : void
      {
         this.Renamed2969.move(Renamed2775.Renamed695(param1.tankId),param1.moveCommand);
      }
      
      private function Renamed2846(param1:Object) : void
      {
         this.Renamed2969.Renamed2846(Renamed2775.Renamed695(param1.tankId),param1.control);
      }
      
      private function Renamed2909(param1:Object) : void
      {
         this.Renamed2969.Renamed2909(param1.position,param1.orientation);
      }
      
      private function Renamed1095(param1:Object) : void
      {
         this.Renamed2969.Renamed1095(Renamed2775.Renamed695(param1.tankId),param1.rotateTurretCommand);
      }
      
      private function setHealth(param1:Object) : void
      {
         this.Renamed2969.setHealth(Renamed2775.Renamed695(param1.tankId),param1.health);
      }
      
      private function spawn(param1:Object) : void
      {
         this.Renamed2969.spawn(Renamed2775.Renamed695(param1.tankId),param1.team,param1.position,param1.orientation,param1.health,param1.incarnationId);
      }
      
      private function Renamed1089(param1:Object) : void
      {
         this.Renamed2969.Renamed1089(Renamed2775.Renamed695(param1.tankId),param1.temperature);
      }
      
      private function Renamed2918(param1:Object) : void
      {
         this.Renamed2969.Renamed2917(Renamed2775.Renamed695(param1.tankId),param1.maxSpeed,param1.maxTurnSpeed,param1.maxTurretRotationSpeed,param1.acceleration,param1.specificationId);
      }
      
      private function Renamed8691(param1:Object) : void
      {
         this.Renamed5350.objectUnloaded();
         this.Renamed2969.objectUnloaded(Renamed2775.Renamed695(param1.tank));
      }
      
      private function Renamed2921(param1:Object) : void
      {
         this.Renamed2969.Renamed2921(Renamed2775.Renamed695(param1.tankId),param1.effectId,param1.duration,param1.activeAfterDeath,param1.effectLevel);
      }
      
      private function Renamed2923(param1:Object) : void
      {
         this.Renamed2969.Renamed2923(Renamed2775.Renamed695(param1.tankId),param1.effectId,false);
      }
   }
}

