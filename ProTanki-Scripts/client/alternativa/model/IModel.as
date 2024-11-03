package alternativa.model
{
   import alternativa.object.ClientObject;
   
   public interface IModel
   {
      function _initObject(param1:ClientObject, param2:Object) : void;
      
      function get id() : String;
      
      function get interfaces() : Vector.<Class>;
   }
}

