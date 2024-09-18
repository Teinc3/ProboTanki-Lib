package alternativa.tanks.models.battle.battlefield
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   public class §>#=§
   {
      [Inject]
      public static var § "#§:IDisplay;
      
      [Inject]
      public static var §^"<§:BattleInputService;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const §true const extends§:uint = Keyboard.F8;
      
      public function §>#=§()
      {
         super();
         § "#§.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == §true const extends§ && !§^"<§.§false set true§())
         {
            battleService.§3l§().§override package catch§();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         § "#§.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
   }
}

