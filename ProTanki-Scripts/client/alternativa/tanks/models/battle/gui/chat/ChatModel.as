package alternativa.tanks.models.battle.gui.chat
{
   import Renamed136.Renamed663;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.model.ChatSettingsTracker;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import Renamed368.ChatModelBase;
   import Renamed368.IChatModelBase;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class ChatModel extends ChatModelBase implements IChatModelBase, Renamed2566, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var Renamed2423:BattleGUIService;
      
      private var Renamed2567:Renamed2568;
      
      private var Renamed2569:String;
      
      private var Renamed2570:Renamed2571;
      
      private var Renamed2572:ChatSettingsTracker;
      
      public function ChatModel()
      {
         super();
         this.Renamed2567 = new Renamed2568();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.Renamed2567.clear();
         this.Renamed2567.locked = false;
         this.Renamed2567.addEventListener(Renamed2573.SEND_MESSAGE,this.Renamed2574);
         Renamed2423.Renamed2575().addChild(this.Renamed2567);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this.Renamed2569 = "";
         this.Renamed2570 = new Renamed2571(this.Renamed2567);
         this.Renamed2572 = new ChatSettingsTracker(this.Renamed2567);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.Renamed2567.removeEventListener(Renamed2573.SEND_MESSAGE,this.Renamed2574);
         this.Renamed2567.clear();
         if(this.Renamed2567.parent != null)
         {
            this.Renamed2567.parent.removeChild(this.Renamed2567);
         }
         this.Renamed2570.close();
         this.Renamed2572.close();
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      [Obfuscation(rename="false")]
      public function addMessage(param1:String, param2:String, param3:Renamed663) : void
      {
         this.Renamed2576(param1,param2,param3);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed2577(param1:String, param2:String, param3:Renamed663) : void
      {
         this.Renamed2576(param1,param2,param3,true);
      }
      
      private function Renamed2576(param1:String, param2:String, param3:Renamed663, param4:Boolean = false) : void
      {
         var _loc5_:* = param1 == null;
         this.Renamed2567.Renamed2578(param1,param3,param2 + "\n",param4,_loc5_);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed2579(param1:String, param2:String) : void
      {
         this.Renamed2567.Renamed2578(null,Renamed663.NONE,param2 + "\n",true,true);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed2580(param1:String) : void
      {
         this.Renamed2567.Renamed2580(param1);
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            if(battleInfoService.isSpectatorMode())
            {
               this.Renamed2567.Renamed2581(this.Renamed2569);
            }
            this.Renamed2567.Renamed2582();
         }
      }
      
      private function Renamed2574(param1:Renamed2573) : void
      {
         server.sendMessage(param1.message,param1.Renamed2583);
      }
      
      [Obfuscation(rename="false")]
      public function Renamed2584(param1:String) : void
      {
         this.Renamed2569 = param1;
      }
      
      public function Renamed2585() : Renamed2568
      {
         return this.Renamed2567;
      }
   }
}

