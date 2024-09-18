package projects.tanks.clients.fp10.libraries.tanksservices.model
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   
   public class §;#W§ implements UserRefresh
   {
      private var object:IGameObject;
      
      private var impl:Vector.<UserRefresh>;
      
      public function §;#W§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<UserRefresh>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function refresh(param1:String, param2:UserInfoConsumer) : void
      {
         var i:int = 0;
         var m:UserRefresh = null;
         var userId:String = param1;
         var consumer:UserInfoConsumer = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.refresh(userId,consumer);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function remove(param1:String) : void
      {
         var i:int = 0;
         var m:UserRefresh = null;
         var userId:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.remove(userId);
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

