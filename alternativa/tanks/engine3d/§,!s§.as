package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.TextureResourcesRegistry;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.utils.TextureMaterialRegistry;
   
   public class §,!s§ implements §throw package continue§
   {
      private var registry:TextureMaterialRegistry;
      
      public function §,!s§(param1:TextureMaterialRegistry)
      {
         super();
         this.registry = param1;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.registry.clear();
         TextureResourcesRegistry.releaseTextureResources();
      }
   }
}

