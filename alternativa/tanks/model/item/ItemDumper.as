package alternativa.tanks.model.item
{
   import alternativa.osgi.service.dump.IDumper;
   import alternativa.tanks.model.item.item.IItem;
   import alternativa.tanks.service.item.ItemService;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class ItemDumper implements IDumper
   {
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      [Inject]
      public static var spaceRegistry:SpaceRegistry;
      
      [Inject]
      public static var itemService:ItemService;
      
      public function ItemDumper()
      {
         super();
      }
      
      public function dump(param1:Array) : String
      {
         var _loc2_:Vector.<ISpace> = null;
         var _loc3_:int = 0;
         var _loc4_:Vector.<IGameObject> = null;
         var _loc5_:IGameObject = null;
         var _loc6_:* = "\n";
         var _loc7_:IItem = (modelRegistry.getModelsByInterface(IItem) as Vector.<IModel>)[0] as IItem;
         if(_loc7_ != null)
         {
            _loc2_ = spaceRegistry.spaces;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc4_ = _loc2_[_loc3_].objects;
               for each(_loc5_ in _loc4_)
               {
                  if(_loc5_.hasModel(IItem))
                  {
                     _loc6_ += "\n" + itemService.getName(_loc5_);
                     _loc6_ = (_loc6_ = (_loc6_ = (_loc6_ = _loc6_ += "\n" + itemService.getName(_loc5_) + ("   type: " + itemService.getCategory(_loc5_) + "\n")) + ("   description: " + itemService.getDescription(_loc5_) + "\n")) + ("   rankId: " + itemService.Renamed1764(_loc5_) + "\n")) + ("   price: " + itemService.getPrice(_loc5_) + "\n");
                  }
               }
               _loc3_++;
            }
         }
         else
         {
            _loc6_ += "ItemModel not registered!";
         }
         return _loc6_ + "\n";
      }
      
      public function get dumperName() : String
      {
         return "item";
      }
   }
}

