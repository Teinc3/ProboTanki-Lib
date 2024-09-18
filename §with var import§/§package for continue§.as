package §with var import§
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.§0"@§;
   import assets.icons.BattleInfoIcons;
   import controls.Label;
   import controls.resultassets.WhiteFrame;
   
   public class §package for continue§ extends §0"@§
   {
      private static const §false set include§:int = 9;
      
      private static const §super final§:int = 10;
      
      private static const §switch var class§:int = 9;
      
      private static const §dynamic set each§:int = 6;
      
      private static const §get var with§:int = 18;
      
      private var §while package while§:WhiteFrame;
      
      public function §package for continue§(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         this.§while package while§ = new WhiteFrame();
         addChild(this.§while package while§);
         if(§%"H§ > -1)
         {
            icon = new BattleInfoIcons();
            icon.type = §%"H§;
            addChild(icon);
            icon.x = §false set include§;
            icon.y = §super final§;
         }
         label = new Label();
         label.color = 16777215;
         addChild(label);
         if(icon)
         {
            label.x = icon.x + icon.width + §switch var class§;
         }
         else
         {
            label.x = §switch var class§;
         }
         label.y = §dynamic set each§;
         label.size = §get var with§;
         label.bold = true;
         this.§in var switch§(0);
      }
      
      public function §in var switch§(param1:int) : void
      {
         text = param1.toString();
         this.§while package while§.width = label.x + label.width + 10;
      }
   }
}

