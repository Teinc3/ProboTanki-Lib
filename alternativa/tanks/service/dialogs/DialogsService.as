package alternativa.tanks.service.dialogs
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.blur.IBlurService;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   
   public class DialogsService implements IDialogsService
   {
      [Inject]
      public static var display:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
      
      [Inject]
      public static var blurService:IBlurService = IBlurService(OSGi.getInstance().getService(IBlurService));
      
      private var dialogs:Vector.<DisplayObject>;
      
      private var queue:Vector.<DisplayObject>;
      
      private var dialogsLayer:DisplayObjectContainer;
      
      public function DialogsService()
      {
         this.dialogs = new Vector.<DisplayObject>();
         this.queue = new Vector.<DisplayObject>();
         super();
         this.dialogsLayer = display.dialogsLayer;
      }
      
      public function addDialog(param1:DisplayObject) : void
      {
         if(this.dialogs.indexOf(param1) > -1)
         {
            return;
         }
         this.dialogs.unshift(param1);
         if(this.dialogs.length > 1)
         {
            this.hideDialog(this.dialogs[1],false);
         }
         this.showDialog(param1,this.dialogs.length == 1);
         if(this.dialogs.length == 1)
         {
            display.stage.addEventListener(Event.RESIZE,this.onResize);
         }
      }
      
      public function Renamed1686(param1:DisplayObject) : void
      {
         if(this.dialogs.length == 0)
         {
            this.addDialog(param1);
         }
         else
         {
            this.queue.unshift(param1);
         }
      }
      
      public function removeDialog(param1:DisplayObject) : void
      {
         var _loc2_:int = int(this.dialogs.indexOf(param1));
         if(_loc2_ < 0)
         {
            return;
         }
         this.dialogs.splice(this.dialogs.indexOf(param1),1);
         if(this.dialogs.length == 0 && this.queue.length > 0)
         {
            this.dialogs.push(this.queue.pop());
         }
         this.hideDialog(param1,this.dialogs.length == 0);
         if(this.dialogs.length > 0)
         {
            this.showDialog(this.dialogs[0],false);
         }
         else
         {
            display.stage.removeEventListener(Event.RESIZE,this.onResize);
         }
      }
      
      private function showDialog(param1:DisplayObject, param2:Boolean) : void
      {
         if(param2)
         {
            blurService.blur();
         }
         this.center(param1);
         IDialogWindowsDispatcherService(OSGi.getInstance().getService(IDialogWindowsDispatcherService)).open();
         this.dialogsLayer.addChild(param1);
      }
      
      private function hideDialog(param1:DisplayObject, param2:Boolean) : void
      {
         if(this.dialogsLayer.contains(param1))
         {
            IDialogWindowsDispatcherService(OSGi.getInstance().getService(IDialogWindowsDispatcherService)).close();
            this.dialogsLayer.removeChild(param1);
         }
         if(param2)
         {
            blurService.unblur();
         }
      }
      
      private function onResize(param1:Event) : void
      {
         if(this.dialogs.length > 0)
         {
            this.center(this.dialogs[0]);
         }
      }
      
      private function center(param1:DisplayObject) : void
      {
         param1.x = int((display.stage.stageWidth - param1.width) * 0.5);
         param1.y = int((display.stage.stageHeight - param1.height) * 0.5);
      }
   }
}

