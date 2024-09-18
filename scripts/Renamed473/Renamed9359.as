package Renamed7249
{
   import Renamed17.Renamed4557;
   import Renamed17.Renamed18;
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed9359 extends Renamed4886
   {
      private var Renamed122:Renamed18;
      
      public var modelId:int;
      
      public function Renamed9359()
      {
         super();
         this.modelId = 42;
         this.Renamed122 = Renamed18(modelRegistry.getModel(Long.getLong(1965338956,1417730743)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9356.Renamed9327:
               this.Renamed5492(param1);
               break;
            case Renamed9356.Renamed9324:
               this.Renamed5498(param1);
               break;
            case Renamed9356.Renamed9326:
               this.Renamed5478(param1);
               break;
            case Renamed9356.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed9356.Renamed9325:
               this.Renamed5488(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         OSGi.getInstance().registerService(Renamed4557,this.Renamed122);
         this.Renamed122.putInitParams(param1.initParams);
         this.Renamed122.objectLoadedPost();
      }
      
      private function Renamed5492(param1:Object) : void
      {
         this.Renamed122.Renamed5492(param1.position,param1.flagTeam);
      }
      
      private function Renamed5498(param1:Object) : void
      {
         this.Renamed122.Renamed5498(param1.winnerTeam,param1.delivererTankId);
      }
      
      private function Renamed5478(param1:Object) : void
      {
         this.Renamed122.Renamed5478(param1.tankId,param1.flagTeam);
      }
      
      private function Renamed5488(param1:Object) : void
      {
         this.Renamed122.Renamed5488(param1.flagTeam,param1.tank);
      }
   }
}

