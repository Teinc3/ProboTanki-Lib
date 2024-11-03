package alternativa.proplib.types
{
   import alternativa.proplib.objects.PropObject;
   
   public class PropLOD
   {
      public var prop:PropObject;
      
      public var distance:Number;
      
      public function PropLOD(param1:PropObject, param2:Number)
      {
         super();
         this.prop = param1;
         this.distance = param2;
      }
      
      public function traceLOD() : void
      {
         this.prop.traceProp();
      }
   }
}

