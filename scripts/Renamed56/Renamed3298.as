package Renamed56
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapons.targeting.Renamed3072;
   
   public class Renamed3298
   {
      public var staticHitPoint:Vector3;
      
      public var Renamed10100:Vector3;
      
      public var hasStaticHit:Boolean;
      
      public var targets:Vector.<Body>;
      
      public var Renamed3143:Vector.<Vector3>;
      
      public var shotDirection:Vector3;
      
      public function Renamed3298()
      {
         this.staticHitPoint = new Vector3();
         this.Renamed10100 = new Vector3();
         this.targets = new Vector.<Body>();
         this.Renamed3143 = new Vector.<Vector3>();
         this.shotDirection = new Vector3();
         super();
      }
      
      public function Renamed3356(param1:Renamed3072) : void
      {
         var _loc2_:RayHit = null;
         var _loc3_:RayHit = null;
         if(this.hasStaticHit = param1.hasStaticHit())
         {
            _loc3_ = param1.Renamed3530();
            this.staticHitPoint.copy(_loc3_.position);
            this.Renamed10100.copy(_loc3_.normal);
         }
         this.shotDirection.copy(param1.Renamed1013());
         this.targets.length = 0;
         this.Renamed3143.length = 0;
         for each(_loc2_ in param1.Renamed3531())
         {
            this.targets.push(_loc2_.shape.body);
            this.Renamed3143.push(_loc2_.position);
         }
      }
      
      public function Renamed10110(param1:Renamed10101) : void
      {
         var _loc2_:int = int(param1.targets.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.targets[_loc3_] = param1.targets[_loc3_];
            this.Renamed3143[_loc3_] = param1.Renamed3143[_loc3_];
            _loc3_++;
         }
         this.targets.length = _loc2_;
         this.Renamed3143.length = _loc2_;
         this.hasStaticHit = param1.hasStaticHit;
         if(this.hasStaticHit)
         {
            this.staticHitPoint.copy(param1.staticHitPoint);
            this.Renamed10100.copy(param1.Renamed10100);
         }
      }
      
      public function Renamed3354(param1:Vector3, param2:Vector3) : void
      {
         this.hasStaticHit = true;
         this.staticHitPoint.copy(param1);
         this.Renamed10100.copy(param2);
      }
      
      public function Renamed3357() : Vector3
      {
         return this.hasStaticHit ? this.staticHitPoint : null;
      }
   }
}

