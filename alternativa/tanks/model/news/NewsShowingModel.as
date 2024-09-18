package alternativa.tanks.model.news
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.NewsAlertWindow;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import projects.tanks.client.panel.model.news.item.NewsItemCC;
   import projects.tanks.client.panel.model.news.showing.INewsShowingModelBase;
   import projects.tanks.client.panel.model.news.showing.NewsShowingCC;
   import projects.tanks.client.panel.model.news.showing.NewsShowingModelBase;
   
   public class NewsShowingModel extends NewsShowingModelBase implements INewsShowingModelBase, IObjectLoadListener
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var dialogsService:IDialogsService;
      
      private var newsWindow:NewsAlertWindow;
      
      public function NewsShowingModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:Vector.<NewsItemCC> = null;
         var _loc2_:int = 0;
         var _loc3_:NewsShowingCC = getInitParam();
         var _loc4_:Vector.<NewsItemCC> = _loc3_.newsItems;
         if(_loc4_.length > 0)
         {
            _loc1_ = new Vector.<NewsItemCC>();
            _loc2_ = 0;
            while(_loc2_ < _loc4_.length)
            {
               _loc1_.push(_loc4_[_loc2_]);
               _loc2_++;
            }
            this.showNews(_loc1_);
         }
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      private function alignNewsWindow(param1:Event = null) : void
      {
         this.newsWindow.x = Math.round((display.stage.stageWidth - this.newsWindow.width) * 0.5);
         this.newsWindow.y = Math.round((display.stage.stageHeight - this.newsWindow.height) * 0.5);
      }
      
      private function closeWindow(param1:MouseEvent = null) : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.alignNewsWindow);
         this.removeDialog(this.newsWindow);
         this.newsWindow = null;
      }
      
      private function addDialog(param1:DisplayObject) : void
      {
         dialogsService.addDialog(param1);
      }
      
      private function removeDialog(param1:DisplayObject) : void
      {
         dialogsService.removeDialog(param1);
      }
      
      private function showNews(param1:Vector.<NewsItemCC>) : void
      {
         this.newsWindow = new NewsAlertWindow(param1);
         this.newsWindow.closeButton.addEventListener(MouseEvent.CLICK,this.closeWindow);
         display.stage.addEventListener(Event.RESIZE,this.alignNewsWindow);
         this.addDialog(this.newsWindow);
         this.alignNewsWindow();
      }
   }
}

