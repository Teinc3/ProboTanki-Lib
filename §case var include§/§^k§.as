package §case var include§
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §^k§ implements §switch set false§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§switch set false§>;
      
      public function §^k§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§switch set false§>();
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
         var m:§switch set false§ = null;
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

