package platform.client.fp10.core.type.impl
{
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.IGameObjectInternal;
   import platform.client.fp10.core.type.ISpace;
   
   public class GameObject implements IGameObject, IGameObjectInternal
   {
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      private var _name:String;
      
      private var _id:Long;
      
      private var _gameClass:GameClass;
      
      private var _space:ISpace;
      
      private var data:Dictionary;
      
      private var _adapts:Dictionary;
      
      private var _events:Dictionary;
      
      private var _multiAdapts:Dictionary;
      
      public function GameObject(param1:Long, param2:GameClass, param3:String, param4:ISpace)
      {
         this.data = new Dictionary();
         this._adapts = new Dictionary();
         this._events = new Dictionary();
         this._multiAdapts = new Dictionary();
         super();
         this._id = param1;
         this._gameClass = param2;
         this._name = param3;
         this._space = param4;
      }
      
      public function get id() : Long
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gameClass() : IGameClass
      {
         return this._gameClass;
      }
      
      public function get space() : ISpace
      {
         return this._space;
      }
      
      public function event(param1:Class) : Object
      {
         var _loc2_:Object = this._events[param1];
         if(_loc2_ == null)
         {
            _loc2_ = this._adapt(param1,true);
            this._events[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public function hasModel(param1:Class) : Boolean
      {
         if(this._adapts[param1] == null)
         {
            return modelRegistry.getModelsForObject(this,param1).length > 0;
         }
         return true;
      }
      
      public function adapt(param1:Class) : Object
      {
         var _loc2_:Object = this._adapts[param1];
         if(_loc2_ == null)
         {
            _loc2_ = this._adapt(param1,false);
            if(_loc2_ == null)
            {
               throw new Error("GameObject::adapt() No models have been found. Object: " + this + ", interface: " + param1);
            }
            this._adapts[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public function putData(param1:Model, param2:Class, param3:Object) : void
      {
         var _loc4_:Dictionary = this.data[param1];
         if(_loc4_ == null)
         {
            _loc4_ = new Dictionary();
            this.data[param1] = _loc4_;
         }
         _loc4_[param2] = param3;
      }
      
      public function getData(param1:Model, param2:Class) : Object
      {
         var _loc3_:Dictionary = this.data[param1];
         return _loc3_ == null ? null : _loc3_[param2];
      }
      
      public function clearData(param1:Model, param2:Class) : Object
      {
         var _loc3_:Dictionary = this.data[param1];
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:Object = _loc3_[param2];
         delete _loc3_[param2];
         return _loc4_;
      }
      
      public function toString() : String
      {
         return "[GameObject id=" + this._id + "]";
      }
      
      private function _adapt(param1:Class, param2:Boolean) : Object
      {
         var _loc3_:uint = 0;
         var _loc4_:Vector.<IModel> = modelRegistry.getModelsForObject(this,param1);
         if(!param2)
         {
            _loc3_ = _loc4_.length;
            if(_loc3_ > 1)
            {
               throw new Error("GameObject::_adapt() Multiple models have been found. Object: " + this + ", interface: " + param1);
            }
            if(_loc3_ == 0)
            {
               return null;
            }
         }
         var _loc5_:Class = param2 ? modelRegistry.getEventsClass(param1) : modelRegistry.getAdaptClass(param1);
         if(_loc5_ == null)
         {
            throw new Error("Proxy class not found for specified interface");
         }
         return new _loc5_(this,param2 ? _loc4_ : _loc4_[0]);
      }
      
      public function clear() : void
      {
         this.clearModelsInitParams();
         this._gameClass = null;
         this._space = null;
         this.clearModelData();
         this.clearDictionary(this._adapts);
         this.clearDictionary(this._multiAdapts);
         this.clearDictionary(this._events);
      }
      
      private function clearModelData() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Dictionary = null;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         for(_loc1_ in this.data)
         {
            _loc2_ = this.data[_loc1_];
            for(_loc3_ in _loc2_)
            {
               _loc4_ = _loc2_[_loc3_];
               if(_loc4_ is AutoClosable)
               {
                  AutoClosable(_loc4_).close();
               }
               delete _loc2_[_loc3_];
            }
            delete this.data[_loc1_];
         }
      }
      
      private function clearModelsInitParams() : void
      {
         var _loc1_:IModel = null;
         var _loc2_:Vector.<IModel> = modelRegistry.getModelsForObject(this,IModel);
         Model.object = this;
         for each(_loc1_ in _loc2_)
         {
            _loc1_.clearInitParams();
         }
         Model.popObject();
      }
      
      private function clearDictionary(param1:Dictionary) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in param1)
         {
            delete param1[_loc2_];
         }
      }
   }
}

