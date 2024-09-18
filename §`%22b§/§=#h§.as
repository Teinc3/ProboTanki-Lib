package §`"b§
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.§9"A§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§package const extends§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import §else for break§.§const catch switch§;
   import flash.events.Event;
   import flash.net.SharedObject;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class §=#h§ implements AutoClosable, §throw package continue§
   {
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var §]!W§:BattleGUIService;
      
      private static const § !`§:String = "disableControlsMiniHelp";
      
      private var §break var in§:§const catch switch§;
      
      public function §=#h§()
      {
         super();
         var _loc1_:SharedObject = storageService.getStorage();
         if(!_loc1_.data[§ !`§])
         {
            if(userPropertiesService.rank == 1)
            {
               _loc1_.data[§ !`§] = 1;
               this.§<"6§();
            }
         }
      }
      
      private function §<"6§() : void
      {
         this.§break var in§ = new §const catch switch§();
         §]!W§.§break catch true§().addChild(this.§break var in§);
         this.setPosition();
         battleEventDispatcher.§set for each§(§package const extends§,this);
         battleEventDispatcher.§set for each§(§9"A§,this);
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event) : void
      {
         this.setPosition();
      }
      
      private function setPosition() : void
      {
         this.§break var in§.x = display.stage.stageWidth - this.§break var in§.width >> 1;
         this.§break var in§.y = display.stage.stageHeight - this.§break var in§.height - 10;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:§9"A§ = null;
         if(param1 is §package const extends§)
         {
            this.close();
         }
         else if(param1 is §9"A§)
         {
            _loc2_ = param1 as §9"A§;
            this.§break var in§.§set const static§(_loc2_.targetingMode);
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         if(this.§break var in§ != null)
         {
            display.stage.removeEventListener(Event.RESIZE,this.onResize);
            battleEventDispatcher.§7!3§(§package const extends§,this);
            battleEventDispatcher.§7!3§(§9"A§,this);
            this.§break var in§.parent.removeChild(this.§break var in§);
            this.§break var in§ = null;
         }
      }
   }
}

