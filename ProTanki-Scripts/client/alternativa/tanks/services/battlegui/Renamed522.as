package alternativa.tanks.services.battlegui
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.utils.removeDisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   
   public class Renamed522 extends EventDispatcher implements BattleGUIService
   {
      [Inject]
      public static var display:IDisplay;
      
      private var Renamed3800:Sprite;
      
      private var Renamed2370:Sprite;
      
      private var Renamed3801:Sprite;
      
      private var Renamed3802:int;
      
      private var Renamed3803:int;
      
      public function Renamed522()
      {
         this.Renamed3800 = new Sprite();
         this.Renamed2370 = new Sprite();
         this.Renamed3801 = new Sprite();
         super();
      }
      
      public function Renamed2492() : DisplayObjectContainer
      {
         return this.Renamed3800;
      }
      
      public function Renamed2575() : DisplayObjectContainer
      {
         return this.Renamed2370;
      }
      
      public function Renamed3795() : DisplayObjectContainer
      {
         return this.Renamed3801;
      }
      
      public function hide() : void
      {
         removeDisplayObject(this.Renamed3800);
         removeDisplayObject(this.Renamed2370);
         removeDisplayObject(this.Renamed3801);
      }
      
      public function show() : void
      {
         display.contentLayer.addChild(this.Renamed3800);
         display.contentUILayer.addChild(this.Renamed2370);
         display.contentUILayer.addChild(this.Renamed3801);
      }
      
      public function Renamed3796(param1:int) : void
      {
         this.Renamed3802 = param1;
         dispatchEvent(new BattleGUIServiceEvent(BattleGUIServiceEvent.ON_CHANGE_POSITION_DEFAULT_LAYOUT));
      }
      
      public function Renamed3797() : int
      {
         return this.Renamed3802;
      }
      
      public function Renamed3798(param1:int) : void
      {
         this.Renamed3803 = param1;
         dispatchEvent(new Renamed3804());
      }
      
      public function Renamed2641() : int
      {
         return this.Renamed3803;
      }
      
      public function Renamed3799() : void
      {
         this.Renamed3803 = 0;
      }
   }
}

