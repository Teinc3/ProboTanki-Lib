package §3"f§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.§0"@§;
   import assets.Diamond;
   import controls.Money;
   
   public class §%"d§ extends §0"@§
   {
      private var diamond:Diamond;
      
      public function §%"d§(param1:int)
      {
         this.diamond = new Diamond();
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         addChild(this.diamond);
         this.diamond.y = 4;
         this.update();
      }
      
      public function §?#2§(param1:int) : void
      {
         var _loc2_:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         var _loc3_:String = _loc2_.getText(TextConst.BATTLE_FUND);
         label.text = _loc3_ + ": " + Money.numToString(param1,false);
         this.update();
      }
      
      private function update() : void
      {
         this.diamond.x = label.x + label.width + 2;
      }
   }
}

