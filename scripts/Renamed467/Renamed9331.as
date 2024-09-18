package Renamed467
{
   import Renamed224.Renamed4580;
   import Renamed224.Renamed4581;
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed9331 extends Renamed4886
   {
      private var Renamed9332:Renamed4581;
      
      public var modelId:int;
      
      public function Renamed9331()
      {
         super();
         this.modelId = 71;
         this.Renamed9332 = Renamed4581(modelRegistry.getModel(Long.getLong(1012996430,-1521107309)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9323.Renamed9327:
               this.Renamed5492(param1);
               break;
            case Renamed9323.Renamed9326:
               this.Renamed5478(param1);
               break;
            case Renamed9323.Renamed9324:
               this.Renamed5498(param1);
               break;
            case Renamed9323.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed9323.Renamed9325:
               this.Renamed5488(param1);
         }
      }
      
      private function Renamed5492(param1:Object) : void
      {
         this.Renamed9332.Renamed5492(param1.flagId,param1.position);
      }
      
      private function Renamed5478(param1:Object) : void
      {
         this.Renamed9332.Renamed5478(param1.flagId,param1.tankId);
      }
      
      private function Renamed5498(param1:Object) : void
      {
         this.Renamed9332.Renamed5498(param1.flagId,param1.baseId,param1.delivererTankId);
      }
      
      private function Renamed5162(param1:Object) : void
      {
         OSGi.getInstance().registerService(Renamed4580,this.Renamed9332);
         this.Renamed9332.putInitParams(param1.initParams);
         this.Renamed9332.objectLoadedPost();
      }
      
      private function Renamed5488(param1:Object) : void
      {
         this.Renamed9332.Renamed5488(param1.flagId,param1.tank);
      }
   }
}

