package alternativa.tanks.models.weapon.shaft
{
   import Renamed479.Renamed915;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3026;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import Renamed94.Renamed96;
   
   public class Renamed3164 implements Renamed990
   {
      private static const Renamed3195:Renamed664 = new Renamed664();
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private var effects:Renamed3160;
      
      private var Renamed3196:Renamed96;
      
      private var Renamed3110:Renamed925;
      
      private var Renamed3197:Renamed3198;
      
      private var Renamed3129:TankSpecification;
      
      private var Renamed991:Renamed915;
      
      private var Renamed3066:EncryptedNumber;
      
      public function Renamed3164(param1:Number, param2:Renamed96, param3:Renamed3160, param4:Renamed915, param5:TankSpecification)
      {
         super();
         this.Renamed3066 = new EncryptedNumberImpl(param1);
         this.Renamed3196 = param2;
         this.effects = param3;
         this.Renamed991 = param4;
         this.Renamed3129 = param5;
      }
      
      private static function Renamed3199(param1:Vector3, param2:Vector3, param3:Vector.<Vector3>) : Vector3
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
            _loc4_ = Renamed3195.direction;
         }
         return shotDirection.diff(_loc4_,param1).normalize();
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
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
         this.Renamed3165();
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
         this.Renamed3165();
      }
      
      public function reset() : void
      {
         this.Renamed3165();
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function Renamed3168() : void
      {
         if(this.Renamed3197 == null)
         {
            this.effects.Renamed3200(this.Renamed3110.Renamed1020());
            this.Renamed3110.stopMovement();
            this.Renamed3110.Renamed1078(true);
            this.Renamed3197 = new Renamed3198(this.Renamed3196,this.Renamed991,this.Renamed3129);
            this.Renamed3197.start();
         }
      }
      
      public function Renamed3165() : void
      {
         if(this.Renamed3197 != null)
         {
            this.Renamed3197.stop();
            this.Renamed3197 = null;
         }
         this.effects.Renamed3201();
         this.Renamed3110.Renamed1078(false);
      }
      
      public function Renamed3166(param1:Vector3, param2:Vector.<Body>, param3:Vector.<Vector3>, param4:Number) : void
      {
         var _loc5_:Vector3 = null;
         this.Renamed3110.Renamed1054(Renamed3195);
         this.Renamed3110.Renamed696().addWorldForceScaled(Renamed3195.Renamed693,Renamed3195.direction,-this.Renamed3066.getNumber());
         this.Renamed3110.Renamed1032();
         this.effects.Renamed3202(this.Renamed3110.Renamed1071(),this.Renamed3110.Renamed1020());
         this.effects.Renamed3203(Renamed3195.Renamed693);
         this.effects.Renamed3204(Renamed3195.Renamed689,param1);
         if(param1 != null || param3 != null)
         {
            _loc5_ = Renamed3199(Renamed3195.Renamed689,param1,param3);
            this.effects.Renamed3205(param1,param3,Renamed3195.Renamed693,Renamed3195.direction,_loc5_);
            this.Renamed3206(param2,param3,_loc5_,param4);
         }
      }
      
      private function Renamed3206(param1:Vector.<Body>, param2:Vector.<Vector3>, param3:Vector3, param4:Number) : void
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
               _loc5_ = param4 * Renamed3026.Renamed3028.getNumber();
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
                        _loc9_.Renamed1029(_loc8_,param3,_loc5_);
                     }
                  }
                  _loc5_ *= this.Renamed3196.weakeningCoeff;
                  _loc6_++;
               }
            }
         }
      }
   }
}

