package alternativa.tanks.servermodels.loginbyhash
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §;z§ implements ILoginByHash
   {
      private var object:IGameObject;
      
      private var impl:Vector.<ILoginByHash>;
      
      public function §;z§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<ILoginByHash>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function loginByHash(param1:String) : void
      {
         var i:int = 0;
         var m:ILoginByHash = null;
         var hash:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.loginByHash(hash);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function loginBySingleUseHash(param1:String) : void
      {
         var i:int = 0;
         var m:ILoginByHash = null;
         var hash:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.loginBySingleUseHash(hash);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

