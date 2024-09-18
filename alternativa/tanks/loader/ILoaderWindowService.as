package alternativa.tanks.loader
{
   import flash.display.DisplayObject;
   import flash.events.IEventDispatcher;
   
   public interface ILoaderWindowService extends IEventDispatcher
   {
      function setBatchIdForProcess(param1:int, param2:Object) : void;
      
      function showLoaderWindow() : void;
      
      function hideLoaderWindow() : void;
      
      function lockLoaderWindow() : void;
      
      function unlockLoaderWindow() : void;
      
      function showTip(param1:DisplayObject) : void;
      
      function §<!5§() : Boolean;
   }
}

