package alternativa.proplib.types
{
   public class PropData
   {
      private var _name:String;
      
      private var states:Object;
      
      public function PropData(param1:String)
      {
         this.states = {};
         super();
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function addState(param1:String, param2:PropState) : void
      {
         this.states[param1] = param2;
      }
      
      public function getStateByName(param1:String) : PropState
      {
         return this.states[param1];
      }
      
      public function getDefaultState() : PropState
      {
         return this.states[PropState.DEFAULT_NAME];
      }
      
      public function toString() : String
      {
         return "[Prop name=" + this._name + "]";
      }
      
      public function traceProp() : void
      {
         var _loc1_:String = null;
         var _loc2_:PropState = null;
         for(_loc1_ in this.states)
         {
            _loc2_ = this.states[_loc1_];
            _loc2_.traceState();
         }
      }
   }
}

