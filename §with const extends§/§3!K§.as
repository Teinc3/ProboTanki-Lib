package §with const extends§
{
   public class §3!K§ implements §8!X§
   {
      private static const §case for const§:int = 1;
      
      private static const §throw const import§:int = 2;
      
      private static const §package var try§:int = 3;
      
      private var type:int;
      
      private var §false package include§:§#"5§;
      
      private var §]9§:int;
      
      private var time:int;
      
      private var §^$!§:Number = 0.01;
      
      private var §default set include§:Number = 0.001;
      
      private var state:int;
      
      public function §3!K§(param1:int, param2:§#"5§, param3:Number, param4:Number, param5:int)
      {
         super();
         this.type = param1;
         this.§false package include§ = param2;
         this.§^$!§ = param3;
         this.§default set include§ = param4;
         this.§]9§ = param5;
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function start() : void
      {
         this.§false package include§.§?#^§.visible = true;
         this.§false package include§.§?#^§.alpha = 1;
         this.§false package include§.§if catch dynamic§.visible = false;
         this.§false package include§.§null catch extends§.visible = true;
         this.§false package include§.§null catch extends§.alpha = 0;
         this.state = §case for const§;
      }
      
      public function stop() : void
      {
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:Number = this.§false package include§.§?#^§.alpha;
         switch(this.state)
         {
            case §case for const§:
               _loc3_ -= this.§^$!§ * param2;
               if(_loc3_ <= 0)
               {
                  _loc3_ = 0;
                  this.state = §throw const import§;
                  this.time = this.§]9§;
               }
               break;
            case §throw const import§:
               this.time -= param2;
               if(this.time <= 0)
               {
                  this.state = §package var try§;
               }
               break;
            case §package var try§:
               _loc3_ += this.§default set include§ * param2;
               if(_loc3_ >= 1)
               {
                  this.§false package include§.setState(§#"5§.§const package while§);
               }
         }
         this.§false package include§.§?#^§.alpha = _loc3_;
         this.§false package include§.§null catch extends§.alpha = 1 - _loc3_;
      }
   }
}

