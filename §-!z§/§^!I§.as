package §-!z§
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.§class set default§;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.§const set final§;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class §^!I§ implements §class set default§
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var §finally set§:BattleGUIService;
      
      private var §?#`§:Vector.<§const set final§>;
      
      private var §native var get§:Vector.<§const set final§>;
      
      private var initialized:Boolean;
      
      public function §^!I§()
      {
         this.§?#`§ = new Vector.<§const set final§>();
         this.§native var get§ = new Vector.<§const set final§>();
         super();
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event) : void
      {
         this.§try for case§();
      }
      
      public function §]!1§(param1:§const set final§) : void
      {
         this.§try for case§();
      }
      
      public function §try for case§() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = display.stage.stageWidth;
         var _loc3_:int = 0;
         while(_loc3_ < this.§native var get§.length)
         {
            _loc1_ = DisplayObject(this.§native var get§[_loc3_]);
            _loc1_.x = _loc2_ - _loc1_.width - 10;
            _loc1_.y = display.stage.stageHeight - _loc1_.height - 10;
            _loc2_ = _loc1_.x;
            _loc3_++;
         }
         §finally set§.§import var try§(_loc2_);
      }
      
      public function §get set final§(param1:§const set final§) : void
      {
         if(this.initialized)
         {
            this.§native var get§.push(param1);
         }
         else
         {
            this.§?#`§.push(param1);
         }
         param1.§+"l§(this);
         this.§]!1§(param1);
      }
      
      public function §[A§(param1:§const set final§) : void
      {
         this.§native var get§.push(param1);
         param1.§+"l§(this);
      }
      
      public function destroy() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.§"X§();
      }
      
      private function §"X§() : void
      {
         var _loc1_:§const set final§ = null;
         var _loc2_:DisplayObject = null;
         for each(_loc1_ in this.§native var get§)
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
         var _loc1_:§const set final§ = null;
         if(!this.initialized)
         {
            this.initialized = true;
            for each(_loc1_ in this.§?#`§)
            {
               this.§native var get§.push(_loc1_);
            }
            this.§?#`§ = null;
         }
         this.§try for case§();
      }
   }
}

