package Renamed4257
{
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import projects.tanks.clients.flash.commons.models.layout.LobbyLayoutModel;
   
   public class Renamed5174 extends Renamed4886
   {
      private static var Renamed5175:LobbyLayoutModel;
      
      public var modelId:int;
      
      public function Renamed5174()
      {
         super();
         Renamed5175 = LobbyLayoutModel(modelRegistry.getModel(Long.getLong(0,300070010)));
      }
      
      public function invoke(param1:Object) : void
      {
         var _loc2_:* = param1.getPacketId();
         switch(0)
         {
         }
      }
   }
}

