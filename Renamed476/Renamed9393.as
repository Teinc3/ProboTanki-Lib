package Renamed476
{
   import base.DiscreteSprite;
   import controls.base.LabelBase;
   
   public class Renamed9393 extends DiscreteSprite
   {
      private var headerText:String;
      
      private var Renamed9392:String;
      
      private var Renamed9396:LabelBase;
      
      private var descriptionLabel:LabelBase;
      
      public function Renamed9393(param1:String, param2:String)
      {
         super();
         this.headerText = param1;
         this.Renamed9392 = param2;
         this.init();
      }
      
      private function init() : void
      {
         this.Renamed9070();
         this.createDescriptionLabel();
      }
      
      private function Renamed9070() : void
      {
         this.Renamed9396 = new LabelBase();
         this.Renamed9396.size = 18;
         this.Renamed9396.text = this.headerText;
         addChild(this.Renamed9396);
      }
      
      private function createDescriptionLabel() : void
      {
         this.descriptionLabel = new LabelBase();
         this.descriptionLabel.htmlText = this.Renamed9392;
         this.descriptionLabel.wordWrap = true;
         addChild(this.descriptionLabel);
      }
      
      public function render(param1:int) : void
      {
         this.Renamed9396.width = param1;
         this.descriptionLabel.width = param1;
         this.descriptionLabel.y = this.Renamed9396.y + this.Renamed9396.height;
      }
   }
}

