package alternativa.tanks.model.item
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class § h§ implements BattleItem
   {
      private var object:IGameObject;
      
      private var impl:BattleItem;
      
      public function § h§(param1:IGameObject, param2:BattleItem)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function onAddFriend(param1:String) : void
      {
         var userId:String = param1;
         try
         {
            Model.object = this.object;
            this.impl.onAddFriend(userId);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function onDeleteFriend(param1:String) : void
      {
         var userId:String = param1;
         try
         {
            Model.object = this.object;
            this.impl.onDeleteFriend(userId);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

