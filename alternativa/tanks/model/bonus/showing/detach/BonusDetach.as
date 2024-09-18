package alternativa.tanks.model.bonus.showing.detach
{
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import flash.events.Event;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BonusDetach
   {
      public static var spaceRegistry:SpaceRegistry = OSGi.getInstance().getService(SpaceRegistry) as SpaceRegistry;
      
      private var object:IGameObject;
      
      public function BonusDetach(param1:IGameObject)
      {
         super();
         this.object = param1;
      }
      
      public function detach(param1:Event = null) : void
      {
         spaceRegistry.getSpace(Long.getLong(884380667,214)).destroyObject(this.object.id);
      }
   }
}

