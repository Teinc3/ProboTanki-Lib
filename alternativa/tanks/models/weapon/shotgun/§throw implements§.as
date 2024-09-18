package alternativa.tanks.models.weapon.shotgun
{
   import §2"X§.§[q§;
   import alternativa.math.Vector3;
   
   public class §throw implements§
   {
      private static const §[!Y§:Vector3 = new Vector3();
      
      private static const §throw for native§:Vector3 = new Vector3();
      
      private var §in set final§:Vector.<Vector3>;
      
      private var result:Vector.<Vector3>;
      
      private var params:§[q§;
      
      private var §for set finally§:Number;
      
      private var §break catch super§:Number;
      
      public function §throw implements§(param1:§[q§)
      {
         super();
         this.§for set finally§ = Math.tan(param1.coneHorizontalAngle * 0.5);
         this.§break catch super§ = Math.tan(param1.coneVerticalAngle * 0.5);
         this.params = param1;
         this.§in set final§ = new Vector.<Vector3>(param1.pelletCount,true);
         this.result = new Vector.<Vector3>(param1.pelletCount,true);
         var _loc2_:int = 0;
         while(_loc2_ < this.§in set final§.length)
         {
            this.§in set final§[_loc2_] = new Vector3();
            this.result[_loc2_] = new Vector3();
            _loc2_++;
         }
      }
      
      public function next() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§in set final§.length)
         {
            this.§9!!§(this.§in set final§[_loc1_]);
            _loc1_++;
         }
      }
      
      private function §9!!§(param1:Vector3) : void
      {
         var _loc2_:Number = Math.random();
         var _loc3_:Number = Math.random() * Math.PI * 2;
         param1.x = Math.cos(_loc3_) * _loc2_ * this.§for set finally§;
         param1.y = Math.sin(_loc3_) * _loc2_ * this.§break catch super§;
      }
      
      public function §@!9§(param1:Vector3, param2:Vector3) : Vector.<Vector3>
      {
         var _loc3_:Vector3 = null;
         this.§[#2§(param1,param2);
         var _loc4_:int = 0;
         while(_loc4_ < this.§in set final§.length)
         {
            _loc3_ = this.§in set final§[_loc4_];
            this.§6# §(_loc3_.x,_loc3_.y,param2,this.result[_loc4_]);
            _loc4_++;
         }
         return this.result;
      }
      
      private function §6# §(param1:Number, param2:Number, param3:Vector3, param4:Vector3) : void
      {
         param4.reset();
         param4.addScaled(param1,§[!Y§);
         param4.addScaled(param2,§throw for native§);
         param4.add(param3);
         param4.normalize();
      }
      
      private function §[#2§(param1:Vector3, param2:Vector3) : void
      {
         §[!Y§.copy(param1);
         §throw for native§.cross2(§[!Y§,param2).normalize();
      }
   }
}

