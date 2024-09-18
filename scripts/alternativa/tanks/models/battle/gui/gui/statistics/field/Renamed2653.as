package alternativa.tanks.models.battle.gui.gui.statistics.field
{
   import assets.icons.BattleInfoIcons;
   import controls.Label;
   import flash.display.Sprite;
   
   public class Renamed2651 extends Sprite
   {
      protected var icon:BattleInfoIcons;
      
      protected var Renamed2652:int;
      
      protected var label:Label;
      
      public function Renamed2651(param1:int = -1)
      {
         super();
         this.Renamed2652 = param1;
         this.init();
      }
      
      protected function init() : void
      {
         if(this.Renamed2652 > -1)
         {
            this.icon = new BattleInfoIcons();
            this.icon.type = this.Renamed2652;
            addChild(this.icon);
            this.icon.x = 0;
            this.icon.y = 0;
         }
         this.label = new Label();
         this.label.color = 16777215;
         if(this.icon)
         {
            this.label.x = this.icon.width + 3;
         }
         addChild(this.label);
      }
      
      public function set text(param1:String) : void
      {
         this.label.htmlText = param1;
      }
      
      public function set size(param1:Number) : void
      {
         this.label.size = param1;
      }
   }
}

