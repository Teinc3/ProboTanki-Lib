package alternativa.tanks.service.settings.keybinding
{
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed3769
   {
      private static var Renamed3782:Dictionary;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function Renamed3769()
      {
         super();
         this.Renamed3783();
      }
      
      public function Renamed3780(param1:uint) : String
      {
         var _loc2_:String = Renamed3782[param1];
         return _loc2_ == null ? "" : _loc2_;
      }
      
      private function Renamed3783() : void
      {
         Renamed3782 = new Dictionary();
         Renamed3782[Keyboard.NUMBER_0] = "0";
         Renamed3782[Keyboard.NUMBER_1] = "1";
         Renamed3782[Keyboard.NUMBER_2] = "2";
         Renamed3782[Keyboard.NUMBER_3] = "3";
         Renamed3782[Keyboard.NUMBER_4] = "4";
         Renamed3782[Keyboard.NUMBER_5] = "5";
         Renamed3782[Keyboard.NUMBER_6] = "6";
         Renamed3782[Keyboard.NUMBER_7] = "7";
         Renamed3782[Keyboard.NUMBER_8] = "8";
         Renamed3782[Keyboard.NUMBER_9] = "9";
         Renamed3782[Keyboard.MINUS] = "-";
         Renamed3782[Keyboard.EQUAL] = "=";
         Renamed3782[Keyboard.Q] = "Q";
         Renamed3782[Keyboard.W] = "W";
         Renamed3782[Keyboard.E] = "E";
         Renamed3782[Keyboard.R] = "R";
         Renamed3782[Keyboard.T] = "T";
         Renamed3782[Keyboard.Y] = "Y";
         Renamed3782[Keyboard.U] = "U";
         Renamed3782[Keyboard.I] = "I";
         Renamed3782[Keyboard.O] = "O";
         Renamed3782[Keyboard.P] = "P";
         Renamed3782[Keyboard.A] = "A";
         Renamed3782[Keyboard.S] = "S";
         Renamed3782[Keyboard.D] = "D";
         Renamed3782[Keyboard.F] = "F";
         Renamed3782[Keyboard.G] = "G";
         Renamed3782[Keyboard.H] = "H";
         Renamed3782[Keyboard.J] = "J";
         Renamed3782[Keyboard.K] = "K";
         Renamed3782[Keyboard.L] = "L";
         Renamed3782[Keyboard.Z] = "Z";
         Renamed3782[Keyboard.X] = "X";
         Renamed3782[Keyboard.C] = "C";
         Renamed3782[Keyboard.V] = "V";
         Renamed3782[Keyboard.B] = "B";
         Renamed3782[Keyboard.N] = "N";
         Renamed3782[Keyboard.M] = "M";
         Renamed3782[Keyboard.LEFT] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_LEFT);
         Renamed3782[Keyboard.UP] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_UP);
         Renamed3782[Keyboard.RIGHT] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_RIGHT);
         Renamed3782[Keyboard.DOWN] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_DOWN);
         Renamed3782[Keyboard.NUMPAD_0] = "NumPad 0";
         Renamed3782[Keyboard.NUMPAD_1] = "NumPad 1";
         Renamed3782[Keyboard.NUMPAD_2] = "NumPad 2";
         Renamed3782[Keyboard.NUMPAD_3] = "NumPad 3";
         Renamed3782[Keyboard.NUMPAD_4] = "NumPad 4";
         Renamed3782[Keyboard.NUMPAD_5] = "NumPad 5";
         Renamed3782[Keyboard.NUMPAD_6] = "NumPad 6";
         Renamed3782[Keyboard.NUMPAD_7] = "NumPad 7";
         Renamed3782[Keyboard.NUMPAD_8] = "NumPad 8";
         Renamed3782[Keyboard.NUMPAD_9] = "NumPad 9";
         Renamed3782[Keyboard.NUMPAD_ADD] = "NumPad +";
         Renamed3782[Keyboard.NUMPAD_SUBTRACT] = "NumPad -";
         Renamed3782[Keyboard.NUMPAD_DECIMAL] = "NumPad .";
         Renamed3782[Keyboard.NUMPAD_DIVIDE] = "NumPad /";
         Renamed3782[Keyboard.NUMPAD_ENTER] = "NumPad Enter";
         Renamed3782[Keyboard.LEFTBRACKET] = "[";
         Renamed3782[Keyboard.RIGHTBRACKET] = "]";
         Renamed3782[Keyboard.BACKSLASH] = "\\";
         Renamed3782[Keyboard.SEMICOLON] = ";";
         Renamed3782[Keyboard.QUOTE] = "\'";
         Renamed3782[Keyboard.COMMA] = ",";
         Renamed3782[Keyboard.PERIOD] = ".";
         Renamed3782[Keyboard.SLASH] = "/";
         Renamed3782[Keyboard.PAGE_DOWN] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_PG_DN);
         Renamed3782[Keyboard.PAGE_UP] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_PG_UP);
         Renamed3782[Keyboard.SPACE] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_SPACE);
         Renamed3782[Keyboard.SHIFT] = "Shift";
      }
   }
}

