package scpacker
{
   import alternativa.model.IModel;
   import alternativa.object.ClientObject;
   
   public class Base implements IModel
   {
      public var _interfaces:Vector.<Class>;
      
      public function Base()
      {
         super();
         this._interfaces = new Vector.<Class>();
      }
      
      public function _initObject(param1:ClientObject, param2:Object) : void
      {
      }
      
      public function get id() : String
      {
         return "";
      }
      
      public function get interfaces() : Vector.<Class>
      {
         return this._interfaces;
      }
   }
}

