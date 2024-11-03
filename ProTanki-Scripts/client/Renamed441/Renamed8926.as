package Renamed441
{
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import projects.tanks.clients.flash.commons.models.layout.notify.LobbyLayoutNotifyModel;
   
   public class Renamed8926 extends Renamed4886
   {
      private var Renamed8927:LobbyLayoutNotifyModel;
      
      public var modelId:int;
      
      public function Renamed8926()
      {
         super();
         this.modelId = 12;
         this.Renamed8927 = LobbyLayoutNotifyModel(modelRegistry.getModel(Long.getLong(0,300070012)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8928.Renamed8929:
               this.beginLayoutSwitch(param1);
               break;
            case Renamed8928.Renamed8930:
               this.endLayoutSwitch(param1);
         }
      }
      
      private function beginLayoutSwitch(param1:Object) : void
      {
         this.Renamed8927.beginLayoutSwitch(param1.state);
      }
      
      private function endLayoutSwitch(param1:Object) : void
      {
         this.Renamed8927.endLayoutSwitch(param1.origin,param1.state);
      }
   }
}

