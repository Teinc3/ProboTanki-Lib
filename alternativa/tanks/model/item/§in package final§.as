package alternativa.tanks.model.item
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §in package final§ implements BattleItem
   {
      private var object:IGameObject;
      
      private var impl:Vector.<BattleItem>;
      
      public function §in package final§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<BattleItem>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function onAddFriend(param1:String) : void
      {
         var i:int = 0;
         var m:BattleItem = null;
         var userId:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.onAddFriend(userId);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function onDeleteFriend(param1:String) : void
      {
         var i:int = 0;
         var m:BattleItem = null;
         var userId:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.onDeleteFriend(userId);
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

