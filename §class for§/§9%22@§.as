package §class for§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§final set var§;
   import alternativa.tanks.models.weapon.§override var dynamic§;
   import §for set super§.§super const continue§;
   
   public class §9"@§ implements §4"3§
   {
      private static const §=#W§:§ !8§ = new § !8§();
      
      private static const §-">§:§final set var§ = new §final set var§();
      
      private var effects:§7#c§;
      
      private var §try do§:§1"o§;
      
      private var §->§:§3!z§;
      
      private var §7$$§:§override var dynamic§;
      
      public function §9"@§(param1:§override var dynamic§, param2:§3!z§, param3:§7#c§)
      {
         super();
         this.§7$$§ = param1;
         this.§->§ = param2;
         this.effects = param3;
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
      }
      
      public function destroy() : void
      {
         this.effects.§while set use§();
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
         this.effects.§while set use§();
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
         this.effects.§while set use§();
      }
      
      public function reset() : void
      {
         this.effects.§while set use§();
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function §override catch use§() : void
      {
         this.effects.§8#%§(this.§try do§.§else catch true§(),this.§try do§.§2"F§(),this.§->§.§-G§());
         this.§try do§.§else set return§(§-">§);
         this.effects.§`#y§(§-">§.§6u§);
      }
      
      public function fire(param1:Vector3, param2:Vector.<Body>, param3:Vector.<Vector3>) : void
      {
         var _loc4_:Vector3 = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Body = null;
         var _loc8_:Vector3 = null;
         var _loc9_:Tank = null;
         this.§try do§.§get var switch§(§=#W§);
         this.§try do§.§0"t§().addWorldForceScaled(§=#W§.§6u§,§=#W§.direction,-this.§7$$§.§get package set§());
         this.§try do§.§6v§();
         var _loc10_:Vector3 = param1;
         if(param2 != null && param2.length > 0)
         {
            _loc4_ = new Vector3();
            _loc4_.diff(param3[param3.length - 1],§=#W§.§if package var§).normalize();
            if(Vector3.isFiniteVector(_loc4_))
            {
               if(_loc10_ == null)
               {
                  _loc10_ = §,"W§.§^#Y§(§=#W§.§if package var§,_loc4_);
               }
               _loc5_ = 1;
               _loc6_ = 0;
               while(_loc6_ < param2.length)
               {
                  _loc7_ = param2[_loc6_];
                  if(_loc7_ != null && _loc7_.tank != null)
                  {
                     _loc8_ = param3[_loc6_];
                     if(Vector3.isFiniteVector(_loc8_))
                     {
                        _loc9_ = _loc7_.tank;
                        _loc9_.§case extends§(_loc8_,_loc4_,this.§7$$§.§include package finally§() * _loc5_);
                     }
                  }
                  _loc5_ *= this.§->§.§implements var get§();
                  _loc6_++;
               }
            }
            this.effects.§null var final§(§=#W§.§6u§,param3[param3.length - 1],param3,param2);
         }
         this.effects.§each set for§(§=#W§.§6u§,_loc10_,§=#W§.direction);
         if(param1 != null)
         {
            this.effects.§extends package while§(§=#W§.§if package var§,param1);
            this.effects.§continue var import§(§=#W§.§6u§,param1,this.§4#[§(§=#W§.§6u§,param1));
         }
      }
      
      private function §4#[§(param1:Vector3, param2:Vector3) : Vector3
      {
         var _loc3_:Vector3 = param2.clone();
         _loc3_.subtract(param1).normalize();
         var _loc4_:Vector3 = param2.clone();
         _loc4_.subtract(_loc3_);
         var _loc5_:RayHit = new RayHit();
         if(this.§try do§.§0"t§().scene.collisionDetector.raycastStatic(_loc4_,_loc3_,§super const continue§.§finally catch while§,100,null,_loc5_))
         {
            return _loc5_.normal;
         }
         _loc3_.reverse();
         return _loc3_;
      }
      
      public function §false var each§() : void
      {
         this.§try do§.§get var switch§(§=#W§);
         this.§try do§.§0"t§().addWorldForceScaled(§=#W§.§6u§,§=#W§.direction,-this.§7$$§.§get package set§());
         this.§try do§.§6v§();
      }
   }
}

