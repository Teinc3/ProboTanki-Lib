package alternativa.proplib.types
{
   import alternativa.proplib.objects.PropObject;
   
   public class PropState
   {
      public static const DEFAULT_NAME:String = "default";
      
      private var _lods:Vector.<PropLOD>;
      
      public function PropState()
      {
         this._lods = new Vector.<PropLOD>();
         super();
      }
      
      public function addLOD(param1:PropObject, param2:Number) : void
      {
         this._lods.push(new PropLOD(param1,param2));
      }
      
      public function get numLODs() : int
      {
         return this._lods.length;
      }
      
      public function lodByIndex(param1:int) : PropLOD
      {
         return this._lods[param1];
      }
      
      public function getDefaultObject() : PropObject
      {
         if(this._lods.length == 0)
         {
            throw new Error("No LODs found");
         }
         return PropLOD(this._lods[0]).prop;
      }
      
      public function traceState() : void
      {
         var _loc1_:PropLOD = null;
         for each(_loc1_ in this._lods)
         {
            _loc1_.traceLOD();
         }
      }
   }
}

