package Renamed2615
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.Renamed887;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed899;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import Renamed351.Renamed4666;
   import flash.events.Event;
   import flash.net.SharedObject;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Renamed4651 implements AutoClosable, Renamed511
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
      public static var Renamed2423:BattleGUIService;
      
      private static const Renamed9680:String = "disableControlsMiniHelp";
      
      private var Renamed9681:Renamed4666;
      
      public function Renamed4651()
      {
         super();
         var _loc1_:SharedObject = storageService.getStorage();
         if(!_loc1_.data[Renamed9680])
         {
            if(userPropertiesService.rank == 1)
            {
               _loc1_.data[Renamed9680] = 1;
               this.Renamed9682();
            }
         }
      }
      
      private function Renamed9682() : void
      {
         this.Renamed9681 = new Renamed4666();
         Renamed2423.Renamed2575().addChild(this.Renamed9681);
         this.setPosition();
         battleEventDispatcher.Renamed539(Renamed899,this);
         battleEventDispatcher.Renamed539(Renamed887,this);
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event) : void
      {
         this.setPosition();
      }
      
      private function setPosition() : void
      {
         this.Renamed9681.x = display.stage.stageWidth - this.Renamed9681.width >> 1;
         this.Renamed9681.y = display.stage.stageHeight - this.Renamed9681.height - 10;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Renamed887 = null;
         if(param1 is Renamed899)
         {
            this.close();
         }
         else if(param1 is Renamed887)
         {
            _loc2_ = param1 as Renamed887;
            this.Renamed9681.Renamed3876(_loc2_.targetingMode);
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         if(this.Renamed9681 != null)
         {
            display.stage.removeEventListener(Event.RESIZE,this.onResize);
            battleEventDispatcher.Renamed866(Renamed899,this);
            battleEventDispatcher.Renamed866(Renamed887,this);
            this.Renamed9681.parent.removeChild(this.Renamed9681);
            this.Renamed9681 = null;
         }
      }
   }
}

