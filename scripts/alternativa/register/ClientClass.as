package alternativa.register
{
   import flash.utils.Dictionary;
   
   public class ClientClass
   {
      private var _name:String;
      
      private var _id:String;
      
      private var _parent:ClientClass;
      
      private var _children:Vector.<ClientClass>;
      
      private var _models:Vector.<String>;
      
      private var _modelsParams:Dictionary;
      
      public function ClientClass(param1:String, param2:ClientClass, param3:String, param4:Vector.<String> = null)
      {
         super();
         this._id = param1;
         this._parent = param2;
         this._name = param3;
         this._children = new Vector.<ClientClass>();
         this._modelsParams = new Dictionary();
         if(param4 != null)
         {
            this._models = param4;
         }
         else
         {
            this._models = new Vector.<String>();
         }
      }
      
      public function addChild(param1:ClientClass) : void
      {
         this._children.push(param1);
      }
      
      public function removeChild(param1:ClientClass) : void
      {
         this._children.splice(this._children.indexOf(param1),1);
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get parent() : ClientClass
      {
         return this._parent;
      }
      
      public function get children() : Vector.<ClientClass>
      {
         return this._children;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get models() : Vector.<String>
      {
         return this._models;
      }
      
      public function get modelsParams() : Dictionary
      {
         return this._modelsParams;
      }
      
      public function setModelParams(param1:String, param2:Object) : void
      {
         this._modelsParams[param1] = param2;
      }
      
      public function toString() : String
      {
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc1_:* = "\nClientClass";
         _loc1_ += "\n   id: " + this._id;
         _loc1_ += "\n   name: " + this._name;
         if(this._parent != null)
         {
            _loc1_ += "\n   parent id: " + this._parent.id;
         }
         if(this._children.length > 0)
         {
            _loc1_ += "\n   children id:";
            _loc2_ = 0;
            while(_loc2_ < this._children.length)
            {
               _loc1_ += " " + ClientClass(this._children[_loc2_]).id;
               _loc2_++;
            }
         }
         if(this._models.length > 0)
         {
            _loc1_ += "\n   models: " + this._models;
            _loc1_ += "\n   modelParams: \n";
            for(_loc3_ in this._modelsParams)
            {
               _loc1_ += "\n   " + _loc3_.toString() + ": " + this._modelsParams[_loc3_];
            }
         }
         return _loc1_ + "\n";
      }
   }
}

