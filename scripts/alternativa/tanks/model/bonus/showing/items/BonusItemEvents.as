package alternativa.tanks.model.bonus.showing.items
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   
   public class BonusItemEvents implements BonusItem
   {
      private var object:IGameObject;
      
      private var impl:Vector.<BonusItem>;
      
      public function BonusItemEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<BonusItem>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getItem() : BonusItemCC
      {
         var result:BonusItemCC = null;
         var i:int = 0;
         var m:BonusItem = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getItem();
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

