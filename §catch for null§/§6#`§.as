package §catch for null§
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.§0"@§;
   import flash.events.Event;
   
   public class §6#`§ extends §0"@§
   {
      protected var _value:int;
      
      protected var §>#S§:int;
      
      private var §extends set include§:§!#Q§;
      
      public function §6#`§(param1:int, param2:int, param3:§!#Q§)
      {
         super(param2);
         this.§>#S§ = param1;
         this.§extends set include§ = param3;
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function set value(param1:int) : void
      {
         this._value = param1;
         this.updateLabel();
         if(this._value <= this.§>#S§)
         {
            this.§"!V§();
         }
         else
         {
            this.§default var extends§();
         }
      }
      
      public function §"!V§() : void
      {
         if(this.§extends set include§ != null)
         {
            this.§extends set include§.§8=§(this);
         }
      }
      
      public function §default var extends§() : void
      {
         if(this.§extends set include§ != null)
         {
            this.§extends set include§.§continue catch switch§(this);
         }
         label.visible = true;
      }
      
      public function get §implements false§() : Boolean
      {
         return label.visible;
      }
      
      public function set §implements false§(param1:Boolean) : void
      {
         label.visible = param1;
      }
      
      protected function updateLabel() : void
      {
         text = this._value.toString();
      }
      
      protected function onRemovedFromStage(param1:Event) : void
      {
         this.§default var extends§();
      }
   }
}

