package Renamed215
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Renamed2654;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Renamed2552;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class Renamed4574 implements Renamed2654
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var Renamed4729:BattleGUIService;
      
      private var Renamed6245:Vector.<Renamed2552>;
      
      private var Renamed6246:Vector.<Renamed2552>;
      
      private var initialized:Boolean;
      
      public function Renamed4574()
      {
         this.Renamed6245 = new Vector.<Renamed2552>();
         this.Renamed6246 = new Vector.<Renamed2552>();
         super();
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event) : void
      {
         this.Renamed6247();
      }
      
      public function Renamed2655(param1:Renamed2552) : void
      {
         this.Renamed6247();
      }
      
      public function Renamed6247() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = display.stage.stageWidth;
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed6246.length)
         {
            _loc1_ = DisplayObject(this.Renamed6246[_loc3_]);
            _loc1_.x = _loc2_ - _loc1_.width - 10;
            _loc1_.y = display.stage.stageHeight - _loc1_.height - 10;
            _loc2_ = _loc1_.x;
            _loc3_++;
         }
         Renamed4729.Renamed3796(_loc2_);
      }
      
      public function Renamed2563(param1:Renamed2552) : void
      {
         if(this.initialized)
         {
            this.Renamed6246.push(param1);
         }
         else
         {
            this.Renamed6245.push(param1);
         }
         param1.Renamed2656(this);
         this.Renamed2655(param1);
      }
      
      public function Renamed6248(param1:Renamed2552) : void
      {
         this.Renamed6246.push(param1);
         param1.Renamed2656(this);
      }
      
      public function destroy() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.Renamed6249();
      }
      
      private function Renamed6249() : void
      {
         var _loc1_:Renamed2552 = null;
         var _loc2_:DisplayObject = null;
         for each(_loc1_ in this.Renamed6246)
         {
            _loc2_ = DisplayObject(_loc1_);
            if(_loc2_.parent != null)
            {
               _loc2_.parent.removeChild(_loc2_);
            }
         }
      }
      
      public function init() : void
      {
         var _loc1_:Renamed2552 = null;
         if(!this.initialized)
         {
            this.initialized = true;
            for each(_loc1_ in this.Renamed6245)
            {
               this.Renamed6246.push(_loc1_);
            }
            this.Renamed6245 = null;
         }
         this.Renamed6247();
      }
   }
}

