package §throw var throw§
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §var set try§ implements §>P§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§>P§>;
      
      public function §var set try§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§>P§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function fit() : void
      {
         var i:int = 0;
         var m:§>P§ = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.fit();
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

