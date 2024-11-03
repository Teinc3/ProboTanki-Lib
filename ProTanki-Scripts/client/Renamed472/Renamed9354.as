package Renamed9348
{
   import Renamed2615.Renamed2616;
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import Renamed97.Renamed98;
   
   public class Renamed9350 extends Renamed4886
   {
      private var Renamed116:Renamed98;
      
      public var modelId:int;
      
      public function Renamed9350()
      {
         super();
         this.modelId = 44;
         this.Renamed116 = Renamed98(modelRegistry.getModel(Long.getLong(183455729,-2099733819)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9351.Renamed9352:
               this.Renamed6020(param1);
               break;
            case Renamed9351.Renamed6457:
               this.Renamed5744(param1);
               break;
            case Renamed9351.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed9351.Renamed9353:
               this.Renamed6021(param1);
               break;
            case Renamed9351.Renamed6460:
               this.userConnect(param1);
               break;
            case Renamed9351.Renamed6458:
               this.Renamed5747(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         OSGi.getInstance().registerService(Renamed2616,this.Renamed116);
         this.Renamed116.putInitParams(param1.initParams);
         this.Renamed116.objectLoaded();
         this.Renamed116.objectLoadedPost();
      }
      
      private function Renamed5744(param1:Object) : void
      {
         this.Renamed116.Renamed5744(param1.usersStat,param1.team);
      }
      
      private function Renamed6020(param1:Object) : void
      {
         this.Renamed116.Renamed6020(param1.team,param1.score);
      }
      
      private function Renamed6021(param1:Object) : void
      {
         this.Renamed116.Renamed6021(param1.redUsers,param1.blueUsers);
      }
      
      private function userConnect(param1:Object) : void
      {
         this.Renamed116.userConnect(param1.userId,param1.usersInfo,param1.team);
      }
      
      private function Renamed5747(param1:Object) : void
      {
         this.Renamed116.Renamed5747(param1.userId);
      }
   }
}

