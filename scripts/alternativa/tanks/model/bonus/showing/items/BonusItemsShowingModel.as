package alternativa.tanks.model.bonus.showing.items
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.CongratulationsWindowWithBanner;
   import alternativa.tanks.gui.RepatriateBonusWindow;
   import alternativa.tanks.model.bonus.showing.info.BonusInfo;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import controls.DefaultButton;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemsShowingCC;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemsShowingModelBase;
   import projects.tanks.client.panel.model.bonus.showing.items.IBonusItemsShowingModelBase;
   
   public class BonusItemsShowingModel extends BonusItemsShowingModelBase implements IBonusItemsShowingModelBase, IObjectLoadListener
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      [Inject]
      public static var modelRegister:ModelRegistry;
      
      [Inject]
      public static var dialogsService:IDialogsService;
      
      private var bonusWindow:Sprite;
      
      public function BonusItemsShowingModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:IGameObject = null;
         var _loc2_:BonusInfo = null;
         var _loc3_:DefaultButton = null;
         var _loc4_:BonusItemsShowingCC = getInitParam();
         var _loc5_:Vector.<BonusItemCC> = new Vector.<BonusItemCC>();
         for each(_loc1_ in _loc4_.bonuses)
         {
            _loc5_.push(BonusItem(_loc1_.adapt(BonusItem)).getItem());
         }
         _loc2_ = BonusInfo(object.adapt(BonusInfo));
         if(_loc2_.getImage() == null)
         {
            this.bonusWindow = new CongratulationsWindowWithBanner(_loc2_.getTopText(),_loc5_);
            _loc3_ = CongratulationsWindowWithBanner(this.bonusWindow).closeButton;
         }
         else
         {
            this.bonusWindow = new RepatriateBonusWindow(_loc2_.getImage().data,_loc2_.getTopText(),_loc5_);
            _loc3_ = RepatriateBonusWindow(this.bonusWindow).closeButton;
         }
         _loc3_.addEventListener(MouseEvent.CLICK,this.closeBonusWindow);
         this.alignBonusWindow();
         display.stage.addEventListener(Event.RESIZE,this.alignBonusWindow);
         this.addDialog(this.bonusWindow);
      }
      
      public function objectUnloaded() : void
      {
         this.closeBonusWindow();
      }
      
      private function alignBonusWindow(param1:Event = null) : void
      {
         var _loc2_:Stage = display.stage;
         this.bonusWindow.x = Math.round((_loc2_.stageWidth - this.bonusWindow.width) * 0.5);
         this.bonusWindow.y = Math.round((_loc2_.stageHeight - this.bonusWindow.height) * 0.5);
      }
      
      private function closeBonusWindow(param1:MouseEvent = null) : void
      {
         if(this.bonusWindow != null)
         {
            display.stage.removeEventListener(Event.RESIZE,this.alignBonusWindow);
            this.removeDialog(this.bonusWindow);
            this.bonusWindow = null;
         }
      }
      
      private function addDialog(param1:DisplayObject) : void
      {
         dialogsService.Renamed1686(param1);
      }
      
      private function removeDialog(param1:DisplayObject) : void
      {
         dialogsService.removeDialog(param1);
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

