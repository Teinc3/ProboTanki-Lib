package §]!5§
{
   import base.DiscreteSprite;
   import controls.base.LabelBase;
   
   public class §get const native§ extends DiscreteSprite
   {
      private var headerText:String;
      
      private var §throw while§:String;
      
      private var §9!K§:LabelBase;
      
      private var descriptionLabel:LabelBase;
      
      public function §get const native§(param1:String, param2:String)
      {
         super();
         this.headerText = param1;
         this.§throw while§ = param2;
         this.init();
      }
      
      private function init() : void
      {
         this.§false for catch§();
         this.createDescriptionLabel();
      }
      
      private function §false for catch§() : void
      {
         this.§9!K§ = new LabelBase();
         this.§9!K§.size = 18;
         this.§9!K§.text = this.headerText;
         addChild(this.§9!K§);
      }
      
      private function createDescriptionLabel() : void
      {
         this.descriptionLabel = new LabelBase();
         this.descriptionLabel.htmlText = this.§throw while§;
         this.descriptionLabel.wordWrap = true;
         addChild(this.descriptionLabel);
      }
      
      public function render(param1:int) : void
      {
         this.§9!K§.width = param1;
         this.descriptionLabel.width = param1;
         this.descriptionLabel.y = this.§9!K§.y + this.§9!K§.height;
      }
   }
}

