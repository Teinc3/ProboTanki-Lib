package alternativa.proplib.objects
{
   import alternativa.engine3d.core.Object3D;
   
   public class PropObject
   {
      public var object:Object3D;
      
      private var _type:int;
      
      public function PropObject(param1:int)
      {
         super();
         this._type = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function traceProp() : void
      {
      }
   }
}

