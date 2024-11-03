package alternativa.osgi.catalogs
{
   import alternativa.osgi.ServiceParamNames;
   import flash.utils.Dictionary;
   
   public class ServicesCatalog
   {
      protected var _namedServicesDictionary:Dictionary;
      
      protected var _nullParamsServiceDictionary:Dictionary;
      
      public function ServicesCatalog()
      {
         super();
         this._namedServicesDictionary = new Dictionary();
         this._nullParamsServiceDictionary = new Dictionary();
      }
      
      public function getService(param1:Class, param2:String) : Object
      {
         var _loc3_:String = null;
         var _loc4_:NamedServicesCatalog = null;
         if(param2)
         {
            _loc3_ = this.getNameByFilter(param2);
            if(_loc3_ != null)
            {
               _loc4_ = this._namedServicesDictionary[param1];
               if(_loc4_ != null)
               {
                  return _loc4_.getService(_loc3_);
               }
            }
            return null;
         }
         return this._nullParamsServiceDictionary[param1];
      }
      
      public function getNameByFilter(param1:String) : String
      {
         var _loc2_:String = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:RegExp = / /gi;
         param1 = param1.replace(_loc3_,"");
         var _loc4_:int = int(param1.indexOf("name="));
         if(_loc4_ != -1)
         {
            _loc2_ = param1.substr(_loc4_ + 5,param1.length - _loc4_ - 5);
            _loc4_ = int(_loc2_.indexOf(")"));
            if(_loc4_ != -1)
            {
               return _loc2_.substr(0,_loc4_);
            }
            return _loc2_;
         }
         return null;
      }
      
      public function addService(param1:Class, param2:Object, param3:Dictionary) : void
      {
         var _loc4_:String = null;
         var _loc5_:NamedServicesCatalog = null;
         if(param3 == null)
         {
            if(this._nullParamsServiceDictionary[param1] != null)
            {
               throw new ArgumentError("Service " + param1 + " without parameters is already registered");
            }
            this._nullParamsServiceDictionary[param1] = param2;
         }
         else
         {
            _loc4_ = param3[ServiceParamNames.PARAM_NAME];
            if(_loc4_ == null)
            {
               throw new ArgumentError("Invalid params. You can only use the parameter \'name\'");
            }
            _loc5_ = this._namedServicesDictionary[param1];
            if(_loc5_ == null)
            {
               _loc5_ = new NamedServicesCatalog(param1);
               this._namedServicesDictionary[param1] = _loc5_;
            }
            _loc5_.addService(_loc4_,param2);
         }
      }
      
      public function removeService(param1:Class, param2:Dictionary) : Object
      {
         var _loc3_:String = null;
         var _loc4_:NamedServicesCatalog = null;
         var _loc5_:Object = null;
         if(param2 != null)
         {
            _loc3_ = param2[ServiceParamNames.PARAM_NAME];
            if(_loc3_ != null)
            {
               _loc4_ = this._namedServicesDictionary[param1];
               if(_loc4_ != null)
               {
                  return _loc4_.removeService(_loc3_);
               }
            }
            return null;
         }
         _loc5_ = this._nullParamsServiceDictionary[param1];
         delete this._nullParamsServiceDictionary[param1];
         return _loc5_;
      }
      
      public function get serviceList() : Vector.<Object>
      {
         var _loc1_:Object = null;
         var _loc2_:NamedServicesCatalog = null;
         var _loc3_:Vector.<Object> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<Object> = new Vector.<Object>();
         for each(_loc1_ in this._nullParamsServiceDictionary)
         {
            _loc6_.push(_loc1_);
         }
         for each(_loc2_ in this._namedServicesDictionary)
         {
            _loc3_ = _loc2_.serviceList;
            _loc4_ = 0;
            _loc5_ = int(_loc3_.length);
            while(_loc4_ < _loc5_)
            {
               _loc1_ = _loc3_[_loc4_];
               if(_loc6_.indexOf(_loc1_) == -1)
               {
                  _loc6_.push(_loc1_);
               }
               _loc4_++;
            }
         }
         return _loc6_;
      }
      
      public function getServicesInfo() : Vector.<ServiceInfo>
      {
         var _loc1_:Object = null;
         var _loc2_:NamedServicesCatalog = null;
         var _loc3_:Vector.<ServiceInfo> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<ServiceInfo> = new Vector.<ServiceInfo>();
         for each(_loc1_ in this._nullParamsServiceDictionary)
         {
            _loc6_.push(new ServiceInfo(_loc1_,null));
         }
         for each(_loc2_ in this._namedServicesDictionary)
         {
            _loc3_ = _loc2_.getServicesInfo();
            _loc4_ = 0;
            _loc5_ = int(_loc3_.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_.push(_loc3_[_loc4_]);
               _loc4_++;
            }
         }
         return _loc6_;
      }
   }
}

