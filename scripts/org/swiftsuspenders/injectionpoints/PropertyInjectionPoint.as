package org.swiftsuspenders.injectionpoints
{
   import flash.system.ApplicationDomain;
   import org.swiftsuspenders.InjectionConfig;
   import org.swiftsuspenders.Injector;
   import org.swiftsuspenders.InjectorError;
   
   public class PropertyInjectionPoint extends InjectionPoint
   {
      private var _propertyName:String;
      
      private var _propertyType:String;
      
      private var _injectionName:String;
      
      public function PropertyInjectionPoint(param1:XML, param2:Injector = null)
      {
         super(param1,null);
      }
      
      override public function applyInjection(param1:Object, param2:Injector) : Object
      {
         var injection:Object;
         var target:Object = param1;
         var injector:Injector = param2;
         var injectionConfig:InjectionConfig = null;
         try
         {
            injectionConfig = injector.getMapping(Class(injector.getApplicationDomain().getDefinition(this._propertyType)),this._injectionName);
         }
         catch(e:Error)
         {
            try
            {
               injectionConfig = injector.getMapping(Class(ApplicationDomain.currentDomain.getDefinition(this._propertyType)),this._injectionName);
            }
            catch(e:Error)
            {
            }
         }
         injection = injectionConfig.getResponse(injector);
         if(injection == null)
         {
            throw new InjectorError("Injector is missing a rule to handle injection into property \"" + this._propertyName + "\" of object \"" + target + "\". Target dependency: \"" + this._propertyType + "\", named \"" + this._injectionName + "\"");
         }
         target[this._propertyName] = injection;
         return target;
      }
      
      override protected function initializeInjection(param1:XML) : void
      {
         this._propertyType = param1.parent().@type.toString();
         this._propertyName = param1.parent().@name.toString();
         this._injectionName = param1.arg.attribute("value").toString();
      }
   }
}

