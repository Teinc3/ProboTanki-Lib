package Renamed460
{
   public class Renamed9143 implements Renamed9141
   {
      private static const Renamed9146:int = 1;
      
      private static const Renamed9147:int = 2;
      
      private static const Renamed9148:int = 3;
      
      private var type:int;
      
      private var Renamed3328:Renamed2657;
      
      private var Renamed9149:int;
      
      private var time:int;
      
      private var Renamed9150:Number = 0.01;
      
      private var Renamed9151:Number = 0.001;
      
      private var state:int;
      
      public function Renamed9143(param1:int, param2:Renamed2657, param3:Number, param4:Number, param5:int)
      {
         super();
         this.type = param1;
         this.Renamed3328 = param2;
         this.Renamed9150 = param3;
         this.Renamed9151 = param4;
         this.Renamed9149 = param5;
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function start() : void
      {
         this.Renamed3328.Renamed9139.visible = true;
         this.Renamed3328.Renamed9139.alpha = 1;
         this.Renamed3328.Renamed9140.visible = false;
         this.Renamed3328.Renamed2695.visible = true;
         this.Renamed3328.Renamed2695.alpha = 0;
         this.state = Renamed9146;
      }
      
      public function stop() : void
      {
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:Number = this.Renamed3328.Renamed9139.alpha;
         switch(this.state)
         {
            case Renamed9146:
               _loc3_ -= this.Renamed9150 * param2;
               if(_loc3_ <= 0)
               {
                  _loc3_ = 0;
                  this.state = Renamed9147;
                  this.time = this.Renamed9149;
               }
               break;
            case Renamed9147:
               this.time -= param2;
               if(this.time <= 0)
               {
                  this.state = Renamed9148;
               }
               break;
            case Renamed9148:
               _loc3_ += this.Renamed9151 * param2;
               if(_loc3_ >= 1)
               {
                  this.Renamed3328.setState(Renamed2657.Renamed2686);
               }
         }
         this.Renamed3328.Renamed9139.alpha = _loc3_;
         this.Renamed3328.Renamed2695.alpha = 1 - _loc3_;
      }
   }
}

