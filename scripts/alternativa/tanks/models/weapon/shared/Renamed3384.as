package alternativa.tanks.models.weapon.shared
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import flash.utils.Dictionary;
   import Renamed373.Renamed665;
   import Renamed373.Renamed666;
   
   public class Renamed3367
   {
      private static const Renamed3368:int = Renamed666.WEAPON;
      
      private static const origin:Vector3 = new Vector3();
      
      private var range:EncryptedNumber;
      
      private var Renamed3369:EncryptedNumber;
      
      private var Renamed860:int;
      
      private var Renamed3370:int;
      
      private var collisionDetector:Renamed665;
      
      private var Renamed3371:Renamed612;
      
      private var Renamed3372:Dictionary;
      
      private var Renamed3373:Dictionary;
      
      public function Renamed3367(param1:Number, param2:Number, param3:int, param4:int, param5:Renamed665, param6:Renamed612)
      {
         this.Renamed3374 = new Vector3();
         this.matrix = new Matrix3();
         this.Renamed1511 = new Matrix3();
         this.Renamed1299 = new RayHit();
         this.Renamed3107 = new Renamed3375();
         this.Renamed1512 = new Vector3();
         this.Renamed693 = new Vector3();
         super();
         this.range = new EncryptedNumberImpl(param1);
         this.Renamed3369 = new EncryptedNumberImpl(0.5 * param2);
         this.Renamed860 = param3;
         this.Renamed3370 = param4;
         this.collisionDetector = param5;
         this.Renamed3371 = param6;
      }
      
      public function Renamed3376(param1:Body, param2:Number, param3:Number, param4:Vector3, param5:Vector3, param6:Vector3, param7:Vector.<Body>, param8:Vector.<Number>, param9:Vector.<Vector3>) : void
      {
         var _loc18_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:Number = NaN;
         this.Renamed3107.shooter = param1;
         this.Renamed3372 = new Dictionary();
         this.Renamed3373 = new Dictionary();
         var _loc12_:Number = param3 * param2;
         var _loc13_:Number = param2 - _loc12_;
         if(this.collisionDetector.raycast(param4,param5,Renamed3368,param2,this.Renamed3107,this.Renamed1299) && this.Renamed1299.shape.body.tank == null)
         {
            return;
         }
         this.Renamed3374.copy(param6);
         this.Renamed693.copy(param4).addScaled(_loc12_,param5);
         var _loc14_:Number = this.range.getNumber() + _loc13_;
         this.Renamed3377(this.Renamed693,param5,_loc14_);
         this.Renamed1511.fromAxisAngle(param5,Math.PI / this.Renamed3370);
         var _loc15_:Number = this.Renamed3369.getNumber() / this.Renamed860;
         var _loc16_:int = 0;
         while(_loc16_ < this.Renamed3370)
         {
            this.Renamed3378(this.Renamed693,param5,this.Renamed3374,_loc14_,this.Renamed860,_loc15_);
            this.Renamed3378(this.Renamed693,param5,this.Renamed3374,_loc14_,this.Renamed860,-_loc15_);
            this.Renamed3374.transform3(this.Renamed1511);
            _loc16_++;
         }
         var _loc17_:int = 0;
         for(_loc18_ in this.Renamed3372)
         {
            param7[_loc17_] = _loc18_;
            _loc11_ = this.Renamed3372[_loc18_] - _loc13_;
            if(_loc11_ < 0)
            {
               _loc11_ = 0;
            }
            param8[_loc17_] = _loc11_;
            param9[_loc17_] = this.Renamed3373[_loc18_];
            _loc17_++;
         }
         param7.length = _loc17_;
         param8.length = _loc17_;
         this.Renamed3107.shooter = null;
         this.Renamed3107.Renamed3379();
         this.Renamed3372 = null;
      }
      
      private function Renamed3378(param1:Vector3, param2:Vector3, param3:Vector3, param4:Number, param5:int, param6:Number) : void
      {
         var _loc7_:Number = 0;
         var _loc8_:int = 0;
         while(_loc8_ < param5)
         {
            _loc7_ += param6;
            this.matrix.fromAxisAngle(param3,_loc7_);
            this.matrix.transformVector(param2,this.Renamed1512);
            this.Renamed3377(param1,this.Renamed1512,param4);
            _loc8_++;
         }
      }
      
      private function Renamed3377(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         var _loc4_:Body = null;
         var _loc5_:Number = NaN;
         origin.copy(param1);
         var _loc6_:Number = 0;
         if(this.collisionDetector.raycast(origin,param2,Renamed3368,param3,this.Renamed3107,this.Renamed1299))
         {
            _loc4_ = this.Renamed1299.shape.body;
            if(_loc4_.tank != null && !Renamed2943.Renamed2967(origin,this.Renamed1299.position))
            {
               origin.addScaled(this.Renamed1299.t,param2);
               _loc6_ += this.Renamed1299.t;
               if(this.Renamed3371.Renamed3380(_loc4_))
               {
                  this.Renamed3107.Renamed3381(_loc4_);
                  _loc5_ = Number(this.Renamed3372[_loc4_]);
                  if(isNaN(_loc5_) || _loc5_ > _loc6_)
                  {
                     this.Renamed3372[_loc4_] = _loc6_;
                     this.Renamed3373[_loc4_] = this.Renamed1299.position.clone();
                  }
               }
               else
               {
                  this.Renamed3107.Renamed3382(_loc4_);
               }
            }
         }
         this.Renamed3107.Renamed3383();
      }
   }
}

