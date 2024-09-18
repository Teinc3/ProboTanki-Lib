package alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf
{
   public class §1!"§
   {
      public var §7h§:uint;
      
      private var §var true§:Number;
      
      private var §for const each§:Number;
      
      private var §[G§:Number;
      
      public function §1!"§(param1:uint, param2:uint)
      {
         super();
         this.§7h§ = param1;
         this.§var true§ = (param2 >> 16 & 0xFF) - (param1 >> 16 & 0xFF);
         this.§for const each§ = (param2 >> 8 & 0xFF) - (param1 >> 8 & 0xFF);
         this.§[G§ = (param2 & 0xFF) - (param1 & 0xFF);
      }
      
      public function interpolate(param1:Number) : uint
      {
         var _loc2_:int = (this.§7h§ >> 16 & 0xFF) + param1 * this.§var true§;
         var _loc3_:int = (this.§7h§ >> 8 & 0xFF) + param1 * this.§for const each§;
         var _loc4_:int = (this.§7h§ & 0xFF) + param1 * this.§[G§;
         return _loc2_ << 16 | _loc3_ << 8 | _loc4_;
      }
   }
}

