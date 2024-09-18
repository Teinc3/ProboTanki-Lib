package §%"v§
{
   internal class §4#F§
   {
      private static const §throw package set§:int = 500;
      
      private static const §implements for try§:int = 700;
      
      private static const §>!%§:int = 2000;
      
      private static const §try default§:int = 10000;
      
      private static const ALPHA:Number = 0.6;
      
      private const §[b§:int = 18;
      
      private var §?"`§:Vector.<§return const§>;
      
      private var §?#@§:Vector.<§return const§>;
      
      public var §use package var§:Boolean;
      
      private var label:Label;
      
      private var states:Vector.<§return const§>;
      
      private var §4!P§:int;
      
      public function §4#F§()
      {
         this.label = new Label();
         super();
         this.§?"`§ = Vector.<§return const§>([new §5#Z§(this,§throw package set§,0,1),new §8"M§(§>!%§),new §5#Z§(this,§implements for try§,1,ALPHA),new §8"M§(§try default§),new §5#Z§(this,§implements for try§,ALPHA,0)]);
         this.§?#@§ = Vector.<§return const§>([new §5#Z§(this,§implements for try§,1,ALPHA),new §8"M§(§try default§),new §5#Z§(this,§implements for try§,ALPHA,0)]);
         this.label.size = this.§[b§;
         this.label.bold = true;
      }
      
      public function init() : void
      {
         this.§use package var§ = false;
         this.§4!P§ = 0;
         this.states = this.§?"`§;
         var _loc1_:§return const§ = this.states[0];
         _loc1_.init();
      }
      
      public function §package catch return§(param1:int) : void
      {
         this.§use package var§ = false;
         this.§4!P§ = 0;
         this.states = this.§?#@§;
         var _loc2_:§return const§ = this.states[1];
         _loc2_.§if for extends§(param1);
         var _loc3_:§return const§ = this.states[0];
         _loc3_.init();
      }
      
      public function update(param1:int) : void
      {
         var _loc2_:§return const§ = null;
         var _loc3_:§return const§ = null;
         if(!this.§use package var§)
         {
            _loc2_ = this.states[this.§4!P§];
            if(!_loc2_.update(param1))
            {
               if(++this.§4!P§ == this.states.length)
               {
                  this.§use package var§ = true;
               }
               else
               {
                  _loc3_ = this.states[this.§4!P§];
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

