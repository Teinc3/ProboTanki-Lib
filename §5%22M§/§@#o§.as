package §5"m§
{
   import §8%§.§break catch final§;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapons.targeting.priority.§import package dynamic§;
   import §true catch null§.§&"g§;
   
   public class §@#o§
   {
      private const §with do§:int = 16;
      
      private var §super const dynamic§:§import package dynamic§;
      
      private var matrix:Matrix3;
      
      private var direction:Vector3;
      
      private var §in set final§:Vector.<§break catch final§>;
      
      private var §>#§:§get package include§;
      
      public function §@#o§(param1:§import package dynamic§)
      {
         this.matrix = new Matrix3();
         this.direction = new Vector3();
         this.§in set final§ = new Vector.<§break catch final§>();
         this.§>#§ = new §get package include§();
         super();
         this.§super const dynamic§ = param1;
      }
      
      public function §0!§(param1:§ !8§, param2:Vector.<§&"g§>) : Vector.<§break catch final§>
      {
         var _loc3_:§&"g§ = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = Number.NEGATIVE_INFINITY;
         this.§in set final§.length = 0;
         this.§>#§.clear();
         for each(_loc3_ in param2)
         {
            _loc4_ = _loc3_.§8"`§();
            while(!this.§>#§.isEmpty() && _loc6_ < _loc4_)
            {
               _loc5_ = Math.min(this.§>#§.§in package const§(),_loc4_);
               this.§[!]§(param1,_loc6_,_loc5_);
               this.§>#§.§if var class§(_loc5_);
               _loc6_ = _loc5_;
            }
            _loc6_ = _loc4_;
            this.§>#§.add(_loc3_);
         }
         while(!this.§>#§.isEmpty())
         {
            _loc5_ = this.§>#§.§in package const§();
            this.§[!]§(param1,_loc6_,_loc5_);
            this.§>#§.§if var class§(_loc5_);
            _loc6_ = _loc5_;
         }
         return this.§in set final§;
      }
      
      private function §[!]§(param1:§ !8§, param2:Number, param3:Number) : void
      {
         var _loc4_:Vector3 = null;
         var _loc5_:Number = param3 - param2;
         var _loc6_:Number = _loc5_ / this.§with do§;
         var _loc7_:Number = param2 + _loc6_ * 0.5;
         var _loc8_:Vector.<§&"g§> = this.§>#§.§#"§();
         this.matrix.fromAxisAngle(param1.§false var try§,_loc7_);
         this.matrix.transformVector(param1.direction,this.direction);
         this.matrix.fromAxisAngle(param1.§false var try§,_loc6_);
         var _loc9_:int = 0;
         while(_loc9_ < this.§with do§)
         {
            this.§in set final§.push(new §break catch final§(this.direction,_loc7_,this.§super const dynamic§.§6!^§(_loc7_,_loc8_)));
            _loc4_ = §+$%§.§@!c§;
            _loc4_.copy(this.direction);
            this.matrix.transformVector(_loc4_,this.direction);
            _loc7_ += _loc6_;
            _loc9_++;
         }
         if(param2 <= 0 && 0 <= param3)
         {
            this.§in set final§.push(new §break catch final§(param1.direction,0,this.§super const dynamic§.§6!^§(0,_loc8_)));
         }
      }
   }
}

