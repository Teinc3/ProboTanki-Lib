package alternativa.tanks.gui.settings
{
   import §"f§.§with for import§;
   import §1!J§.§get for continue§;
   import §1!J§.§var package throw§;
   import alternativa.osgi.service.locale.ILocaleService;
   import base.DiscreteSprite;
   import controls.containers.§2H§;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §"#Y§ extends DiscreteSprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var §override catch return§:Dictionary;
      
      private var §else catch extends§:Vector.<§get for continue§>;
      
      private var §?!Q§:§const const const§;
      
      private var §@#>§:§2H§;
      
      public function §"#Y§()
      {
         this.§override catch return§ = new Dictionary();
         this.§else catch extends§ = new Vector.<§get for continue§>();
         this.§@#>§ = new §2H§();
         super();
         this.§@#>§.§!!t§(§with for import§.MARGIN);
         addChild(this.§@#>§);
      }
      
      public function §<!Q§(param1:§const const const§) : void
      {
         switch(param1)
         {
            case §const const const§.GAME:
               this.§@#>§.addItem(this.§static for static§(§const const const§.GAME,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_GAME),§var package throw§.§try for static§));
               break;
            case §const const const§.GRAPHIC:
               this.§@#>§.addItem(this.§static for static§(§const const const§.GRAPHIC,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_GRAPHICS),§var package throw§.§0p§));
               break;
            case §const const const§.ACCOUNT:
               this.§@#>§.addItem(this.§static for static§(§const const const§.ACCOUNT,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_ACCOUNT),§var package throw§.§final if§));
               break;
            case §const const const§.CONTROL:
               this.§@#>§.addItem(this.§static for static§(§const const const§.CONTROL,localeService.getText(TanksLocale.TEXT_SETTINGS_TAB_NAME_CONTROLS),§var package throw§.§while const var§));
         }
      }
      
      private function §static for static§(param1:§const const const§, param2:String, param3:Class) : §get for continue§
      {
         var _loc4_:§get for continue§ = null;
         _loc4_ = new §get for continue§(param1,param2,param3);
         this.§override catch return§[param1] = _loc4_;
         _loc4_.width = SettingsWindow.BUTTON_WIDTH;
         this.§else catch extends§.push(_loc4_);
         _loc4_.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         return _loc4_;
      }
      
      private function onButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:§const const const§ = param1.currentTarget.getCategory();
         if(this.§?!Q§ != _loc2_)
         {
            this.§ !Y§(_loc2_);
         }
      }
      
      public function § !Y§(param1:§const const const§) : void
      {
         if(this.§?!Q§)
         {
            this.§override catch return§[this.§?!Q§].enabled = true;
         }
         this.§override catch return§[param1].enabled = false;
         this.§?!Q§ = param1;
         dispatchEvent(new SelectTabEvent(param1));
      }
      
      override public function get height() : Number
      {
         return this.§else catch extends§[0].height;
      }
      
      override public function get width() : Number
      {
         return this.§@#>§.width;
      }
      
      public function destroy() : void
      {
         var _loc1_:§get for continue§ = null;
         for each(_loc1_ in this.§else catch extends§)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
         }
      }
   }
}

