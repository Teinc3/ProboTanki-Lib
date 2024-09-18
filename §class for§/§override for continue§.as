package §class for§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapons.targeting.§package for extends§;
   
   public class §override for continue§
   {
      public var staticHitPoint:Vector3;
      
      public var §!"!§:Vector3;
      
      public var hasStaticHit:Boolean;
      
      public var targets:Vector.<Body>;
      
      public var §class package const§:Vector.<Vector3>;
      
      public var shotDirection:Vector3;
      
      public function §override for continue§()
      {
         this.staticHitPoint = new Vector3();
         this.§!"!§ = new Vector3();
         this.targets = new Vector.<Body>();
         this.§class package const§ = new Vector.<Vector3>();
         this.shotDirection = new Vector3();
         super();
      }
      
      public function §in try§(param1:§package for extends§) : void
      {
         var _loc2_:RayHit = null;
         var _loc3_:RayHit = null;
         if(this.hasStaticHit = param1.hasStaticHit())
         {
            _loc3_ = param1.§,!x§();
            this.staticHitPoint.copy(_loc3_.position);
            this.§!"!§.copy(_loc3_.normal);
         }
         this.shotDirection.copy(param1.§do var§());
         this.targets.length = 0;
         this.§class package const§.length = 0;
         for each(_loc2_ in param1.§##2§())
         {
            this.targets.push(_loc2_.shape.body);
            this.§class package const§.push(_loc2_.position);
         }
      }
      
      public function §>h§(param1:§do for override§) : void
      {
         var _loc2_:int = int(param1.targets.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.targets[_loc3_] = param1.targets[_loc3_];
            this.§class package const§[_loc3_] = param1.§class package const§[_loc3_];
            _loc3_++;
         }
         this.targets.length = _loc2_;
         this.§class package const§.length = _loc2_;
         this.hasStaticHit = param1.hasStaticHit;
         if(this.hasStaticHit)
         {
            this.staticHitPoint.copy(param1.staticHitPoint);
            this.§!"!§.copy(param1.§!"!§);
         }
      }
      
      public function §=X§(param1:Vector3, param2:Vector3) : void
      {
         this.hasStaticHit = true;
         this.staticHitPoint.copy(param1);
         this.§!"!§.copy(param2);
      }
      
      public function §set use§() : Vector3
      {
         return this.hasStaticHit ? this.staticHitPoint : null;
      }
   }
}

