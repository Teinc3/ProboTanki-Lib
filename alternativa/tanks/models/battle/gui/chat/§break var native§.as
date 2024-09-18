package alternativa.tanks.models.battle.gui.chat
{
   import §1!F§.§switch var super§;
   import controls.Label;
   
   public class §break var native§ extends §switch var super§
   {
      private var output:Label;
      
      public function §break var native§(param1:int, param2:String)
      {
         this.output = new Label();
         super();
         this.output.color = 8454016;
         this.output.multiline = true;
         this.output.wordWrap = true;
         this.output.mouseEnabled = false;
         this.output.text = param2;
         shadowContainer.addChild(this.output);
         this.width = param1;
      }
      
      [Obfuscation(rename="false")]
      override public function set width(param1:Number) : void
      {
         this.output.width = int(param1) - 5;
      }
   }
}

