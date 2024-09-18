package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.TextureResourcesRegistry;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.utils.TextureMaterialRegistry;
   
   public class Renamed514 implements Renamed511
   {
      private var registry:TextureMaterialRegistry;
      
      public function Renamed514(param1:TextureMaterialRegistry)
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

