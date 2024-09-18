package Renamed278
{
   import alternativa.math.Vector3;
   import mx.utils.StringUtil;
   
   public class Renamed3515
   {
      private var direction:Vector3;
      
      private var angle:Number;
      
      private var Renamed7143:Number;
      
      private var Renamed7144:Number;
      
      public function Renamed3515(param1:Vector3, param2:Number, param3:Number, param4:Number = 0)
      {
         super();
         this.direction = param1.clone();
         this.angle = param2;
         this.Renamed7143 = param3;
         this.Renamed7144 = param4;
      }
      
      public static function comparator(param1:Renamed3515, param2:Renamed3515) : Number
      {
         return param2.Renamed7143 - param1.Renamed7143;
      }
      
      public function Renamed1013() : Vector3
      {
         return this.direction;
      }
      
      public function Renamed3526() : Number
      {
         return this.angle;
      }
      
      public function Renamed3523() : Number
      {
         return this.Renamed7143;
      }
      
      public function Renamed3527() : Number
      {
         return this.Renamed7144;
      }
      
      public function toString() : String
      {
         return StringUtil.substitute("TargetingDirection[direction={0}, angle={1}, maxPriority={2}]",this.direction,this.angle.toFixed(2),this.Renamed7143.toFixed(0));
      }
   }
}

