package platform.client.fp10.core
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   import alternativa.types.Long;
   import flash.system.System;
   import flash.utils.getQualifiedClassName;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.registry.GameTypeRegistry;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.service.transport.ITransportService;
   import platform.client.fp10.core.type.IGameClass;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class CoreCommands
   {
      [Inject]
      public static var gameTypeRegistry:GameTypeRegistry;
      
      [Inject]
      public static var modelRegister:ModelRegistry;
      
      [Inject]
      public static var spaceRegistry:SpaceRegistry;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      [Inject]
      public static var commandService:CommandService;
      
      [Inject]
      public static var transportService:ITransportService;
      
      private var osgi:OSGi;
      
      public function CoreCommands()
      {
         super();
         this.osgi = OSGi.getInstance();
         commandService.registerCommand("core","models","Список моделей поведения",[],this.cmdModelsList);
         commandService.registerCommand("core","objects","Список загруженных объектов",[],this.cmdObjectsList);
         commandService.registerCommand("core","resource","Список ресурсов",[],this.cmdResourcesList);
         commandService.registerCommand("core","spaces","Список спейсов",[],this.cmdSpacesList);
         commandService.registerCommand("system","gc","Вызвать сборщик мусора (debug only)",[],this.cmdSystemGc);
      }
      
      private function cmdSystemGc(param1:FormattedOutput) : void
      {
         System.gc();
      }
      
      private function cmdSpacesList(param1:FormattedOutput) : void
      {
         var _loc2_:ISpace = null;
         var _loc3_:Vector.<ISpace> = SpaceRegistry(this.osgi.getService(SpaceRegistry)).spaces;
         for each(_loc2_ in _loc3_)
         {
            param1.addText("space id: " + (_loc2_.id == null ? "null" : _loc2_.id.toString()));
         }
      }
      
      private function cmdModelsList(param1:FormattedOutput) : void
      {
         var _loc2_:IModel = null;
         var _loc3_:String = null;
         var _loc4_:Vector.<Class> = null;
         var _loc5_:Vector.<String> = null;
         var _loc6_:Class = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:ModelRegistry = ModelRegistry(this.osgi.getService(ModelRegistry));
         for each(_loc2_ in _loc9_.models)
         {
            _loc3_ = getQualifiedClassName(_loc2_);
            param1.addText(_loc3_);
            param1.addText("  id: " + _loc2_.id);
            _loc4_ = _loc9_.getInterfacesForModel(_loc2_.id);
            if(_loc4_ != null)
            {
               _loc5_ = new Vector.<String>();
               for each(_loc6_ in _loc4_)
               {
                  _loc7_ = getQualifiedClassName(_loc6_);
                  if((_loc8_ = int(_loc7_.indexOf("::"))) > -1)
                  {
                     _loc7_ = _loc7_.substr(_loc8_ + 2);
                  }
                  _loc5_.push(_loc7_);
               }
               param1.addText("  interfaces: " + _loc5_.join(", "));
            }
            else
            {
               param1.addText("  no interfaces found");
            }
         }
      }
      
      private function cmdResourcesList(param1:FormattedOutput) : void
      {
         var _loc2_:Resource = null;
         var _loc3_:Vector.<Resource> = resourceRegistry.resources;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc4_];
            param1.addText(_loc2_.toString());
            _loc4_++;
         }
      }
      
      private function cmdObjectsList(param1:FormattedOutput) : void
      {
         var _loc2_:ISpace = null;
         var _loc3_:Vector.<IGameObject> = null;
         var _loc4_:IGameObject = null;
         var _loc5_:IGameClass = null;
         var _loc6_:Vector.<Long> = null;
         var _loc7_:int = 0;
         var _loc8_:Vector.<ISpace> = spaceRegistry.spaces;
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_.length)
         {
            _loc2_ = _loc8_[_loc9_];
            param1.addText("space id: " + _loc2_.id);
            _loc3_ = _loc2_.objects;
            for each(_loc4_ in _loc3_)
            {
               param1.addText("  object id: " + _loc4_.id);
               _loc5_ = _loc4_.gameClass;
               if(_loc5_ != null)
               {
                  param1.addText("    class id: " + _loc5_.id);
                  _loc6_ = _loc4_.gameClass.models;
                  if(_loc6_.length > 0)
                  {
                     param1.addText("    models:");
                     _loc7_ = 0;
                     while(_loc7_ < _loc6_.length)
                     {
                        param1.addText("      " + this.getClassName(modelRegister.getModel(_loc6_[_loc7_])) + " [" + _loc6_[_loc7_] + "]");
                        _loc7_++;
                     }
                  }
               }
               else
               {
                  param1.addText("    class id: null");
               }
            }
            _loc9_++;
         }
      }
      
      private function getClassName(param1:Object) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:int = int(_loc2_.indexOf("::"));
         if(_loc3_ > -1)
         {
            return _loc2_.substr(_loc3_ + 2);
         }
         return _loc2_;
      }
   }
}

