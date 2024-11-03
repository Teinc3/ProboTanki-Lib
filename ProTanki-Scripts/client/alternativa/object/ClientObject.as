package alternativa.object
{
   import alternativa.model.IModel;
   import alternativa.register.ClientClass;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import projects.tanks.client.panel.model.User;
   
   public class ClientObject
   {
      private var _name:String;
      
      private var _id:String;
      
      private var _clientClass:ClientClass;
      
      private var models:Vector.<Long>;
      
      private var initParams:Dictionary;
      
      private var runtimeParams:Dictionary;
      
      private var user:User;
      
      public function ClientObject(param1:String, param2:ClientClass, param3:String, param4:String = null)
      {
         super();
         this._id = param1;
         this._clientClass = param2;
         this._name = param3;
         if(this.models != null)
         {
            this.models = this.models;
         }
         else
         {
            this.models = new Vector.<Long>();
         }
         this.initParams = new Dictionary();
         this.runtimeParams = new Dictionary();
      }
      
      public function getParams(param1:Class) : Object
      {
         return this.runtimeParams[param1];
      }
      
      public function putParams(param1:Class, param2:Object) : void
      {
         this.runtimeParams[param1] = param2;
      }
      
      public function removeParams(param1:Class) : Object
      {
         var _loc2_:Object = this.runtimeParams[param1];
         delete this.runtimeParams[param1];
         return _loc2_;
      }
      
      public function getInitParams(param1:IModel) : Object
      {
         return this.initParams[param1];
      }
      
      public function putInitParams(param1:IModel, param2:Object) : void
      {
         this.initParams[param1] = param2;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get clientClass() : ClientClass
      {
         return this._clientClass;
      }
      
      public function getModels() : Vector.<String>
      {
         return this._clientClass.models;
      }
   }
}

