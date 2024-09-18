package projects.tanks.clients.fp10.libraries.tanksservices.model.listener
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   
   public class Renamed4504 implements UserNotifier
   {
      private var object:IGameObject;
      
      private var impl:Vector.<UserNotifier>;
      
      public function Renamed4504(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<UserNotifier>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getDataConsumer(param1:String) : UserInfoConsumer
      {
         var result:UserInfoConsumer = null;
         var i:int = 0;
         var m:UserNotifier = null;
         var userId:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getDataConsumer(userId);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function hasDataConsumer(param1:String) : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:UserNotifier = null;
         var userId:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.hasDataConsumer(userId);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function subcribe(param1:String, param2:UserInfoConsumer) : void
      {
         var i:int = 0;
         var m:UserNotifier = null;
         var userId:String = param1;
         var consumer:UserInfoConsumer = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.subcribe(userId,consumer);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function refresh(param1:String, param2:UserInfoConsumer) : void
      {
         var i:int = 0;
         var m:UserNotifier = null;
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
      
      public function unsubcribe(param1:Vector.<String>) : void
      {
         var i:int = 0;
         var m:UserNotifier = null;
         var usersId:Vector.<String> = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.unsubcribe(usersId);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getCurrentUserId() : String
      {
         var result:String = null;
         var i:int = 0;
         var m:UserNotifier = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getCurrentUserId();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

