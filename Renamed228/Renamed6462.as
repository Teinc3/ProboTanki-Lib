package Renamed228
{
   import Renamed39.Renamed40;
   import Renamed2615.Renamed2616;
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed6462 extends Renamed4886
   {
      private var Renamed115:Renamed40;
      
      public var modelId:int;
      
      public function Renamed6462()
      {
         super();
         this.modelId = 48;
         this.Renamed115 = Renamed40(modelRegistry.getModel(Long.getLong(575618390,177970779)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed6456.Renamed6457:
               this.Renamed5744(param1);
               break;
            case Renamed6456.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed6456.Renamed6459:
               this.Renamed5745(param1);
               break;
            case Renamed6456.Renamed6460:
               this.userConnect(param1);
               break;
            case Renamed6456.Renamed6458:
               this.Renamed5747(param1);
         }
      }
      
      private function Renamed5744(param1:Object) : void
      {
         this.Renamed115.Renamed5744(param1.usersStat);
      }
      
      private function Renamed5162(param1:Object) : void
      {
         OSGi.getInstance().registerService(Renamed2616,this.Renamed115);
         this.Renamed115.putInitParams(param1.initParams);
         this.Renamed115.objectLoaded();
         this.Renamed115.objectLoadedPost();
      }
      
      private function Renamed5745(param1:Object) : void
      {
         this.Renamed115.Renamed5745(param1.usersStat);
      }
      
      private function userConnect(param1:Object) : void
      {
         this.Renamed115.userConnect(param1.userId,param1.usersInfo);
      }
      
      private function Renamed5747(param1:Object) : void
      {
         this.Renamed115.Renamed5747(param1.userId);
      }
   }
}

