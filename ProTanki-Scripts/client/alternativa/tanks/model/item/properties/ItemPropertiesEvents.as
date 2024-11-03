package alternativa.tanks.model.item.properties
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ItemPropertiesEvents implements ItemProperties
   {
      private var object:IGameObject;
      
      private var impl:Vector.<ItemProperties>;
      
      public function ItemPropertiesEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<ItemProperties>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getProperties() : Vector.<ItemPropertyValue>
      {
         var result:Vector.<ItemPropertyValue> = null;
         var i:int = 0;
         var m:ItemProperties = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getProperties();
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

