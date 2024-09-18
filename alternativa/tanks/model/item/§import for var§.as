package alternativa.tanks.model.item
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.item.BattleItemCC;
   
   public class §import for var§ implements IBattleItem
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IBattleItem>;
      
      public function §import for var§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IBattleItem>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getConstructor() : BattleItemCC
      {
         var result:BattleItemCC = null;
         var i:int = 0;
         var m:IBattleItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getConstructor();
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

