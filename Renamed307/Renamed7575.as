package Renamed4971
{
   import Renamed4533.Renamed6151;
   import Renamed290.Renamed4535;
   import alternativa.tanks.model.settings.SettingsModel;
   import alternativa.tanks.model.useremailandpassword.UserEmailAndPasswordModel;
   import alternativa.types.Long;
   import Renamed374.Renamed2180;
   import Renamed385.Renamed4886;
   
   public class Renamed7575 extends Renamed4886
   {
      private var Renamed7576:SettingsModel;
      
      private var Renamed7577:Renamed4535;
      
      private var Renamed7578:UserEmailAndPasswordModel;
      
      public var modelId:int;
      
      public function Renamed7575()
      {
         super();
         this.modelId = 23;
         this.Renamed7576 = SettingsModel(modelRegistry.getModel(Long.getLong(1428989873,1951780812)));
         this.Renamed7577 = Renamed4535(modelRegistry.getModel(Long.getLong(1190039526,-1224288945)));
         this.Renamed7578 = UserEmailAndPasswordModel(modelRegistry.getModel(Long.getLong(0,300050070)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed7569.Renamed7572:
               this.openSettings(param1);
               break;
            case Renamed7569.Renamed7570:
               this.Renamed7579(param1);
         }
      }
      
      private function openSettings(param1:Object) : void
      {
         this.Renamed7577.putInitParams(new Renamed6151(param1.notificationEnabled));
         this.Renamed7577.objectLoaded();
         this.Renamed7576.openSettings(Renamed2180.ALL);
      }
      
      private function Renamed7579(param1:Object) : void
      {
         this.Renamed7576.Renamed2187();
      }
   }
}

