package Renamed319
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4831 implements Renamed4834
   {
      private var object:IGameObject;
      
      private var impl:Vector.<Renamed4834>;
      
      public function Renamed4831(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<Renamed4834>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function checkInvite(param1:String) : void
      {
         var i:int = 0;
         var m:Renamed4834 = null;
         var inviteCode:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.checkInvite(inviteCode);
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

