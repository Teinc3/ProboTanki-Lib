package §true set dynamic§
{
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import projects.tanks.clients.flash.commons.models.layout.notify.LobbyLayoutNotifyModel;
   
   public class §!0§ extends §return package if§
   {
      private var §]#,§:LobbyLayoutNotifyModel;
      
      public var modelId:int;
      
      public function §!0§()
      {
         super();
         this.modelId = 12;
         this.§]#,§ = LobbyLayoutNotifyModel(modelRegistry.getModel(Long.getLong(0,300070012)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §^#S§.§,!2§:
               this.beginLayoutSwitch(param1);
               break;
            case §^#S§.§override const static§:
               this.endLayoutSwitch(param1);
         }
      }
      
      private function beginLayoutSwitch(param1:Object) : void
      {
         this.§]#,§.beginLayoutSwitch(param1.state);
      }
      
      private function endLayoutSwitch(param1:Object) : void
      {
         this.§]#,§.endLayoutSwitch(param1.origin,param1.state);
      }
   }
}

