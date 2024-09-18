package alternativa.tanks.models.battle.gui.chat
{
   import § !g§.§class for case§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.model.ChatSettingsTracker;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import §for for class§.ChatModelBase;
   import §for for class§.IChatModelBase;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class ChatModel extends ChatModelBase implements IChatModelBase, §finally else§, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var §]!W§:BattleGUIService;
      
      private var §9"§:§3"Q§;
      
      private var §true var§:String;
      
      private var §?"g§:§=+§;
      
      private var §`"^§:ChatSettingsTracker;
      
      public function ChatModel()
      {
         super();
         this.§9"§ = new §3"Q§();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.§9"§.clear();
         this.§9"§.locked = false;
         this.§9"§.addEventListener(§!&§.SEND_MESSAGE,this.§break var default§);
         §]!W§.§break catch true§().addChild(this.§9"§);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this.§true var§ = "";
         this.§?"g§ = new §=+§(this.§9"§);
         this.§`"^§ = new ChatSettingsTracker(this.§9"§);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.§9"§.removeEventListener(§!&§.SEND_MESSAGE,this.§break var default§);
         this.§9"§.clear();
         if(this.§9"§.parent != null)
         {
            this.§9"§.parent.removeChild(this.§9"§);
         }
         this.§?"g§.close();
         this.§`"^§.close();
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      [Obfuscation(rename="false")]
      public function addMessage(param1:String, param2:String, param3:§class for case§) : void
      {
         this.§class const super§(param1,param2,param3);
      }
      
      [Obfuscation(rename="false")]
      public function §native include§(param1:String, param2:String, param3:§class for case§) : void
      {
         this.§class const super§(param1,param2,param3,true);
      }
      
      private function §class const super§(param1:String, param2:String, param3:§class for case§, param4:Boolean = false) : void
      {
         var _loc5_:* = param1 == null;
         this.§9"§.§-#]§(param1,param3,param2 + "\n",param4,_loc5_);
      }
      
      [Obfuscation(rename="false")]
      public function §native set else§(param1:String, param2:String) : void
      {
         this.§9"§.§-#]§(null,§class for case§.NONE,param2 + "\n",true,true);
      }
      
      [Obfuscation(rename="false")]
      public function §use package throw§(param1:String) : void
      {
         this.§9"§.§use package throw§(param1);
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            if(battleInfoService.isSpectatorMode())
            {
               this.§9"§.§8"O§(this.§true var§);
            }
            this.§9"§.§^#`§();
         }
      }
      
      private function §break var default§(param1:§!&§) : void
      {
         server.sendMessage(param1.message,param1.§7"W§);
      }
      
      [Obfuscation(rename="false")]
      public function §0"'§(param1:String) : void
      {
         this.§true var§ = param1;
      }
      
      public function §]#6§() : §3"Q§
      {
         return this.§9"§;
      }
   }
}

