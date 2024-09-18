package alternativa.tanks.service.temporaryitemnotify
{
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed566 implements ITemporaryItemNotifyService
   {
      private var listeners:Vector.<Renamed2093>;
      
      public function Renamed566()
      {
         super();
         this.listeners = new Vector.<Renamed2093>();
      }
      
      public function addListener(param1:Renamed2093) : void
      {
         if(this.listeners.indexOf(param1) == -1)
         {
            this.listeners.push(param1);
         }
      }
      
      public function removeListener(param1:Renamed2093) : void
      {
         var _loc2_:Number = Number(this.listeners.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.listeners.splice(_loc2_,1);
         }
      }
      
      public function Renamed3793(param1:IGameObject) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.listeners.length)
         {
            this.listeners[_loc2_].temporaryItemTimeIsUp(param1);
            _loc2_++;
         }
      }
   }
}

