package §5"m§
{
   import §true catch null§.§&"g§;
   
   public class §get package include§
   {
      private var §const var each§:Vector.<§&"g§>;
      
      private var §implements package each§:Vector.<§&"g§>;
      
      public function §get package include§()
      {
         this.§const var each§ = new Vector.<§&"g§>();
         this.§implements package each§ = new Vector.<§&"g§>();
         super();
      }
      
      public function clear() : void
      {
         this.§const var each§.length = 0;
         this.§implements package each§.length = 0;
      }
      
      public function §#"§() : Vector.<§&"g§>
      {
         return this.§implements package each§;
      }
      
      public function §in package const§() : Number
      {
         var _loc1_:§&"g§ = this.§const var each§[0];
         return _loc1_.§in package const§();
      }
      
      public function isEmpty() : Boolean
      {
         return this.§const var each§.length == 0;
      }
      
      public function add(param1:§&"g§) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:§&"g§ = null;
         var _loc4_:§&"g§ = null;
         _loc2_ = 0;
         while(_loc2_ < this.§const var each§.length)
         {
            _loc3_ = this.§const var each§[_loc2_];
            if(param1.§in package const§() < _loc3_.§in package const§())
            {
               break;
            }
            _loc2_++;
         }
         this.§const var each§.splice(_loc2_,0,param1);
         _loc2_ = 0;
         while(_loc2_ < this.§implements package each§.length)
         {
            _loc4_ = this.§implements package each§[_loc2_];
            if(param1.§6T§() < _loc4_.§6T§())
            {
               break;
            }
            _loc2_++;
         }
         this.§implements package each§.splice(_loc2_,0,param1);
      }
      
      public function §if var class§(param1:Number) : void
      {
         var _loc2_:§&"g§ = null;
         while(this.§const var each§.length > 0)
         {
            _loc2_ = §&"g§(this.§const var each§[0]);
            if(_loc2_.§in package const§() > param1)
            {
               break;
            }
            this.§false catch for§(this.§const var each§[0]);
         }
      }
      
      private function §false catch for§(param1:§&"g§) : void
      {
         this.§finally for function§(this.§const var each§,param1);
         this.§finally for function§(this.§implements package each§,param1);
      }
      
      private function §finally for function§(param1:Vector.<§&"g§>, param2:§&"g§) : void
      {
         param1.splice(param1.indexOf(param2),1);
      }
   }
}

