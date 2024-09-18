package alternativa.register
{
   import alternativa.model.IModel;
   import alternativa.object.ClientObject;
   import alternativa.service.IModelService;
   import flash.utils.Dictionary;
   
   public class ModelsRegister implements IModelService
   {
      private var modelInstances:Dictionary;
      
      private var modelInstancesByInterface:Dictionary;
      
      private var modelInterfaces:Dictionary;
      
      private var modelByMethod:Dictionary;
      
      private var modelsParamsStruct:Dictionary;
      
      private var _modelsList:Vector.<IModel>;
      
      public function ModelsRegister()
      {
         super();
         this.modelInterfaces = new Dictionary();
         this.modelInstances = new Dictionary();
         this.modelByMethod = new Dictionary();
         this.modelInstancesByInterface = new Dictionary();
         this.modelsParamsStruct = new Dictionary();
         this._modelsList = new Vector.<IModel>();
      }
      
      public function register(param1:String, param2:String) : void
      {
         this.modelByMethod[param2] = param1;
      }
      
      public function registerModelsParamsStruct(param1:String, param2:Class) : void
      {
         this.modelsParamsStruct[param1] = param2;
      }
      
      public function unregisterModelsParamsStruct(param1:String) : void
      {
         this.modelsParamsStruct[param1] = null;
      }
      
      public function getModelsParamsStruct(param1:String) : Class
      {
         return this.modelsParamsStruct[param1];
      }
      
      public function add(param1:IModel) : void
      {
         var _loc5_:Class = null;
         var _loc6_:Vector.<IModel> = null;
         this._modelsList.push(param1);
         var _loc2_:String = param1.id;
         this.modelInstances[_loc2_] = param1;
         var _loc3_:Vector.<Class> = param1.interfaces;
         this.modelInterfaces[_loc2_] = _loc3_;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            _loc6_ = this.modelInstancesByInterface[_loc5_];
            if(_loc6_ == null)
            {
               this.modelInstancesByInterface[_loc5_] = _loc6_ = new Vector.<IModel>();
            }
            _loc6_.push(param1);
            _loc4_++;
         }
      }
      
      public function remove(param1:String) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:IModel = null;
         var _loc4_:Vector.<Class> = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Class = null;
         var _loc8_:Vector.<IModel> = null;
         var _loc9_:int = 0;
         this._modelsList.splice(this._modelsList.indexOf(this.modelInstances[param1]),1);
         for(_loc2_ in this.modelByMethod)
         {
            _loc6_ = this.modelByMethod[_loc2_];
            if(_loc6_ == param1)
            {
               delete this.modelByMethod[_loc2_];
            }
         }
         _loc3_ = IModel(this.modelInstances[param1]);
         _loc4_ = this.modelInterfaces[param1] as Vector.<Class>;
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc7_ = _loc4_[_loc5_];
            _loc8_ = this.modelInstancesByInterface[_loc7_] as Vector.<IModel>;
            _loc9_ = int(_loc8_.indexOf(_loc3_));
            _loc8_.splice(_loc9_,1);
            _loc5_++;
         }
         delete this.modelInterfaces[param1];
         delete this.modelInstances[param1];
      }
      
      public function getModel(param1:String) : IModel
      {
         return this.modelInstances[param1];
      }
      
      public function getModelsByInterface(param1:Class) : Vector.<IModel>
      {
         return this.modelInstancesByInterface[param1];
      }
      
      public function getModelForObject(param1:ClientObject, param2:Class) : IModel
      {
         var _loc3_:String = null;
         var _loc4_:IModel = null;
         var _loc7_:Vector.<Class> = null;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            _loc3_ = "Object is null. Model interface = " + param2;
         }
         if(param2 == null)
         {
            _loc3_ = "Model interface is null. Object id = " + param1.id;
            throw new ArgumentError(_loc3_);
         }
         var _loc5_:Vector.<String> = param1.getModels();
         var _loc6_:int = int(_loc5_.length - 1);
         while(_loc6_ >= 0)
         {
            _loc7_ = this.modelInterfaces[_loc5_[_loc6_]] as Vector.<Class>;
            if(_loc7_ == null)
            {
               throw new Error("No interfaces found. Object id=" + param1.id + ", model id=" + _loc5_[_loc6_]);
            }
            _loc8_ = int(_loc7_.length - 1);
            while(_loc8_ >= 0)
            {
               if(_loc7_[_loc8_] == param2)
               {
                  if(_loc4_ == null)
                  {
                     _loc4_ = this.getModel(_loc5_[_loc6_]);
                     break;
                  }
                  throw new Error("MODEL REGISTER getModelForObject: Найдено несколько моделей с указанным интерфейсом.");
               }
               _loc8_--;
            }
            _loc6_--;
         }
         return _loc4_;
      }
      
      public function getModelsForObject(param1:ClientObject, param2:Class) : Vector.<IModel>
      {
         var _loc6_:Vector.<Class> = null;
         var _loc7_:int = 0;
         var _loc3_:Vector.<IModel> = new Vector.<IModel>();
         var _loc4_:Vector.<String> = param1.getModels();
         var _loc5_:int = int(_loc4_.length - 1);
         while(_loc5_ >= 0)
         {
            _loc6_ = this.modelInterfaces[_loc4_[_loc5_]] as Vector.<Class>;
            if(_loc6_ == null)
            {
               throw new Error("No interfaces found. Object id=" + param1.id + ", model id=" + _loc4_[_loc5_]);
            }
            _loc7_ = int(_loc6_.length - 1);
            while(_loc7_ >= 0)
            {
               if(_loc6_[_loc7_] == param2)
               {
                  _loc3_.push(this.getModel(_loc4_[_loc5_]));
                  break;
               }
               _loc7_--;
            }
            _loc5_--;
         }
         return _loc3_;
      }
      
      public function getInterfacesForModel(param1:String) : Vector.<Class>
      {
         return this.modelInterfaces[param1];
      }
      
      public function get modelsList() : Vector.<IModel>
      {
         return this._modelsList;
      }
   }
}

