package Renamed210
{
   import Renamed301.Renamed4621;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import scpacker.tanks.WeaponsManager;
   import Renamed85.Renamed86;
   
   public class Renamed6190 extends Renamed4886
   {
      private var Renamed6191:Renamed4621;
      
      public var modelId:int;
      
      public function Renamed6190()
      {
         super();
         this.modelId = 58;
         this.Renamed6191 = Renamed4621(modelRegistry.getModel(Long.getLong(1486543535,-1939817925)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed6189.Renamed5161:
               this.Renamed5162(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Renamed86 = null;
         var _loc5_:* = undefined;
         var _loc2_:Object = JSON.parse(param1.json);
         for each(_loc3_ in _loc2_.weapons)
         {
            _loc4_ = new Renamed86(_loc3_.reload,_loc3_.auto_aiming_down,_loc3_.auto_aiming_up,_loc3_.num_rays_up,_loc3_.num_rays_down);
            if(_loc3_.has_wwd)
            {
               this.Renamed6191.initObject(WeaponsManager.getObjectFor(_loc3_.id),_loc3_.max_damage_radius,_loc3_.min_damage_percent,_loc3_.min_damage_radius);
            }
            _loc5_ = _loc3_.special_entity;
            WeaponsManager.shotDatas[_loc3_.id] = _loc4_;
            WeaponsManager.specialEntity[_loc3_.id] = _loc5_;
         }
      }
   }
}

