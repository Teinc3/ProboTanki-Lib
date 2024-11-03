package Renamed431
{
   import Renamed215.Renamed2611;
   import alternativa.osgi.service.display.IDisplay;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class Renamed4709 extends Sprite
   {
      [Inject]
      public static var display:IDisplay;
      
      private var output:Renamed8858;
      
      public function Renamed4709()
      {
         this.output = new Renamed8858();
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
         this.Renamed8859();
      }
      
      private function Renamed8859() : void
      {
         this.output.x = display.stage.stageWidth;
         this.output.y = 50;
      }
      
      public function addMessage(param1:Renamed2611, param2:String, param3:Renamed2611 = null) : void
      {
         this.output.addLine(new Renamed8860(param1,param2,param3));
         this.Renamed8859();
      }
   }
}

