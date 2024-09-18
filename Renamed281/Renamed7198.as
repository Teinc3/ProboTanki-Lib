package Renamed281
{
   import Renamed278.Renamed3514;
   import Renamed278.Renamed3515;
   import alternativa.math.Vector3;
   import alternativa.tanks.models.weapon.Renamed664;
   
   public class Renamed7198 implements Renamed3514
   {
      private const Renamed7199:int = 11;
      
      private var Renamed6955:Vector3;
      
      private var Renamed3421:Vector3;
      
      private var angle:Number;
      
      private var screenSize:Number;
      
      private var Renamed7200:Vector3;
      
      public function Renamed7198(param1:Number)
      {
         this.Renamed6955 = new Vector3();
         this.Renamed3421 = new Vector3();
         super();
         this.angle = param1 / 2;
         this.screenSize = Math.tan(this.angle) * 2;
      }
      
      public function Renamed7201(param1:Vector3) : void
      {
         this.Renamed7200 = param1;
      }
      
      public function Renamed7202() : void
      {
         this.Renamed7200 = null;
      }
      
      public function Renamed3522(param1:Renamed664) : Vector.<Renamed3515>
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         this.Renamed6955.cross2(param1.Renamed3025,param1.direction);
         var _loc5_:Vector.<Renamed3515> = new Vector.<Renamed3515>();
         var _loc6_:Number = this.screenSize / (this.Renamed7199 - 1);
         var _loc7_:Number = -this.screenSize * 0.5;
         var _loc8_:int = 0;
         while(_loc8_ < this.Renamed7199)
         {
            _loc2_ = -this.screenSize * 0.5;
            _loc3_ = 0;
            while(_loc3_ < this.Renamed7199)
            {
               this.Renamed3421.copy(param1.direction);
               this.Renamed3421.addScaled(_loc7_,this.Renamed6955);
               this.Renamed3421.addScaled(_loc2_,param1.Renamed3025);
               this.Renamed3421.normalize();
               _loc4_ = Math.acos(this.Renamed3421.dot(param1.direction));
               if(_loc4_ <= this.angle)
               {
                  _loc5_.push(new Renamed3515(this.Renamed3421,_loc4_,Number.MAX_VALUE));
               }
               _loc2_ += _loc6_;
               _loc3_++;
            }
            _loc7_ += _loc6_;
            _loc8_++;
         }
         if(this.Renamed7200 != null)
         {
            _loc5_.push(new Renamed3515(this.Renamed7200,Math.acos(this.Renamed7200.dot(param1.direction)),Number.MAX_VALUE,10));
         }
         return _loc5_;
      }
   }
}

