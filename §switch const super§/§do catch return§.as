package §switch const super§
{
   import §-!z§.§!"L§;
   import alternativa.osgi.service.display.IDisplay;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §do catch return§ extends Sprite
   {
      [Inject]
      public static var display:IDisplay;
      
      private var output:§switch for include§;
      
      public function §do catch return§()
      {
         this.output = new §switch for include§();
         super();
         addChild(this.output);
         this.output.tabEnabled = false;
         this.output.tabChildren = false;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onStageResize);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onStageResize);
      }
      
      public function onStageResize(param1:Event) : void
      {
         this.§!#§();
      }
      
      private function §!#§() : void
      {
         this.output.x = display.stage.stageWidth;
         this.output.y = 50;
      }
      
      public function addMessage(param1:§!"L§, param2:String, param3:§!"L§ = null) : void
      {
         this.output.addLine(new §super catch var§(param1,param2,param3));
         this.§!#§();
      }
   }
}

