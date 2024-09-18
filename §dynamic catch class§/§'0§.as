package §dynamic catch class§
{
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.proplib.objects.PropMesh;
   import alternativa.proplib.objects.PropObject;
   import alternativa.proplib.objects.PropSprite;
   import alternativa.utils.clearDictionary;
   import flash.utils.Dictionary;
   
   public class §'0§
   {
      private var §return const dynamic§:Dictionary;
      
      private var §true package throw§:Dictionary;
      
      private var §,!D§:Dictionary;
      
      public function §'0§()
      {
         this.§return const dynamic§ = new Dictionary();
         this.§true package throw§ = new Dictionary();
         this.§,!D§ = new Dictionary();
         super();
      }
      
      public function §include for extends§(param1:PropMesh, param2:String, param3:BSP) : void
      {
         var _loc4_:§7#1§ = this.§override catch break§(param1,param2);
         _loc4_.§while package catch§(param3);
      }
      
      private function §override catch break§(param1:PropMesh, param2:String) : §7#1§
      {
         return §7#1§(this.§var false§(this.§return const dynamic§,param1,param2,§7#1§));
      }
      
      public function §^!g§(param1:PropMesh, param2:String, param3:Mesh, param4:String = null) : void
      {
         var _loc5_:§finally catch const§ = this.§ "g§(param1,param2);
         _loc5_.add(param3,param4);
      }
      
      private function § "g§(param1:PropMesh, param2:String) : §finally catch const§
      {
         return §finally catch const§(this.§var false§(this.§true package throw§,param1,param2,§finally catch const§));
      }
      
      public function §class for default§(param1:PropSprite, param2:Sprite3D) : void
      {
         var _loc3_:§import const get§ = this.§while var set§(param1);
         _loc3_.§class for default§(param2);
      }
      
      private function §while var set§(param1:PropSprite) : §import const get§
      {
         return §import const get§(this.§var false§(this.§,!D§,param1,null,§import const get§));
      }
      
      private function §var false§(param1:Dictionary, param2:PropObject, param3:String, param4:Class) : §#!5§
      {
         var _loc5_:Dictionary = param1[param2];
         if(_loc5_ == null)
         {
            _loc5_ = new Dictionary();
            param1[param2] = _loc5_;
         }
         var _loc6_:§#!5§ = _loc5_[param3];
         if(_loc6_ == null)
         {
            _loc6_ = new param4(param2,param3);
            _loc5_[param3] = _loc6_;
         }
         return _loc6_;
      }
      
      public function §^m§() : Vector.<§#!5§>
      {
         var _loc1_:Vector.<§#!5§> = new Vector.<§#!5§>();
         this.§implements catch do§(this.§return const dynamic§,_loc1_);
         this.§implements catch do§(this.§true package throw§,_loc1_);
         this.§implements catch do§(this.§,!D§,_loc1_);
         return _loc1_;
      }
      
      private function §implements catch do§(param1:Dictionary, param2:Vector.<§#!5§>) : void
      {
         var _loc3_:Dictionary = null;
         var _loc4_:§#!5§ = null;
         for each(_loc3_ in param1)
         {
            for each(_loc4_ in _loc3_)
            {
               param2.push(_loc4_);
            }
         }
      }
      
      public function clear() : void
      {
         this.§&!!§(this.§true package throw§);
         this.§&!!§(this.§return const dynamic§);
         this.§&!!§(this.§,!D§);
      }
      
      private function §&!!§(param1:Dictionary) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in param1)
         {
            clearDictionary(param1[_loc2_]);
            delete param1[_loc2_];
         }
      }
   }
}

