package projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class UidCheckServiceEvents implements UidCheckService
   {
      private var object:IGameObject;
      
      private var impl:Vector.<UidCheckService>;
      
      public function UidCheckServiceEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<UidCheckService>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getMaxLength() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:UidCheckService = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getMaxLength();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function exist(param1:String, param2:Function) : void
      {
         var i:int = 0;
         var m:UidCheckService = null;
         var uid:String = param1;
         var callback:Function = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.exist(uid,callback);
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function validate(param1:String, param2:Function) : void
      {
         var i:int = 0;
         var m:UidCheckService = null;
         var uid:String = param1;
         var callback:Function = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.validate(uid,callback);
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

