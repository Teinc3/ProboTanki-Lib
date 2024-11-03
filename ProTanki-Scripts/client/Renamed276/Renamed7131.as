package Renamed6836
{
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckModel;
   
   public class Renamed7131 extends Renamed4886
   {
      private var Renamed7132:UidCheckModel;
      
      public var modelId:int;
      
      public function Renamed7131()
      {
         super();
         this.modelId = 35;
         this.Renamed7132 = UidCheckModel(modelRegistry.getModel(Long.getLong(1543089237,611543143)));
         this.Renamed7132.objectLoaded();
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7133.Renamed7134:
               this.validateResult(param1);
         }
      }
      
      private function validateResult(param1:Object) : void
      {
         this.Renamed7132.validateResult(param1.status);
      }
   }
}

