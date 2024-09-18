package Renamed459
{
   import Renamed150.Renamed2745;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed9131 extends Renamed4886
   {
      private var Renamed9132:Renamed2745;
      
      public var modelId:int;
      
      public function Renamed9131()
      {
         super();
         this.modelId = 40;
         this.Renamed9132 = Renamed2745(modelRegistry.getModel(Long.getLong(528941690,1765829096)));
         Renamed2775 = TankUsersRegistry(OSGi.getInstance().getService(TankUsersRegistry));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9133.Renamed9134:
               this.suicide(param1);
         }
      }
      
      private function suicide(param1:Object) : void
      {
         this.Renamed9132.suicide(Renamed2775.Renamed695(param1.tankId),param1.respawnDelay);
      }
   }
}

