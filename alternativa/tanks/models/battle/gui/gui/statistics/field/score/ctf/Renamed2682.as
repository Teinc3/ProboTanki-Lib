package alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf
{
   public class Renamed2682
   {
      public var values:Vector.<Number>;
      
      private var maxValue:Number;
      
      private var minValue:Number;
      
      private var Renamed2700:Vector.<int>;
      
      private var Renamed2701:Vector.<Number>;
      
      private var Renamed2702:int;
      
      private var speeds:Vector.<Number>;
      
      private var Renamed2703:Vector.<int>;
      
      private var Renamed2704:Number;
      
      private var Renamed2705:int = 0;
      
      public function Renamed2682(param1:Number, param2:Number, param3:Vector.<int>, param4:Vector.<Number>)
      {
         super();
         this.minValue = param1;
         this.maxValue = param2;
         this.Renamed2700 = param3;
         this.Renamed2701 = param4;
         this.Renamed2704 = param2 - param1;
         this.Renamed2702 = param3.length;
         this.speeds = new Vector.<Number>(this.Renamed2702);
         this.Renamed2703 = new Vector.<int>(this.Renamed2702);
         this.values = new Vector.<Number>(this.Renamed2702);
      }
      
      public function start(param1:int) : void
      {
         if(this.Renamed2705 == 0)
         {
            this.init(param1);
         }
         ++this.Renamed2705;
      }
      
      public function stop() : void
      {
         --this.Renamed2705;
      }
      
      public function update(param1:int, param2:int) : void
      {
         if(this.Renamed2705 <= 0)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed2702)
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
            if(param1 >= this.Renamed2703[_loc3_])
            {
               this.Renamed2703[_loc3_] += this.Renamed2700[_loc3_];
               if(this.speeds[_loc3_] < 0)
               {
                  this.speeds[_loc3_] = this.Renamed2706(1,this.Renamed2701[_loc3_],this.Renamed2700[_loc3_]);
               }
               else
               {
                  this.speeds[_loc3_] = this.Renamed2706(-1,this.Renamed2701[_loc3_],this.Renamed2700[_loc3_]);
               }
            }
            _loc3_++;
         }
      }
      
      private function init(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.Renamed2702)
         {
            this.speeds[_loc2_] = this.Renamed2706(-1,this.Renamed2701[_loc2_],this.Renamed2700[_loc2_]);
            this.values[_loc2_] = this.maxValue;
            this.Renamed2703[_loc2_] = param1 + this.Renamed2700[_loc2_];
            _loc2_++;
         }
      }
      
      private function Renamed2706(param1:Number, param2:Number, param3:int) : Number
      {
         return param1 * param2 * this.Renamed2704 / param3;
      }
   }
}

