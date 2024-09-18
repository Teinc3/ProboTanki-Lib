package §"f§
{
   import §1!J§.§true true§;
   import §1!J§.§use catch for§;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.§[!;§;
   import base.DiscreteSprite;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class §with for import§ extends DiscreteSprite
   {
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public static const MARGIN:int = 8;
      
      public static const §<#$§:int = 10;
      
      public static const §,$%§:int = 3;
      
      protected var §final const switch§:Vector.<DisplayObject>;
      
      public function §with for import§()
      {
         this.§final const switch§ = new Vector.<DisplayObject>();
         super();
      }
      
      public function show() : void
      {
      }
      
      public function hide() : void
      {
      }
      
      protected function createCheckBox(param1:§[!;§, param2:String, param3:Boolean, param4:int = 0, param5:int = 0) : §true true§
      {
         var _loc6_:§true true§;
         (_loc6_ = new §true true§(param1,param2)).§ !w§ = param3;
         _loc6_.addEventListener(MouseEvent.CLICK,this.§continue const while§);
         _loc6_.x = param4;
         _loc6_.y = param5;
         this.§final const switch§.push(_loc6_);
         _loc6_.label = param2;
         return _loc6_;
      }
      
      protected function §continue const while§(param1:MouseEvent) : void
      {
         var _loc2_:§use catch for§ = null;
         if(param1.currentTarget is §use catch for§)
         {
            _loc2_ = §use catch for§(param1.currentTarget);
            settingsService.§for function§(_loc2_.§native set catch§(),_loc2_.§<%§());
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:DisplayObject = null;
         for each(_loc1_ in this.§final const switch§)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this.§continue const while§);
         }
      }
   }
}

