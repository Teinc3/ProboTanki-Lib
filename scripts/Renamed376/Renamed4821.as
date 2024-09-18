package Renamed376
{
   import Renamed225.Renamed5522;
   import Renamed229.Renamed6467;
   import Renamed229.Renamed6463;
   import Renamed229.Renamed6465;
   import Renamed4808.Renamed5523;
   import Renamed4808.Renamed4809;
   import Renamed4808.Renamed5536;
   import Renamed504.Renamed4812;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.types.Long;
   import forms.events.MainButtonBarEvents;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   
   public class Renamed4821 extends Renamed5523 implements Renamed4809, ObjectLoadPostListener, ObjectUnloadPostListener
   {
      [Inject]
      public static var panelView:IPanelView;
      
      private var Renamed8308:Renamed4812;
      
      private var Renamed8309:Boolean;
      
      public function Renamed4821()
      {
         super();
      }
      
      public function Renamed5537(param1:Renamed5522) : void
      {
         if(!this.Renamed8309)
         {
            this.Renamed8308 = new Renamed4812();
            this.Renamed8308.addEventListener(Renamed6465.Renamed6466,this.Renamed8310);
            this.Renamed8308.Renamed8311(param1);
            this.Renamed8308.Renamed8312();
            this.Renamed8308.show();
            this.Renamed8309 = true;
         }
      }
      
      public function Renamed5535(param1:Vector.<Renamed5536>, param2:Renamed5522) : void
      {
         if(!this.Renamed8309)
         {
            this.Renamed8308 = new Renamed4812();
            this.Renamed8308.addEventListener(Renamed6463.DAILY_QUEST_CHANGE,this.Renamed8313);
            this.Renamed8308.addEventListener(Renamed6467.DAILY_QUEST_GET_PRIZE,this.Renamed8314);
            this.Renamed8308.addEventListener(Renamed6465.Renamed6466,this.Renamed8310);
            this.Renamed8309 = true;
            this.Renamed8308.init(param1);
            this.Renamed8308.Renamed8311(param2);
            this.Renamed8308.show();
         }
      }
      
      private function Renamed8310(param1:Renamed6465) : void
      {
         this.Renamed8308.removeEventListener(Renamed6463.DAILY_QUEST_CHANGE,this.Renamed8313);
         this.Renamed8308.removeEventListener(Renamed6467.DAILY_QUEST_GET_PRIZE,this.Renamed8314);
         this.Renamed8308.removeEventListener(Renamed6465.Renamed6466,this.Renamed8310);
         this.Renamed8309 = false;
      }
      
      private function Renamed8314(param1:Renamed6467) : void
      {
         Renamed4817(modelRegistry.getModel(Long.getLong(1302806391,660914812))).takePrize(param1.Renamed6464);
      }
      
      private function Renamed8313(param1:Renamed6463) : void
      {
         Renamed4817(modelRegistry.getModel(Long.getLong(1302806391,660914812))).skipDailyQuest(param1.Renamed6464);
      }
      
      public function skipDailyQuest(param1:Long, param2:Renamed5536) : void
      {
         if(this.Renamed8309)
         {
            this.Renamed8308.Renamed8315(param1,param2);
         }
      }
      
      public function Renamed5538(param1:Long) : void
      {
         if(this.Renamed8309)
         {
            this.Renamed8308.takePrize(param1);
         }
      }
      
      public function objectLoadedPost() : void
      {
         panelView.Renamed2160().buttonBar.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      public function objectUnloadedPost() : void
      {
         panelView.Renamed2160().buttonBar.removeEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      private function onButtonBarButtonClick(param1:MainButtonBarEvents) : void
      {
         if(param1.typeButton == MainButtonBarEvents.Renamed4050)
         {
            server.Renamed5551();
         }
      }
   }
}

