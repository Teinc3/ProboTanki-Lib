package alternativa.osgi.service.command.impl
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.§;!o§;
   import alternativa.osgi.catalogs.ServiceInfo;
   import alternativa.osgi.catalogs.ServiceParam;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   
   public class OSGiCommands
   {
      private var commandService:CommandService;
      
      private var osgi:OSGi;
      
      public function OSGiCommands(param1:OSGi, param2:CommandService)
      {
         super();
         this.osgi = param1;
         this.commandService = param2;
         param2.registerCommand("osgi","ss","Список плагинов",[],this.cmdBundlesList);
         param2.registerCommand("osgi","services","Список сервисов",[],this.cmdServicesList);
      }
      
      public function cmdBundlesList(param1:FormattedOutput) : void
      {
         var _loc2_:Vector.<§;!o§> = this.osgi.bundleList;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            param1.addText(int(_loc3_ + 1).toString() + ". " + _loc2_[_loc3_].name);
            _loc3_++;
         }
      }
      
      public function cmdServicesList(param1:FormattedOutput) : void
      {
         var _loc2_:ServiceInfo = null;
         var _loc3_:Vector.<ServiceInfo> = this.osgi.getServicesInfo();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc4_];
            param1.addText((_loc4_ + 1).toString() + ": " + _loc2_.service + this.getServicesParam(_loc2_.params));
            _loc4_++;
         }
      }
      
      private function getServicesParam(param1:Vector.<ServiceParam>) : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:ServiceParam = null;
         var _loc5_:String = " ";
         if(param1 != null)
         {
            _loc2_ = 0;
            _loc3_ = int(param1.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = param1[_loc2_];
               _loc5_ += "(" + _loc4_.name + " = " + _loc4_.value + ")";
               _loc2_++;
            }
         }
         return _loc5_;
      }
   }
}

