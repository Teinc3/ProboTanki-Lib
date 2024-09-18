package alternativa.tanks.battle
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.View;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.display.AxisIndicator;
   import alternativa.tanks.models.battle.battlefield.Renamed716;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.utils.MathUtils;
   import alternativa.utils.removeDisplayObject;
   import alternativa.utils.removeDisplayObjectChildren;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.geom.Rectangle;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class Renamed623
   {
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var Renamed718:BattleInputService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed720:IBackgroundService;
      
      public static const Renamed721:int = 10;
      
      private static const Renamed722:String = "screenSize";
      
      private var container:Sprite;
      
      private var view:View;
      
      private var overlay:Sprite;
      
      private var Renamed723:Shape;
      
      private var Renamed724:Boolean;
      
      private var Renamed725:AxisIndicator;
      
      private var screenSize:int = 10;
      
      public function Renamed623()
      {
         super();
         this.Renamed726();
         this.view = new View(1,1,GPUCapabilities.constrained);
         this.view.mouseEnabled = false;
         this.view.hideLogo();
         this.container.addChild(this.view);
         battleService.Renamed621().Renamed727(this.view);
         this.overlay = new Sprite();
         this.container.addChild(this.overlay);
         this.Renamed723 = new Shape();
         this.container.addChild(this.Renamed723);
         this.setSize(storageService.getStorage().data[Renamed722]);
      }
      
      private function Renamed726() : void
      {
         this.container = new Sprite();
         this.container.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.container.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.container.stage.addEventListener(Event.RESIZE,this.onResize);
         this.container.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         this.setFocus();
         this.resize();
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this.container.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.container.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onResize(param1:Event) : void
      {
         this.resize();
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(Renamed718.Renamed728())
         {
            return;
         }
         var _loc2_:Renamed717 = Renamed719.Renamed729(param1.keyCode);
         switch(_loc2_)
         {
            case Renamed717.BATTLE_VIEW_INCREASE:
               this.Renamed730();
               break;
            case Renamed717.BATTLE_VIEW_DECREASE:
               this.Renamed731();
         }
      }
      
      private function Renamed730() : void
      {
         this.Renamed732();
         storageService.getStorage().data[Renamed722] = this.Renamed733();
      }
      
      private function Renamed731() : void
      {
         this.Renamed734();
         storageService.getStorage().data[Renamed722] = this.Renamed733();
      }
      
      public function destroy() : void
      {
         this.Renamed735();
         this.view.clear();
         this.view = null;
         removeDisplayObjectChildren(this.overlay);
         this.overlay = null;
         removeDisplayObjectChildren(this.container);
         this.container.removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.container.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.container = null;
      }
      
      public function Renamed736(param1:Boolean) : void
      {
         if(this.Renamed724 != param1)
         {
            this.Renamed724 = param1;
            if(param1)
            {
               this.Renamed725 = new AxisIndicator(100);
               this.container.addChild(this.Renamed725);
               this.Renamed737();
            }
            else
            {
               this.container.removeChild(this.Renamed725);
               this.Renamed725 = null;
            }
         }
      }
      
      public function Renamed738(param1:Boolean) : void
      {
         var _loc2_:Camera3D = battleService.Renamed621().Renamed739();
         if(param1 != this.container.contains(_loc2_.diagram))
         {
            if(param1)
            {
               this.container.addChild(_loc2_.diagram);
            }
            else
            {
               this.container.removeChild(_loc2_.diagram);
            }
         }
      }
      
      private function resize() : void
      {
         if(this.container.stage == null)
         {
            return;
         }
         this.Renamed740();
         this.Renamed741();
         this.Renamed742();
         this.drawBackground();
         this.Renamed737();
         battleService.Renamed621().Renamed739().Renamed743();
      }
      
      private function Renamed740() : void
      {
         var _loc1_:Number = this.screenSize / Renamed721;
         this.view.width = int(this.container.stage.stageWidth * _loc1_);
         this.view.height = int(this.container.stage.stageHeight * _loc1_);
      }
      
      private function Renamed741() : void
      {
         this.container.x = this.container.stage.stageWidth - this.view.width >> 1;
         this.container.y = this.container.stage.stageHeight - this.view.height >> 1;
      }
      
      private function Renamed742() : void
      {
         this.Renamed723.graphics.clear();
         if(this.screenSize < Renamed721)
         {
            Renamed716.draw(this.Renamed723.graphics,this.view.width,this.view.height);
         }
      }
      
      private function drawBackground() : void
      {
         var _loc1_:int = 0.5 * (this.container.stage.stageWidth - this.view.width);
         var _loc2_:int = 0.5 * (this.container.stage.stageHeight - this.view.height);
         Renamed720.drawBg(new Rectangle(_loc1_,_loc2_,this.view.width,this.view.height));
      }
      
      private function Renamed737() : void
      {
         if(this.Renamed724)
         {
            this.Renamed725.y = this.view.height - this.Renamed725.size - 50;
         }
      }
      
      public function Renamed732() : void
      {
         if(this.screenSize < Renamed721)
         {
            ++this.screenSize;
            this.resize();
         }
      }
      
      public function Renamed734() : void
      {
         if(this.screenSize > 1)
         {
            --this.screenSize;
            this.resize();
         }
      }
      
      private function setSize(param1:int) : void
      {
         if(param1 == 0)
         {
            this.screenSize = Renamed721;
         }
         else
         {
            this.screenSize = MathUtils.clamp(param1,1,Renamed721);
         }
         this.resize();
      }
      
      public function Renamed733() : int
      {
         return this.screenSize;
      }
      
      public function update() : void
      {
         if(this.Renamed724)
         {
            this.Renamed725.update(battleService.Renamed621().Renamed739());
         }
      }
      
      public function Renamed744(param1:DisplayObject) : void
      {
         this.overlay.addChild(param1);
      }
      
      public function Renamed745() : int
      {
         if(this.container.stage == null)
         {
            return 1;
         }
         return this.container.stage.stageWidth * this.screenSize / Renamed721;
      }
      
      public function Renamed746() : int
      {
         if(this.container.stage == null)
         {
            return 1;
         }
         return this.container.stage.stageHeight * this.screenSize / Renamed721;
      }
      
      public function Renamed747() : Number
      {
         return this.Renamed746() * this.Renamed746() + this.Renamed745() * this.Renamed745();
      }
      
      public function Renamed748() : DisplayObjectContainer
      {
         return this.container.parent;
      }
      
      public function Renamed749() : int
      {
         return this.container.x;
      }
      
      public function Renamed750() : int
      {
         return this.container.y;
      }
      
      public function Renamed751(param1:DisplayObjectContainer) : void
      {
         param1.addChild(this.container);
      }
      
      public function Renamed735() : void
      {
         removeDisplayObject(this.container);
      }
      
      public function setFocus() : void
      {
         display.stage.focus = this.container;
      }
   }
}

