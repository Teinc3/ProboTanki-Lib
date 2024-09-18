package Renamed56
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   
   public class Renamed10101
   {
      public static const Renamed10102:Number = -100;
      
      public var Renamed10103:Number = -100;
      
      public var targets:Vector.<Body>;
      
      public var Renamed3143:Vector.<Vector3>;
      
      public var staticHitPoint:Vector3;
      
      public var Renamed10100:Vector3;
      
      public var hasStaticHit:Boolean;
      
      public var Renamed10104:int;
      
      public function Renamed10101()
      {
         this.targets = new Vector.<Body>();
         this.Renamed3143 = new Vector.<Vector3>();
         this.staticHitPoint = new Vector3();
         this.Renamed10100 = new Vector3();
         super();
      }
      
      public function clear() : void
      {
         this.targets.length = 0;
         this.Renamed3143.length = 0;
         this.Renamed10103 = Renamed10102;
         this.hasStaticHit = false;
         this.Renamed10104 = 0;
      }
      
      public function Renamed3354(param1:Vector3, param2:Vector3) : void
      {
         this.staticHitPoint.copy(param1);
         this.Renamed10100.copy(param2);
         this.hasStaticHit = true;
      }
      
      public function Renamed3381(param1:Body, param2:Vector3) : void
      {
         this.targets.push(param1);
         this.Renamed3143.push(param2);
      }
      
      public function Renamed10105(param1:Body, param2:Vector3) : void
      {
         this.Renamed3381(param1,param2);
         ++this.Renamed10104;
      }
      
      public function Renamed10106() : Boolean
      {
         return this.targets.length > this.Renamed10104;
      }
   }
}

