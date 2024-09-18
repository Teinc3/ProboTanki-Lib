package Renamed431
{
   import Renamed17.MessageColor;
   import Renamed215.Renamed2611;
   import Renamed230.Renamed2588;
   import Renamed496.Renamed2589;
   import controls.Label;
   import forms.userlabel.ChatUpdateEvent;
   import Renamed379.Renamed2647;
   import Renamed379.Renamed8331;
   
   public class Renamed8860 extends Renamed2588
   {
      private var Renamed8861:Renamed2647;
      
      private var label:Label;
      
      public function Renamed8860(param1:Renamed2611, param2:String, param3:Renamed2611 = null)
      {
         super();
         if(param1 != null)
         {
            this.Renamed8862(param1);
         }
         this.Renamed8863(param2);
         if(param3 != null)
         {
            this.Renamed8862(param3);
         }
      }
      
      private function Renamed8862(param1:Renamed2611) : void
      {
         this.Renamed8861 = new Renamed8331(param1.userId);
         this.Renamed8861.addEventListener(ChatUpdateEvent.UPDATE,this.Renamed2602);
         this.Renamed8861.setUidColor(MessageColor.Renamed2649(param1.teamType,false),true);
         this.Renamed8861.x = width + 4;
         addChild(this.Renamed8861);
      }
      
      private function Renamed2602(param1:ChatUpdateEvent) : void
      {
         this.Renamed8861.x = 4;
         this.label.x = this.Renamed8861.width + 4;
         dispatchEvent(new Renamed2589(Renamed2589.Renamed8864,this));
      }
      
      private function Renamed8863(param1:String) : void
      {
         this.label = new Label();
         this.label.text = param1;
         this.label.x = width + 4;
         shadowContainer.addChild(this.label);
      }
   }
}

