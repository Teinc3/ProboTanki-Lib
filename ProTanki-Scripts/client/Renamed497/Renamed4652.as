package Renamed2615
{
   import Renamed5196.Renamed5197;
   import Renamed477.Renamed4632;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.battle.gui.chat.Renamed2568;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.spectatorservice.SpectatorService;
   import alternativa.tanks.utils.BitMask;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import Renamed431.Renamed4709;
   import Renamed465.Renamed9295;
   
   public class Renamed4652
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var Renamed2545:SpectatorService;
      
      [Inject]
      public static var Renamed4725:BattleInputService;
      
      [Inject]
      public static var Renamed4726:BattleGUIService;
      
      private static const Renamed9683:uint = Keyboard.BACKSLASH;
      
      private static const Renamed9684:int = 1;
      
      private static const Renamed9685:int = 1 << 1;
      
      private static const CHAT:int = 1 << 2;
      
      private static const Renamed9686:int = 1 << 3;
      
      private static const Renamed9687:int = 1 << 4;
      
      private static const Renamed9688:int = 1 << 5;
      
      private static const Renamed9689:int = 1 << 6;
      
      private static const Renamed4957:int = 1 << 7;
      
      private static const Renamed9690:Array = [Renamed4957 | Renamed9686 | Renamed9687 | Renamed9688 | Renamed9689 | CHAT | Renamed9684 | Renamed9685,Renamed4957 | Renamed9686 | Renamed9687 | Renamed9688 | Renamed9689 | CHAT,Renamed4957 | Renamed9686 | Renamed9687 | Renamed9688 | Renamed9689,Renamed9689,0];
      
      private var chat:Renamed2568;
      
      private var Renamed9691:Renamed4709;
      
      private var Renamed9692:Renamed9295;
      
      private var Renamed9693:Renamed5197;
      
      private var Renamed9668:Renamed4632;
      
      private var Renamed9694:int;
      
      public function Renamed4652(param1:Renamed2568, param2:Renamed4709, param3:Renamed5197, param4:Renamed9295, param5:Renamed4632)
      {
         super();
         this.chat = param1;
         this.Renamed9691 = param2;
         this.Renamed9693 = param3;
         this.Renamed9692 = param4;
         this.Renamed9668 = param5;
         this.Renamed9694 = 0;
         this.Renamed9695(this.Renamed9694);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(!Renamed4725.Renamed728() && param1.keyCode == Renamed9683)
         {
            this.Renamed9696();
         }
      }
      
      private function Renamed9696() : void
      {
         this.Renamed9694 = (this.Renamed9694 + 1) % Renamed9690.length;
         this.Renamed9695(this.Renamed9694);
      }
      
      private function Renamed9695(param1:int) : void
      {
         var _loc2_:BitMask = null;
         _loc2_ = new BitMask(Renamed9690[param1]);
         panelView.Renamed2160().visible = _loc2_.hasAnyBit(Renamed9684);
         this.Renamed9668.visible = _loc2_.hasAnyBit(Renamed9685) && settingsService.showFPS;
         this.chat.visible = _loc2_.hasAnyBit(CHAT);
         this.Renamed9691.visible = _loc2_.hasAnyBit(Renamed9686);
         this.Renamed9693.visible = _loc2_.hasAnyBit(Renamed9687);
         this.Renamed9692.visible = _loc2_.hasAnyBit(Renamed9688);
         Renamed2545.Renamed3831(_loc2_.hasAnyBit(Renamed9689));
         Renamed4726.Renamed2575().visible = _loc2_.hasAnyBit(Renamed4957);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         panelView.Renamed2160().visible = true;
         Renamed4726.Renamed2575().visible = true;
         this.Renamed9668.visible = true;
         this.chat = null;
         this.Renamed9691 = null;
         this.Renamed9693 = null;
         this.Renamed9692 = null;
         this.Renamed9668 = null;
      }
   }
}

