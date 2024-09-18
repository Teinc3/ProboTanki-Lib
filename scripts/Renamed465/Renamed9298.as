package Renamed465
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Renamed2651;
   import assets.icons.BattleInfoIcons;
   import controls.Label;
   import controls.resultassets.WhiteFrame;
   
   public class Renamed9298 extends Renamed2651
   {
      private static const Renamed9313:int = 9;
      
      private static const Renamed9311:int = 10;
      
      private static const Renamed9314:int = 9;
      
      private static const Renamed2675:int = 6;
      
      private static const Renamed9315:int = 18;
      
      private var Renamed6592:WhiteFrame;
      
      public function Renamed9298(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         this.Renamed6592 = new WhiteFrame();
         addChild(this.Renamed6592);
         if(Renamed2652 > -1)
         {
            icon = new BattleInfoIcons();
            icon.type = Renamed2652;
            addChild(icon);
            icon.x = Renamed9313;
            icon.y = Renamed9311;
         }
         label = new Label();
         label.color = 16777215;
         addChild(label);
         if(icon)
         {
            label.x = icon.x + icon.width + Renamed9314;
         }
         else
         {
            label.x = Renamed9314;
         }
         label.y = Renamed2675;
         label.size = Renamed9315;
         label.bold = true;
         this.Renamed2685(0);
      }
      
      public function Renamed2685(param1:int) : void
      {
         text = param1.toString();
         this.Renamed6592.width = label.x + label.width + 10;
      }
   }
}

