package alternativa.tanks.models.battle.battlefield
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   public class Renamed2320
   {
      [Inject]
      public static var Renamed2321:IDisplay;
      
      [Inject]
      public static var Renamed718:BattleInputService;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed2322:uint = Keyboard.F8;
      
      public function Renamed2320()
      {
         super();
         Renamed2321.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Renamed2322 && !Renamed718.Renamed728())
         {
            battleService.Renamed621().Renamed1399();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         Renamed2321.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
   }
}

