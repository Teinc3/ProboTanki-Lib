package Renamed63
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapon.shared.Renamed2943;
   import Renamed373.Renamed665;
   import Renamed373.Renamed666;
   
   public class Renamed10180 implements IRayCollisionFilter
   {
      private static const Renamed1299:RayHit = new RayHit();
      
      private static const Renamed10193:Vector3 = new Vector3();
      
      private static const Renamed9448:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const matrix:Matrix3 = new Matrix3();
      
      private var Renamed10194:Number;
      
      private var Renamed10195:int;
      
      private var Renamed10196:Number;
      
      private var Renamed10197:int;
      
      private var Renamed6525:Number;
      
      private var Renamed3427:Renamed617;
      
      private var Renamed7143:Number;
      
      private var Renamed10148:int;
      
      private var Renamed6056:Body;
      
      private var collisionDetector:Renamed665;
      
      private var maxRicochetCount:int;
      
      public function Renamed10180(param1:Number, param2:int, param3:Number, param4:int, param5:Number, param6:Renamed665, param7:Renamed617, param8:int)
      {
         super();
         this.Renamed10194 = param1;
         this.Renamed10195 = param2;
         this.Renamed10196 = param3;
         this.Renamed10197 = param4;
         this.Renamed6525 = param5;
         this.Renamed3427 = param7;
         this.collisionDetector = param6;
         this.maxRicochetCount = param8;
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.Renamed6056 != param1 || this.Renamed10148 > 0;
      }
      
      public function Renamed3199(param1:Vector3, param2:Vector3, param3:Vector3, param4:Body, param5:Vector3) : void
      {
         this.Renamed10198(param4);
         this.Renamed10199(param1,param2,0,param5);
         this.Renamed10200(param1,param2,param3,this.Renamed10194 / this.Renamed10195,this.Renamed10195,param5);
         this.Renamed10200(param1,param2,param3,-this.Renamed10196 / this.Renamed10197,this.Renamed10197,param5);
         this.Renamed10201(param5,param2);
      }
      
      private function Renamed10198(param1:Body) : void
      {
         this.Renamed6056 = param1;
         this.Renamed7143 = 0;
      }
      
      private function Renamed10199(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : void
      {
         var _loc5_:Body = null;
         var _loc6_:* = false;
         this.Renamed10148 = 0;
         Renamed10193.copy(param1);
         Renamed9448.copy(param2);
         var _loc7_:Number = this.Renamed6525;
         while(_loc7_ > 0)
         {
            if(!this.collisionDetector.raycast(Renamed10193,Renamed9448,Renamed666.WEAPON,_loc7_,this,Renamed1299))
            {
               return;
            }
            _loc7_ -= Renamed1299.t;
            if(_loc7_ -= Renamed1299.t < 0)
            {
               _loc7_ = 0;
            }
            _loc5_ = Renamed1299.shape.body;
            _loc6_ = false;
            if(_loc5_.tank != null)
            {
               if(this.Renamed10148 > 0)
               {
                  _loc6_ = true;
               }
               else
               {
                  _loc6_ = !Renamed2943.Renamed2967(Renamed10193,Renamed1299.position);
               }
            }
            if(_loc5_.tank != null && _loc5_ != this.Renamed6056 && _loc6_)
            {
               this.Renamed10202(_loc5_,_loc7_,param3,param2,param4);
               return;
            }
            if(_loc6_)
            {
               return;
            }
            if(!this.Renamed10203())
            {
               return;
            }
         }
      }
      
      private function Renamed10202(param1:Body, param2:Number, param3:Number, param4:Vector3, param5:Vector3) : void
      {
         var _loc6_:Number = this.Renamed6525 - param2;
         var _loc7_:Number = this.Renamed3427.Renamed3385(param1,this.Renamed10148,_loc6_,param3,this.Renamed6525,Math.max(this.Renamed10194,this.Renamed10196));
         if(_loc7_ > this.Renamed7143)
         {
            this.Renamed7143 = _loc7_;
            param5.copy(param4);
         }
      }
      
      private function Renamed10203() : Boolean
      {
         var _loc1_:Vector3 = null;
         if(this.Renamed10148 < this.maxRicochetCount)
         {
            ++this.Renamed10148;
            _loc1_ = Renamed1299.normal;
            Renamed9448.addScaled(-2 * Renamed9448.dot(_loc1_),_loc1_);
            Renamed10193.copy(Renamed1299.position).addScaled(0.5,_loc1_);
            return true;
         }
         return false;
      }
      
      private function Renamed10200(param1:Vector3, param2:Vector3, param3:Vector3, param4:Number, param5:int, param6:Vector3) : void
      {
         direction.copy(param2);
         matrix.fromAxisAngle(param3,param4);
         if(param4 < 0)
         {
            param4 = -param4;
         }
         var _loc7_:Number = param4;
         var _loc8_:int = 0;
         while(_loc8_ < param5)
         {
            direction.transform3(matrix);
            this.Renamed10199(param1,direction,_loc7_,param6);
            _loc8_++;
            _loc7_ += param4;
         }
      }
      
      private function Renamed10201(param1:Vector3, param2:Vector3) : void
      {
         this.Renamed6056 = null;
         if(this.Renamed7143 == 0)
         {
            param1.copy(param2);
         }
      }
   }
}

