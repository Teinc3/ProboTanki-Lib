package alternativa.tanks.models.weapon.shaft
{
   import §]#R§.§try set for§;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§%"J§;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import §while const const§.§^"x§;
   
   public class §+!9§ implements §4"3§
   {
      private static const §=#W§:§ !8§ = new § !8§();
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private var effects:§=#n§;
      
      private var §?"@§:§^"x§;
      
      private var §try do§:§1"o§;
      
      private var §break package in§:§include package implements§;
      
      private var §%!6§:TankSpecification;
      
      private var §finally for var§:§try set for§;
      
      private var §in const case§:EncryptedNumber;
      
      public function §+!9§(param1:Number, param2:§^"x§, param3:§=#n§, param4:§try set for§, param5:TankSpecification)
      {
         super();
         this.§in const case§ = new EncryptedNumberImpl(param1);
         this.§?"@§ = param2;
         this.effects = param3;
         this.§finally for var§ = param4;
         this.§%!6§ = param5;
      }
      
      private static function §continue var break§(param1:Vector3, param2:Vector3, param3:Vector.<Vector3>) : Vector3
      {
         var _loc4_:Vector3 = null;
         var _loc5_:int = 0;
         var _loc6_:Vector3 = null;
         if(param2 != null)
         {
            return shotDirection.diff(param2,param1).normalize();
         }
         _loc5_ = int(param3.length - 1);
         while(_loc5_ >= 0)
         {
            _loc6_ = param3[_loc5_];
            if(_loc6_ != null)
            {
               _loc4_ = _loc6_;
               break;
            }
            _loc5_--;
         }
         if(_loc4_ == null)
         {
            _loc4_ = §=#W§.direction;
         }
         return shotDirection.diff(_loc4_,param1).normalize();
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
      }
      
      public function destroy() : void
      {
         this.effects.destroy();
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
         this.§dynamic package extends§();
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
         this.§dynamic package extends§();
      }
      
      public function reset() : void
      {
         this.§dynamic package extends§();
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function §+!4§() : void
      {
         if(this.§break package in§ == null)
         {
            this.effects.§if set default§(this.§try do§.§2"F§());
            this.§try do§.stopMovement();
            this.§try do§.§catch var extends§(true);
            this.§break package in§ = new §include package implements§(this.§?"@§,this.§finally for var§,this.§%!6§);
            this.§break package in§.start();
         }
      }
      
      public function §dynamic package extends§() : void
      {
         if(this.§break package in§ != null)
         {
            this.§break package in§.stop();
            this.§break package in§ = null;
         }
         this.effects.§catch for package§();
         this.§try do§.§catch var extends§(false);
      }
      
      public function §var case§(param1:Vector3, param2:Vector.<Body>, param3:Vector.<Vector3>, param4:Number) : void
      {
         var _loc5_:Vector3 = null;
         this.§try do§.§get var switch§(§=#W§);
         this.§try do§.§0"t§().addWorldForceScaled(§=#W§.§6u§,§=#W§.direction,-this.§in const case§.getNumber());
         this.§try do§.§6v§();
         this.effects.§8F§(this.§try do§.§else catch true§(),this.§try do§.§2"F§());
         this.effects.§-"b§(§=#W§.§6u§);
         this.effects.§-!c§(§=#W§.§if package var§,param1);
         if(param1 != null || param3 != null)
         {
            _loc5_ = §continue var break§(§=#W§.§if package var§,param1,param3);
            this.effects.§else catch false§(param1,param3,§=#W§.§6u§,§=#W§.direction,_loc5_);
            this.§'#O§(param2,param3,_loc5_,param4);
         }
      }
      
      private function §'#O§(param1:Vector.<Body>, param2:Vector.<Vector3>, param3:Vector3, param4:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Body = null;
         var _loc8_:Vector3 = null;
         var _loc9_:Tank = null;
         if(param1 != null)
         {
            if(Vector3.isFiniteVector(param3))
            {
               _loc5_ = param4 * §%"J§.§^"j§.getNumber();
               _loc6_ = 0;
               while(_loc6_ < param1.length)
               {
                  _loc7_ = param1[_loc6_];
                  if(_loc7_ != null && _loc7_.tank != null)
                  {
                     _loc8_ = param2[_loc6_];
                     if(Vector3.isFiniteVector(_loc8_))
                     {
                        _loc9_ = Tank(_loc7_.tank);
                        _loc9_.§case extends§(_loc8_,param3,_loc5_);
                     }
                  }
                  _loc5_ *= this.§?"@§.weakeningCoeff;
                  _loc6_++;
               }
            }
         }
      }
   }
}

