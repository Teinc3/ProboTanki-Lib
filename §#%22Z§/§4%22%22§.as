package §#"Z§
{
   import §]i§.§'#;§;
   import §]i§.§const const false§;
   import alternativa.object.ClientObject;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import §if try§.§return package if§;
   
   public class §4""§ extends §return package if§
   {
      private var §-"S§:§const const false§;
      
      private var §5!-§:§'#;§;
      
      private var _objects:Dictionary;
      
      public var modelId:int;
      
      public function §4""§()
      {
         this._objects = new Dictionary();
         super();
         this.modelId = 43;
         this.§-"S§ = §const const false§(modelRegistry.getModel(Long.getLong(1160724760,1672827267)));
         this.§5!-§ = §'#;§(modelRegistry.getModel(Long.getLong(1500686585,-1760437566)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §break const null§.§final package native§:
               this.activated(param1);
               break;
            case §break const null§.§;!K§:
               this.§`#%§(param1);
               break;
            case §break const null§.§try set default§:
               this.updateCount(param1);
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:ClientObject = null;
         var _loc2_:Object = JSON.parse(param1.json);
         this.§5!-§.objectLoaded();
         for each(_loc3_ in _loc2_.items)
         {
            _loc4_ = new ClientObject(_loc3_.id,null,_loc3_.id);
            this.§-"S§.initObject(_loc4_,null,_loc3_.count,_loc3_.itemEffectTime,_loc3_.slotId,_loc3_.itemRestSec);
            this._objects[_loc3_.id] = _loc4_;
         }
      }
      
      private function updateCount(param1:Object) : void
      {
         this.§-"S§.updateCount(this._objects[param1.itemId],param1.count);
      }
      
      private function activated(param1:Object) : void
      {
         this.§-"S§.activated(this._objects[param1.itemId],param1.time,param1.decrease);
      }
   }
}

