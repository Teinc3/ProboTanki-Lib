package Renamed343
{
   import alternativa.tanks.services.mipmapping.MipMappingService;
   import alternativa.utils.TextureMaterialRegistry;
   
   public class Renamed534 implements MipMappingService
   {
      private var Renamed1660:Boolean;
      
      private var Renamed8040:Vector.<TextureMaterialRegistry>;
      
      public function Renamed534()
      {
         this.Renamed8040 = new Vector.<TextureMaterialRegistry>();
         super();
      }
      
      public function Renamed3826() : Boolean
      {
         return this.Renamed1660;
      }
      
      public function setMipMapping(param1:Boolean) : void
      {
         var _loc2_:TextureMaterialRegistry = null;
         if(this.Renamed1660 != param1)
         {
            this.Renamed1660 = param1;
            for each(_loc2_ in this.Renamed8040)
            {
               _loc2_.setMipMapping(param1);
            }
         }
      }
      
      public function Renamed3827() : void
      {
         this.setMipMapping(!this.Renamed1660);
      }
      
      public function Renamed540(param1:TextureMaterialRegistry) : void
      {
         this.Renamed8040.push(param1);
         param1.setMipMapping(this.Renamed1660);
      }
   }
}

