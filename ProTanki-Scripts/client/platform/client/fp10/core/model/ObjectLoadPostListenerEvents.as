package platform.client.fp10.core.model
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ObjectLoadPostListenerEvents implements ObjectLoadPostListener
   {
      private var object:IGameObject;
      
      private var impl:Vector.<ObjectLoadPostListener>;
      
      public function ObjectLoadPostListenerEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<ObjectLoadPostListener>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function objectLoadedPost() : void
      {
         var i:int = 0;
         var m:ObjectLoadPostListener = null;
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
   }
}

