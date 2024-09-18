package Renamed322
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Renamed2651;
   import flash.events.Event;
   
   public class Renamed6583 extends Renamed2651
   {
      protected var _value:int;
      
      protected var Renamed7731:int;
      
      private var Renamed7732:Renamed6582;
      
      public function Renamed6583(param1:int, param2:int, param3:Renamed6582)
      {
         super(param2);
         this.Renamed7731 = param1;
         this.Renamed7732 = param3;
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function set value(param1:int) : void
      {
         this._value = param1;
         this.updateLabel();
         if(this._value <= this.Renamed7731)
         {
            this.Renamed6602();
         }
         else
         {
            this.Renamed6605();
         }
      }
      
      public function Renamed6602() : void
      {
         if(this.Renamed7732 != null)
         {
            this.Renamed7732.Renamed7728(this);
         }
      }
      
      public function Renamed6605() : void
      {
         if(this.Renamed7732 != null)
         {
            this.Renamed7732.Renamed7729(this);
         }
         label.visible = true;
      }
      
      public function get Renamed7730() : Boolean
      {
         return label.visible;
      }
      
      public function set Renamed7730(param1:Boolean) : void
      {
         label.visible = param1;
      }
      
      protected function updateLabel() : void
      {
         text = this._value.toString();
      }
      
      protected function onRemovedFromStage(param1:Event) : void
      {
         this.Renamed6605();
      }
   }
}

