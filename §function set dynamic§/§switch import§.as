package §function set dynamic§
{
   import §0#W§.§&h§;
   import §1!-§.§]!U§;
   import §1!-§.§case var super§;
   import §1!-§.§var const override§;
   import §>#m§.§!!q§;
   import §>#m§.§&!b§;
   import §>#m§.§5!"§;
   import §`U§.§6"§;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.types.Long;
   import forms.events.MainButtonBarEvents;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   
   public class §switch import§ extends §!!q§ implements §&!b§, ObjectLoadPostListener, ObjectUnloadPostListener
   {
      [Inject]
      public static var panelView:IPanelView;
      
      private var §include for in§:§6"§;
      
      private var §true catch dynamic§:Boolean;
      
      public function §switch import§()
      {
         super();
      }
      
      public function §[E§(param1:§&h§) : void
      {
         if(!this.§true catch dynamic§)
         {
            this.§include for in§ = new §6"§();
            this.§include for in§.addEventListener(§var const override§.§76§,this.§'Q§);
            this.§include for in§.§override for dynamic§(param1);
            this.§include for in§.§return set for§();
            this.§include for in§.show();
            this.§true catch dynamic§ = true;
         }
      }
      
      public function §get package if§(param1:Vector.<§5!"§>, param2:§&h§) : void
      {
         if(!this.§true catch dynamic§)
         {
            this.§include for in§ = new §6"§();
            this.§include for in§.addEventListener(§case var super§.DAILY_QUEST_CHANGE,this.§package default§);
            this.§include for in§.addEventListener(§]!U§.DAILY_QUEST_GET_PRIZE,this.§ !u§);
            this.§include for in§.addEventListener(§var const override§.§76§,this.§'Q§);
            this.§true catch dynamic§ = true;
            this.§include for in§.init(param1);
            this.§include for in§.§override for dynamic§(param2);
            this.§include for in§.show();
         }
      }
      
      private function §'Q§(param1:§var const override§) : void
      {
         this.§include for in§.removeEventListener(§case var super§.DAILY_QUEST_CHANGE,this.§package default§);
         this.§include for in§.removeEventListener(§]!U§.DAILY_QUEST_GET_PRIZE,this.§ !u§);
         this.§include for in§.removeEventListener(§var const override§.§76§,this.§'Q§);
         this.§true catch dynamic§ = false;
      }
      
      private function § !u§(param1:§]!U§) : void
      {
         §""'§(modelRegistry.getModel(Long.getLong(1302806391,660914812))).takePrize(param1.§7![§);
      }
      
      private function §package default§(param1:§case var super§) : void
      {
         §""'§(modelRegistry.getModel(Long.getLong(1302806391,660914812))).skipDailyQuest(param1.§7![§);
      }
      
      public function skipDailyQuest(param1:Long, param2:§5!"§) : void
      {
         if(this.§true catch dynamic§)
         {
            this.§include for in§.§dynamic set switch§(param1,param2);
         }
      }
      
      public function §0!3§(param1:Long) : void
      {
         if(this.§true catch dynamic§)
         {
            this.§include for in§.takePrize(param1);
         }
      }
      
      public function objectLoadedPost() : void
      {
         panelView.§+#,§().buttonBar.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      public function objectUnloadedPost() : void
      {
         panelView.§+#,§().buttonBar.removeEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      private function onButtonBarButtonClick(param1:MainButtonBarEvents) : void
      {
         if(param1.typeButton == MainButtonBarEvents.§<w§)
         {
            server.§true package super§();
         }
      }
   }
}

