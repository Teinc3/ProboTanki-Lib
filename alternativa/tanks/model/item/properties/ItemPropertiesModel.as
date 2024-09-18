package alternativa.tanks.model.item.properties
{
   import projects.tanks.client.garage.models.item.properties.IItemPropertiesModelBase;
   import projects.tanks.client.garage.models.item.properties.ItemGaragePropertyData;
   import projects.tanks.client.garage.models.item.properties.ItemPropertiesModelBase;
   
   public class ItemPropertiesModel extends ItemPropertiesModelBase implements IItemPropertiesModelBase, ItemProperties
   {
      public function ItemPropertiesModel()
      {
         super();
      }
      
      public function getProperties() : Vector.<ItemPropertyValue>
      {
         var _loc1_:Vector.<ItemPropertyValue> = null;
         var _loc2_:ItemGaragePropertyData = null;
         var _loc3_:Object = getData(Vector);
         if(_loc3_ == null)
         {
            _loc1_ = new Vector.<ItemPropertyValue>();
            for each(_loc2_ in getInitParam().properties)
            {
               _loc1_.push(new ItemGaragePropertyValue(_loc2_));
            }
            putData(Vector,_loc1_);
         }
         else
         {
            _loc1_ = Vector.<ItemPropertyValue>(_loc3_);
         }
         return _loc1_;
      }
   }
}

