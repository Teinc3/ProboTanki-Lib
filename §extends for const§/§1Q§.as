package §extends for const§
{
   public class §1Q§
   {
      private var §!!-§:int;
      
      private var §;w§:Class;
      
      private var objects:Vector.<Object>;
      
      public function §1Q§(param1:Class)
      {
         this.objects = new Vector.<Object>();
         super();
         this.§;w§ = param1;
      }
      
      final public function §0!4§() : int
      {
         return this.§!!-§;
      }
      
      final public function getObject() : Object
      {
         if(this.§!!-§ == 0)
         {
            return new this.§;w§(this);
         }
         var _loc1_:Object = this.objects[--this.§!!-§];
         this.objects[this.§!!-§] = null;
         return _loc1_;
      }
      
      final public function §break catch var§(param1:Object) : void
      {
         if(this.§;w§ != param1.constructor)
         {
            throw new ArgumentError();
         }
         var _loc2_:* = this.§!!-§++;
         this.objects[_loc2_] = param1;
      }
      
      final public function clear() : void
      {
         this.objects.length = 0;
         this.§!!-§ = 0;
      }
   }
}

