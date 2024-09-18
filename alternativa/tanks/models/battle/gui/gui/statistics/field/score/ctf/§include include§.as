package alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf
{
   public class §include include§
   {
      public var values:Vector.<Number>;
      
      private var maxValue:Number;
      
      private var minValue:Number;
      
      private var §,!@§:Vector.<int>;
      
      private var §extends catch§:Vector.<Number>;
      
      private var §package for final§:int;
      
      private var speeds:Vector.<Number>;
      
      private var §class set include§:Vector.<int>;
      
      private var §]!H§:Number;
      
      private var §for var in§:int = 0;
      
      public function §include include§(param1:Number, param2:Number, param3:Vector.<int>, param4:Vector.<Number>)
      {
         super();
         this.minValue = param1;
         this.maxValue = param2;
         this.§,!@§ = param3;
         this.§extends catch§ = param4;
         this.§]!H§ = param2 - param1;
         this.§package for final§ = param3.length;
         this.speeds = new Vector.<Number>(this.§package for final§);
         this.§class set include§ = new Vector.<int>(this.§package for final§);
         this.values = new Vector.<Number>(this.§package for final§);
      }
      
      public function start(param1:int) : void
      {
         if(this.§for var in§ == 0)
         {
            this.init(param1);
         }
         ++this.§for var in§;
      }
      
      public function stop() : void
      {
         --this.§for var in§;
      }
      
      public function update(param1:int, param2:int) : void
      {
         if(this.§for var in§ <= 0)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.§package for final§)
         {
            this.values[_loc3_] += this.speeds[_loc3_] * param2;
            if(this.values[_loc3_] > this.maxValue)
            {
               this.values[_loc3_] = this.maxValue;
            }
            if(this.values[_loc3_] < this.minValue)
            {
               this.values[_loc3_] = this.minValue;
            }
            if(param1 >= this.§class set include§[_loc3_])
            {
               this.§class set include§[_loc3_] += this.§,!@§[_loc3_];
               if(this.speeds[_loc3_] < 0)
               {
                  this.speeds[_loc3_] = this.§9Z§(1,this.§extends catch§[_loc3_],this.§,!@§[_loc3_]);
               }
               else
               {
                  this.speeds[_loc3_] = this.§9Z§(-1,this.§extends catch§[_loc3_],this.§,!@§[_loc3_]);
               }
            }
            _loc3_++;
         }
      }
      
      private function init(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§package for final§)
         {
            this.speeds[_loc2_] = this.§9Z§(-1,this.§extends catch§[_loc2_],this.§,!@§[_loc2_]);
            this.values[_loc2_] = this.maxValue;
            this.§class set include§[_loc2_] = param1 + this.§,!@§[_loc2_];
            _loc2_++;
         }
      }
      
      private function §9Z§(param1:Number, param2:Number, param3:int) : Number
      {
         return param1 * param2 * this.§]!H§ / param3;
      }
   }
}

