package alternativa.tanks.battle
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.View;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.display.AxisIndicator;
   import alternativa.tanks.models.battle.battlefield.§var package package§;
   import alternativa.tanks.service.settings.keybinding.§&7§;
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
   
   public class §0_§
   {
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var §^"<§:BattleInputService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var §?"F§:IBackgroundService;
      
      public static const §-a§:int = 10;
      
      private static const §class var var§:String = "screenSize";
      
      private var container:Sprite;
      
      private var view:View;
      
      private var overlay:Sprite;
      
      private var §##"§:Shape;
      
      private var §32§:Boolean;
      
      private var §!#g§:AxisIndicator;
      
      private var screenSize:int = 10;
      
      public function §0_§()
      {
         super();
         this.§!!+§();
         this.view = new View(1,1,GPUCapabilities.constrained);
         this.view.mouseEnabled = false;
         this.view.hideLogo();
         this.container.addChild(this.view);
         battleService.§3l§().§+a§(this.view);
         this.overlay = new Sprite();
         this.container.addChild(this.overlay);
         this.§##"§ = new Shape();
         this.container.addChild(this.§##"§);
         this.setSize(storageService.getStorage().data[§class var var§]);
      }
      
      private function §!!+§() : void
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
         if(§^"<§.§false set true§())
         {
            return;
         }
         var _loc2_:§&7§ = §5!$§.§&!<§(param1.keyCode);
         switch(_loc2_)
         {
            case §&7§.BATTLE_VIEW_INCREASE:
               this.§8t§();
               break;
            case §&7§.BATTLE_VIEW_DECREASE:
               this.§throw var get§();
         }
      }
      
      private function §8t§() : void
      {
         this.§var for use§();
         storageService.getStorage().data[§class var var§] = this.§else const set§();
      }
      
      private function §throw var get§() : void
      {
         this.§'"Y§();
         storageService.getStorage().data[§class var var§] = this.§else const set§();
      }
      
      public function destroy() : void
      {
         this.§]$!§();
         this.view.clear();
         this.view = null;
         removeDisplayObjectChildren(this.overlay);
         this.overlay = null;
         removeDisplayObjectChildren(this.container);
         this.container.removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.container.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.container = null;
      }
      
      public function §=!7§(param1:Boolean) : void
      {
         if(this.§32§ != param1)
         {
            this.§32§ = param1;
            if(param1)
            {
               this.§!#g§ = new AxisIndicator(100);
               this.container.addChild(this.§!#g§);
               this.§const var super§();
            }
            else
            {
               this.container.removeChild(this.§!#g§);
               this.§!#g§ = null;
            }
         }
      }
      
      public function §import const catch§(param1:Boolean) : void
      {
         var _loc2_:Camera3D = battleService.§3l§().§super package§();
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
         this.§4h§();
         this.§default catch switch§();
         this.§class extends§();
         this.drawBackground();
         this.§const var super§();
         battleService.§3l§().§super package§().§?!X§();
      }
      
      private function §4h§() : void
      {
         var _loc1_:Number = this.screenSize / §-a§;
         this.view.width = int(this.container.stage.stageWidth * _loc1_);
         this.view.height = int(this.container.stage.stageHeight * _loc1_);
      }
      
      private function §default catch switch§() : void
      {
         this.container.x = this.container.stage.stageWidth - this.view.width >> 1;
         this.container.y = this.container.stage.stageHeight - this.view.height >> 1;
      }
      
      private function §class extends§() : void
      {
         this.§##"§.graphics.clear();
         if(this.screenSize < §-a§)
         {
            §var package package§.draw(this.§##"§.graphics,this.view.width,this.view.height);
         }
      }
      
      private function drawBackground() : void
      {
         var _loc1_:int = 0.5 * (this.container.stage.stageWidth - this.view.width);
         var _loc2_:int = 0.5 * (this.container.stage.stageHeight - this.view.height);
         §?"F§.drawBg(new Rectangle(_loc1_,_loc2_,this.view.width,this.view.height));
      }
      
      private function §const var super§() : void
      {
         if(this.§32§)
         {
            this.§!#g§.y = this.view.height - this.§!#g§.size - 50;
         }
      }
      
      public function §var for use§() : void
      {
         if(this.screenSize < §-a§)
         {
            ++this.screenSize;
            this.resize();
         }
      }
      
      public function §'"Y§() : void
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
            this.screenSize = §-a§;
         }
         else
         {
            this.screenSize = MathUtils.clamp(param1,1,§-a§);
         }
         this.resize();
      }
      
      public function §else const set§() : int
      {
         return this.screenSize;
      }
      
      public function update() : void
      {
         if(this.§32§)
         {
            this.§!#g§.update(battleService.§3l§().§super package§());
         }
      }
      
      public function §,#s§(param1:DisplayObject) : void
      {
         this.overlay.addChild(param1);
      }
      
      public function §%!4§() : int
      {
         if(this.container.stage == null)
         {
            return 1;
         }
         return this.container.stage.stageWidth * this.screenSize / §-a§;
      }
      
      public function §case catch break§() : int
      {
         if(this.container.stage == null)
         {
            return 1;
         }
         return this.container.stage.stageHeight * this.screenSize / §-a§;
      }
      
      public function §in const import§() : Number
      {
         return this.§case catch break§() * this.§case catch break§() + this.§%!4§() * this.§%!4§();
      }
      
      public function §1!^§() : DisplayObjectContainer
      {
         return this.container.parent;
      }
      
      public function §="f§() : int
      {
         return this.container.x;
      }
      
      public function §6!W§() : int
      {
         return this.container.y;
      }
      
      public function §]!J§(param1:DisplayObjectContainer) : void
      {
         param1.addChild(this.container);
      }
      
      public function §]$!§() : void
      {
         removeDisplayObject(this.container);
      }
      
      public function setFocus() : void
      {
         display.stage.focus = this.container;
      }
   }
}

