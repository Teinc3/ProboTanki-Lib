package forms.registration
{
   import assets.icons.InputCheckIcon;
   
   public class CallsignIconStates extends InputCheckIcon
   {
      public static const CALLSIGN_ICON_STATE_OFF:int = 0;
      
      public static const CALLSIGN_ICON_STATE_PROGRESS:int = 1;
      
      public static const CALLSIGN_ICON_STATE_VALID:int = 2;
      
      public static const CALLSIGN_ICON_STATE_INVALID:int = 3;
      
      public function CallsignIconStates()
      {
         super();
         this.turnOff();
      }
      
      public function startProgress() : void
      {
         this.visible = true;
         gotoAndStop(CALLSIGN_ICON_STATE_PROGRESS);
      }
      
      public function turnOff() : void
      {
         this.visible = false;
         gotoAndStop(CALLSIGN_ICON_STATE_OFF);
      }
      
      public function markAsValid() : void
      {
         this.visible = true;
         gotoAndStop(CALLSIGN_ICON_STATE_VALID);
      }
      
      public function markAsInvalid() : void
      {
         this.visible = true;
         gotoAndStop(CALLSIGN_ICON_STATE_INVALID);
      }
   }
}

