package Renamed436
{
   import Renamed2615.Renamed2757;
   import alternativa.tanks.models.battle.battlefield.Renamed2417;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed8889 extends Renamed4886
   {
      private var Renamed8890:Renamed2757;
      
      private var Renamed5342:Renamed2417;
      
      public var modelId:int;
      
      public function Renamed8889()
      {
         super();
         this.modelId = 37;
         this.Renamed8890 = Renamed2757(modelRegistry.getModel(Long.getLong(485575169,-17734339)));
         this.Renamed5342 = Renamed2417(modelRegistry.getModel(Long.getLong(1723277227,1936126557)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8883.Renamed8886:
               this.Renamed4215(param1);
               break;
            case Renamed8883.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed8883.Renamed8885:
               this.Renamed8891();
               break;
            case Renamed8883.Renamed8888:
               this.Renamed4216();
               break;
            case Renamed8883.Renamed8884:
               this.Renamed4217(param1);
               break;
            case Renamed8883.Renamed7604:
               this.roundFinish(param1);
               break;
            case Renamed8883.Renamed7615:
               this.roundStart(param1);
               break;
            case Renamed8883.Renamed8887:
               this.Renamed4219(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed8890.putInitParams(param1.initParams);
         this.Renamed8890.objectLoaded();
      }
      
      private function Renamed8891() : void
      {
         this.Renamed8890.objectLoadedPost();
      }
      
      private function Renamed4215(param1:Object) : void
      {
         this.Renamed8890.Renamed4215(param1.fund);
      }
      
      private function Renamed4216() : void
      {
         this.Renamed8890.Renamed4216();
      }
      
      private function Renamed4217(param1:Object) : void
      {
         this.Renamed8890.Renamed4217(param1.userId,param1.newRank);
      }
      
      private function roundFinish(param1:Object) : void
      {
         this.Renamed8890.roundFinish(true,param1.reward,param1.timeToRestart);
         this.Renamed5342.Renamed2502();
      }
      
      private function roundStart(param1:Object) : void
      {
         this.Renamed8890.roundStart(param1.timeLimitInSec,true);
         this.Renamed5342.battleRestart();
      }
      
      private function Renamed4219(param1:Object) : void
      {
         this.Renamed8890.Renamed4219(param1.userId,param1.suspicious);
      }
   }
}

