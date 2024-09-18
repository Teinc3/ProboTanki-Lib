package §9!B§
{
   import §8%§.§]#N§;
   import §8%§.§break catch final§;
   import alternativa.math.Vector3;
   import alternativa.tanks.models.weapon.§ !8§;
   
   public class §2#]§ implements §]#N§
   {
      private const §8#Q§:int = 11;
      
      private var §3!D§:Vector3;
      
      private var §;"y§:Vector3;
      
      private var angle:Number;
      
      private var screenSize:Number;
      
      private var §"!2§:Vector3;
      
      public function §2#]§(param1:Number)
      {
         this.§3!D§ = new Vector3();
         this.§;"y§ = new Vector3();
         super();
         this.angle = param1 / 2;
         this.screenSize = Math.tan(this.angle) * 2;
      }
      
      public function §set package try§(param1:Vector3) : void
      {
         this.§"!2§ = param1;
      }
      
      public function §^"&§() : void
      {
         this.§"!2§ = null;
      }
      
      public function §-#B§(param1:§ !8§) : Vector.<§break catch final§>
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         this.§3!D§.cross2(param1.§false var try§,param1.direction);
         var _loc5_:Vector.<§break catch final§> = new Vector.<§break catch final§>();
         var _loc6_:Number = this.screenSize / (this.§8#Q§ - 1);
         var _loc7_:Number = -this.screenSize * 0.5;
         var _loc8_:int = 0;
         while(_loc8_ < this.§8#Q§)
         {
            _loc2_ = -this.screenSize * 0.5;
            _loc3_ = 0;
            while(_loc3_ < this.§8#Q§)
            {
               this.§;"y§.copy(param1.direction);
               this.§;"y§.addScaled(_loc7_,this.§3!D§);
               this.§;"y§.addScaled(_loc2_,param1.§false var try§);
               this.§;"y§.normalize();
               _loc4_ = Math.acos(this.§;"y§.dot(param1.direction));
               if(_loc4_ <= this.angle)
               {
                  _loc5_.push(new §break catch final§(this.§;"y§,_loc4_,Number.MAX_VALUE));
               }
               _loc2_ += _loc6_;
               _loc3_++;
            }
            _loc7_ += _loc6_;
            _loc8_++;
         }
         if(this.§"!2§ != null)
         {
            _loc5_.push(new §break catch final§(this.§"!2§,Math.acos(this.§"!2§.dot(param1.direction)),Number.MAX_VALUE,10));
         }
         return _loc5_;
      }
   }
}

