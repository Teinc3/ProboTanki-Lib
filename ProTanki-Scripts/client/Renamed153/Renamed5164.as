package Renamed5154
{
   import Renamed485.Renamed4639;
   import Renamed485.Renamed4641;
   import alternativa.object.ClientObject;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import Renamed385.Renamed4886;
   
   public class Renamed5157 extends Renamed4886
   {
      private var Renamed5158:Renamed4641;
      
      private var Renamed2798:Renamed4639;
      
      private var _objects:Dictionary;
      
      public var modelId:int;
      
      public function Renamed5157()
      {
         this._objects = new Dictionary();
         super();
         this.modelId = 43;
         this.Renamed5158 = Renamed4641(modelRegistry.getModel(Long.getLong(1160724760,1672827267)));
         this.Renamed2798 = Renamed4639(modelRegistry.getModel(Long.getLong(1500686585,-1760437566)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed5159.Renamed5160:
               this.activated(param1);
               break;
            case Renamed5159.Renamed5161:
               this.Renamed5162(param1);
               break;
            case Renamed5159.Renamed5163:
               this.updateCount(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:ClientObject = null;
         var _loc2_:Object = JSON.parse(param1.json);
         this.Renamed2798.objectLoaded();
         for each(_loc3_ in _loc2_.items)
         {
            _loc4_ = new ClientObject(_loc3_.id,null,_loc3_.id);
            this.Renamed5158.initObject(_loc4_,null,_loc3_.count,_loc3_.itemEffectTime,_loc3_.slotId,_loc3_.itemRestSec);
            this._objects[_loc3_.id] = _loc4_;
         }
      }
      
      private function updateCount(param1:Object) : void
      {
         this.Renamed5158.updateCount(this._objects[param1.itemId],param1.count);
      }
      
      private function activated(param1:Object) : void
      {
         this.Renamed5158.activated(this._objects[param1.itemId],param1.time,param1.decrease);
      }
   }
}

