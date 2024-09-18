package §dynamic package catch§
{
   import alternativa.tanks.services.mipmapping.MipMappingService;
   import alternativa.utils.TextureMaterialRegistry;
   
   public class §super for override§ implements MipMappingService
   {
      private var §for var include§:Boolean;
      
      private var §break while§:Vector.<TextureMaterialRegistry>;
      
      public function §super for override§()
      {
         this.§break while§ = new Vector.<TextureMaterialRegistry>();
         super();
      }
      
      public function §9#u§() : Boolean
      {
         return this.§for var include§;
      }
      
      public function setMipMapping(param1:Boolean) : void
      {
         var _loc2_:TextureMaterialRegistry = null;
         if(this.§for var include§ != param1)
         {
            this.§for var include§ = param1;
            for each(_loc2_ in this.§break while§)
            {
               _loc2_.setMipMapping(param1);
            }
         }
      }
      
      public function §7#p§() : void
      {
         this.setMipMapping(!this.§for var include§);
      }
      
      public function §dynamic var extends§(param1:TextureMaterialRegistry) : void
      {
         this.§break while§.push(param1);
         param1.setMipMapping(this.§for var include§);
      }
   }
}

