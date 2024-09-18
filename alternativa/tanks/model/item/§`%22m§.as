package alternativa.tanks.model.item
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.item.BattleItemCC;
   
   public class §`"m§ implements IBattleItem
   {
      private var object:IGameObject;
      
      private var impl:IBattleItem;
      
      public function §`"m§(param1:IGameObject, param2:IBattleItem)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getConstructor() : BattleItemCC
      {
         var result:BattleItemCC = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getConstructor();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

