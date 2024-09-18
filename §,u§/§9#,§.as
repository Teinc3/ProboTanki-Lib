package §,u§
{
   import §=#M§.§null var implements§;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import scpacker.tanks.WeaponsManager;
   import §super var native§.§return for while§;
   
   public class §9#,§ extends §return package if§
   {
      private var §static function§:§null var implements§;
      
      public var modelId:int;
      
      public function §9#,§()
      {
         super();
         this.modelId = 58;
         this.§static function§ = §null var implements§(modelRegistry.getModel(Long.getLong(1486543535,-1939817925)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §7P§.§;!K§:
               this.§`#%§(param1);
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:§return for while§ = null;
         var _loc5_:* = undefined;
         var _loc2_:Object = JSON.parse(param1.json);
         for each(_loc3_ in _loc2_.weapons)
         {
            _loc4_ = new §return for while§(_loc3_.reload,_loc3_.auto_aiming_down,_loc3_.auto_aiming_up,_loc3_.num_rays_up,_loc3_.num_rays_down);
            if(_loc3_.has_wwd)
            {
               this.§static function§.initObject(WeaponsManager.getObjectFor(_loc3_.id),_loc3_.max_damage_radius,_loc3_.min_damage_percent,_loc3_.min_damage_radius);
            }
            _loc5_ = _loc3_.special_entity;
            WeaponsManager.shotDatas[_loc3_.id] = _loc4_;
            WeaponsManager.specialEntity[_loc3_.id] = _loc5_;
         }
      }
   }
}

