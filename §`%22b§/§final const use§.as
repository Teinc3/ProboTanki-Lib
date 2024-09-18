package §`"b§
{
   import §%"v§.§>"G§;
   import §]#1§.§^;§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.battle.gui.chat.§3"Q§;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.spectatorservice.SpectatorService;
   import alternativa.tanks.utils.BitMask;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import §switch const super§.§do catch return§;
   import §with var import§.§ #X§;
   
   public class §final const use§
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var §!k§:SpectatorService;
      
      [Inject]
      public static var §!O§:BattleInputService;
      
      [Inject]
      public static var §6"-§:BattleGUIService;
      
      private static const §06§:uint = Keyboard.BACKSLASH;
      
      private static const §null var for§:int = 1;
      
      private static const §true var default§:int = 1 << 1;
      
      private static const CHAT:int = 1 << 2;
      
      private static const § "%§:int = 1 << 3;
      
      private static const §;1§:int = 1 << 4;
      
      private static const §with set else§:int = 1 << 5;
      
      private static const §null for catch§:int = 1 << 6;
      
      private static const §<0§:int = 1 << 7;
      
      private static const §&"5§:Array = [§<0§ | § "%§ | §;1§ | §with set else§ | §null for catch§ | CHAT | §null var for§ | §true var default§,§<0§ | § "%§ | §;1§ | §with set else§ | §null for catch§ | CHAT,§<0§ | § "%§ | §;1§ | §with set else§ | §null for catch§,§null for catch§,0];
      
      private var chat:§3"Q§;
      
      private var §continue catch finally§:§do catch return§;
      
      private var §6"]§:§ #X§;
      
      private var §>"$§:§>"G§;
      
      private var §switch var extends§:§^;§;
      
      private var §-"H§:int;
      
      public function §final const use§(param1:§3"Q§, param2:§do catch return§, param3:§>"G§, param4:§ #X§, param5:§^;§)
      {
         super();
         this.chat = param1;
         this.§continue catch finally§ = param2;
         this.§>"$§ = param3;
         this.§6"]§ = param4;
         this.§switch var extends§ = param5;
         this.§-"H§ = 0;
         this.§finally const include§(this.§-"H§);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(!§!O§.§false set true§() && param1.keyCode == §06§)
         {
            this.§get catch final§();
         }
      }
      
      private function §get catch final§() : void
      {
         this.§-"H§ = (this.§-"H§ + 1) % §&"5§.length;
         this.§finally const include§(this.§-"H§);
      }
      
      private function §finally const include§(param1:int) : void
      {
         var _loc2_:BitMask = null;
         _loc2_ = new BitMask(§&"5§[param1]);
         panelView.§+#,§().visible = _loc2_.hasAnyBit(§null var for§);
         this.§switch var extends§.visible = _loc2_.hasAnyBit(§true var default§) && settingsService.showFPS;
         this.chat.visible = _loc2_.hasAnyBit(CHAT);
         this.§continue catch finally§.visible = _loc2_.hasAnyBit(§ "%§);
         this.§>"$§.visible = _loc2_.hasAnyBit(§;1§);
         this.§6"]§.visible = _loc2_.hasAnyBit(§with set else§);
         §!k§.§include for native§(_loc2_.hasAnyBit(§null for catch§));
         §6"-§.§break catch true§().visible = _loc2_.hasAnyBit(§<0§);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         panelView.§+#,§().visible = true;
         §6"-§.§break catch true§().visible = true;
         this.§switch var extends§.visible = true;
         this.chat = null;
         this.§continue catch finally§ = null;
         this.§>"$§ = null;
         this.§6"]§ = null;
         this.§switch var extends§ = null;
      }
   }
}

