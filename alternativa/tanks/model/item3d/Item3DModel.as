package alternativa.tanks.model.item3d
{
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.item3d.IItem3DModelBase;
   import projects.tanks.client.garage.models.item.item3d.Item3DModelBase;
   import projects.tanks.clients.flash.commons.models.coloring.IColoring;
   import projects.tanks.clients.flash.resources.object3ds.IObject3DS;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Item3DModel extends Item3DModelBase implements IItem3DModelBase, IObjectLoadListener
   {
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var tank3DViewer:ITank3DViewer;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      public function Item3DModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:Tanks3DSResource = null;
         var _loc2_:ImageResource = null;
         var _loc3_:ItemCategoryEnum = itemService.getCategory(object);
         switch(_loc3_)
         {
            case ItemCategoryEnum.ARMOR:
               _loc1_ = IObject3DS(object.adapt(IObject3DS)).getResource3DS();
               tank3DViewer.setArmor(_loc1_);
               break;
            case ItemCategoryEnum.WEAPON:
               _loc1_ = IObject3DS(object.adapt(IObject3DS)).getResource3DS();
               tank3DViewer.setWeapon(_loc1_);
               break;
            case ItemCategoryEnum.COLOR:
               _loc2_ = IColoring(object.adapt(IColoring)).getColoring();
               if(getInitParam().mounted)
               {
                  tank3DViewer.setColor(_loc2_.data);
               }
               else
               {
                  tank3DViewer.Renamed2110(_loc2_.data);
               }
         }
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

