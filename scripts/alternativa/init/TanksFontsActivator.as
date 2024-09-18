package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import flash.text.Font;
   import flash.text.TextFormat;
   import fonts.TanksFontService;
   
   public class TanksFontsActivator implements IBundleActivator
   {
      private static const MyriadPro:Class = TanksFontsActivator_MyriadPro;
      
      private static const MyriadProB:Class = TanksFontsActivator_MyriadProB;
      
      public function TanksFontsActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var _loc2_:TextFormat = null;
         var _loc3_:Boolean = false;
         var _loc4_:String = ILocaleService(param1.getService(ILocaleService)).language;
         if(_loc4_ == "cn")
         {
            _loc3_ = false;
            _loc2_ = new TextFormat("samsun");
            _loc2_.color = 16777215;
            _loc2_.indent = 0;
         }
         else
         {
            _loc3_ = true;
            Font.registerFont(MyriadPro);
            Font.registerFont(MyriadProB);
            _loc2_ = new TextFormat("MyriadPro",12,false);
            _loc2_.color = 16777215;
         }
         (param1.getService(IHelpService) as IHelpService).setHelperTextFormat(_loc2_,_loc3_);
         TanksFontService.setTextFormat(_loc2_,_loc3_);
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

