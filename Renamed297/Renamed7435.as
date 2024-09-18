package Renamed297
{
   import alternativa.types.Long;
   import Renamed325.Renamed2411;
   import Renamed385.Renamed4886;
   import Renamed410.Renamed4706;
   
   public class Renamed7435 extends Renamed4886
   {
      private var Renamed7436:Renamed4706;
      
      private var Renamed7437:Renamed2411;
      
      public var modelId:int;
      
      public function Renamed7435()
      {
         super();
         this.modelId = 41;
         this.Renamed7436 = Renamed4706(modelRegistry.getModel(Long.getLong(499495185,-1001709329)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7438.Renamed5354:
               this.Renamed2486(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed7436.putInitParams(param1.initParams);
      }
      
      private function Renamed7414(param1:Object) : void
      {
         this.Renamed7436.Renamed7414(param1.bonuses);
      }
      
      private function Renamed2486(param1:Object) : void
      {
         this.Renamed7436.Renamed2486(param1.bonusId);
      }
   }
}

