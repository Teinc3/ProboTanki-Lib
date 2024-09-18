package org.swiftsuspenders.injectionpoints
{
   import flash.utils.getQualifiedClassName;
   import org.swiftsuspenders.InjectionConfig;
   import org.swiftsuspenders.Injector;
   import org.swiftsuspenders.InjectorError;
   
   public class MethodInjectionPoint extends InjectionPoint
   {
      protected var methodName:String;
      
      protected var _parameterInjectionConfigs:Array;
      
      protected var requiredParameters:int = 0;
      
      public function MethodInjectionPoint(param1:XML, param2:Injector = null)
      {
         super(param1,param2);
      }
      
      override public function applyInjection(param1:Object, param2:Injector) : Object
      {
         var _loc3_:Array = this.gatherParameterValues(param1,param2);
         var _loc4_:Function = param1[this.methodName];
         _loc4_.apply(param1,_loc3_);
         return param1;
      }
      
      override protected function initializeInjection(param1:XML) : void
      {
         var node:XML = param1;
         var nameArgs:XMLList = null;
         var methodNode:XML = null;
         nameArgs = node.arg.(@key == "name");
         methodNode = node.parent();
         this.methodName = methodNode.@name.toString();
         this.gatherParameters(methodNode,nameArgs);
      }
      
      protected function gatherParameters(param1:XML, param2:XMLList) : void
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         this._parameterInjectionConfigs = [];
         var _loc6_:int = 0;
         for each(_loc3_ in param1.parameter)
         {
            _loc4_ = "";
            if(param2[_loc6_])
            {
               _loc4_ = param2[_loc6_].@value.toString();
            }
            _loc5_ = _loc3_.@type.toString();
            if(_loc5_ == "*")
            {
               if(_loc3_.@optional.toString() == "false")
               {
                  throw new InjectorError("Error in method definition of injectee. " + "Required parameters can\'t have type \"*\".");
               }
               _loc5_ = null;
            }
            this._parameterInjectionConfigs.push(new ParameterInjectionConfig(_loc5_,_loc4_));
            if(_loc3_.@optional.toString() == "false")
            {
               ++this.requiredParameters;
            }
            _loc6_++;
         }
      }
      
      protected function gatherParameterValues(param1:Object, param2:Injector) : Array
      {
         var _loc3_:ParameterInjectionConfig = null;
         var _loc4_:InjectionConfig = null;
         var _loc5_:Object = null;
         var _loc6_:Array = [];
         var _loc7_:int = int(this._parameterInjectionConfigs.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc3_ = this._parameterInjectionConfigs[_loc8_];
            _loc4_ = param2.getMapping(Class(param2.getApplicationDomain().getDefinition(_loc3_.typeName)),_loc3_.injectionName);
            if((_loc5_ = _loc4_.getResponse(param2)) == null)
            {
               if(_loc8_ >= this.requiredParameters)
               {
                  break;
               }
               throw new InjectorError("Injector is missing a rule to handle injection into target " + param1 + ". Target dependency: " + getQualifiedClassName(_loc4_.request) + ", method: " + this.methodName + ", parameter: " + (_loc8_ + 1));
            }
            _loc6_[_loc8_] = _loc5_;
            _loc8_++;
         }
         return _loc6_;
      }
   }
}

final class ParameterInjectionConfig
{
   public var typeName:String;
   
   public var injectionName:String;
   
   public function ParameterInjectionConfig(param1:String, param2:String)
   {
      super();
      this.typeName = param1;
      this.injectionName = param2;
   }
}

