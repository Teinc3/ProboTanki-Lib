package Renamed356
{
   public class Renamed1443
   {
      private var Renamed6544:int;
      
      private var Renamed8139:Class;
      
      private var objects:Vector.<Object>;
      
      public function Renamed1443(param1:Class)
      {
         this.objects = new Vector.<Object>();
         super();
         this.Renamed8139 = param1;
      }
      
      final public function Renamed8140() : int
      {
         return this.Renamed6544;
      }
      
      final public function getObject() : Object
      {
         if(this.Renamed6544 == 0)
         {
            return new this.Renamed8139(this);
         }
         var _loc1_:Object = this.objects[--this.Renamed6544];
         this.objects[this.Renamed6544] = null;
         return _loc1_;
      }
      
      final public function Renamed8141(param1:Object) : void
      {
         if(this.Renamed8139 != param1.constructor)
         {
            throw new ArgumentError();
         }
         var _loc2_:* = this.Renamed6544++;
         this.objects[_loc2_] = param1;
      }
      
      final public function clear() : void
      {
         this.objects.length = 0;
         this.Renamed6544 = 0;
      }
   }
}

