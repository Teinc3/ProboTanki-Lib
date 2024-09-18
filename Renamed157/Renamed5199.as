package Renamed5196
{
   internal class Renamed5199
   {
      private static const Renamed5210:int = 500;
      
      private static const Renamed5211:int = 700;
      
      private static const Renamed5212:int = 2000;
      
      private static const Renamed5213:int = 10000;
      
      private static const ALPHA:Number = 0.6;
      
      private const Renamed5214:int = 18;
      
      private var Renamed5215:Vector.<Renamed5216>;
      
      private var Renamed5217:Vector.<Renamed5216>;
      
      public var Renamed5207:Boolean;
      
      private var label:Label;
      
      private var states:Vector.<Renamed5216>;
      
      private var Renamed5218:int;
      
      public function Renamed5199()
      {
         this.label = new Label();
         super();
         this.Renamed5215 = Vector.<Renamed5216>([new Renamed5219(this,Renamed5210,0,1),new Renamed5220(Renamed5212),new Renamed5219(this,Renamed5211,1,ALPHA),new Renamed5220(Renamed5213),new Renamed5219(this,Renamed5211,ALPHA,0)]);
         this.Renamed5217 = Vector.<Renamed5216>([new Renamed5219(this,Renamed5211,1,ALPHA),new Renamed5220(Renamed5213),new Renamed5219(this,Renamed5211,ALPHA,0)]);
         this.label.size = this.Renamed5214;
         this.label.bold = true;
      }
      
      public function init() : void
      {
         this.Renamed5207 = false;
         this.Renamed5218 = 0;
         this.states = this.Renamed5215;
         var _loc1_:Renamed5216 = this.states[0];
         _loc1_.init();
      }
      
      public function Renamed5205(param1:int) : void
      {
         this.Renamed5207 = false;
         this.Renamed5218 = 0;
         this.states = this.Renamed5217;
         var _loc2_:Renamed5216 = this.states[1];
         _loc2_.Renamed5221(param1);
         var _loc3_:Renamed5216 = this.states[0];
         _loc3_.init();
      }
      
      public function update(param1:int) : void
      {
         var _loc2_:Renamed5216 = null;
         var _loc3_:Renamed5216 = null;
         if(!this.Renamed5207)
         {
            _loc2_ = this.states[this.Renamed5218];
            if(!_loc2_.update(param1))
            {
               if(++this.Renamed5218 == this.states.length)
               {
                  this.Renamed5207 = true;
               }
               else
               {
                  _loc3_ = this.states[this.Renamed5218];
                  _loc3_.init();
               }
            }
         }
      }
      
      public function setAlpha(param1:Number) : void
      {
         this.label.alpha = param1;
      }
      
      public function getLabel() : Label
      {
         return this.label;
      }
   }
}

