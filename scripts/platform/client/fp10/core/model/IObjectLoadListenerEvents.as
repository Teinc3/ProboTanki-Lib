package platform.client.fp10.core.model
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IObjectLoadListenerEvents implements IObjectLoadListener
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IObjectLoadListener>;
      
      public function IObjectLoadListenerEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IObjectLoadListener>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function objectLoaded() : void
      {
         var i:int = 0;
         var m:IObjectLoadListener = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.objectLoaded();
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function objectLoadedPost() : void
      {
         var i:int = 0;
         var m:IObjectLoadListener = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.objectLoadedPost();
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function objectUnloaded() : void
      {
         var i:int = 0;
         var m:IObjectLoadListener = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.objectUnloaded();
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function objectUnloadedPost() : void
      {
         var i:int = 0;
         var m:IObjectLoadListener = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.objectUnloadedPost();
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

