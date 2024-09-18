package Renamed7273
{
   import alternativa.tanks.models.weapon.shaft.Renamed45;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import Renamed79.Renamed81;
   
   public class Renamed7297 extends Renamed4886
   {
      private var Renamed109:Renamed45;
      
      private var Renamed7298:Renamed81;
      
      public var modelId:int;
      
      public function Renamed7297()
      {
         super();
         this.modelId = 50;
         this.Renamed109 = Renamed45(modelRegistry.getModel(Long.getLong(170467452,-1685189911)));
         this.Renamed7298 = Renamed81(modelRegistry.getModel(Long.getLong(1691794381,-1794202080)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7275.Renamed7277:
               this.Renamed3167(param1);
               break;
            case Renamed7275.Renamed7284:
               this.Renamed7299(param1);
               break;
            case Renamed7275.Renamed6871:
               this.fire(param1);
               break;
            case Renamed7275.Renamed7280:
               this.Renamed7300(param1);
               break;
            case Renamed7275.Renamed7288:
               this.Renamed3165(param1);
               break;
            case Renamed7275.Renamed7285:
               this.Renamed7301(param1);
         }
      }
      
      private function Renamed3167(param1:Object) : void
      {
         this.Renamed109.Renamed3167(Renamed2775.Renamed695(param1.shooter));
      }
      
      private function Renamed7299(param1:Object) : void
      {
         this.Renamed7298.Renamed7299(Renamed2775.Renamed695(param1.shooterId),Renamed2775.Renamed695(param1.targetTank),param1.localSpotPosition);
      }
      
      private function fire(param1:Object) : void
      {
         this.Renamed109.fire(Renamed2775.Renamed695(param1.shooter),param1.staticHitPoint,param1.targets,param1.targetHitPoints,param1.impactForce);
      }
      
      private function Renamed7300(param1:Object) : void
      {
         this.Renamed7298.Renamed7300(Renamed2775.Renamed695(param1.shooterId));
      }
      
      private function Renamed3165(param1:Object) : void
      {
         this.Renamed109.Renamed3163(Renamed2775.Renamed695(param1.shooter));
      }
      
      private function Renamed7301(param1:Object) : void
      {
         this.Renamed7298.Renamed7301(Renamed2775.Renamed695(param1.shooterId),param1.projectionOnVerticalAxis);
      }
   }
}

