package alternativa.tanks.service.settings.keybinding
{
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §const const catch§
   {
      private static var §break for var§:Dictionary;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function §const const catch§()
      {
         super();
         this.§?Q§();
      }
      
      public function §var catch break§(param1:uint) : String
      {
         var _loc2_:String = §break for var§[param1];
         return _loc2_ == null ? "" : _loc2_;
      }
      
      private function §?Q§() : void
      {
         §break for var§ = new Dictionary();
         §break for var§[Keyboard.NUMBER_0] = "0";
         §break for var§[Keyboard.NUMBER_1] = "1";
         §break for var§[Keyboard.NUMBER_2] = "2";
         §break for var§[Keyboard.NUMBER_3] = "3";
         §break for var§[Keyboard.NUMBER_4] = "4";
         §break for var§[Keyboard.NUMBER_5] = "5";
         §break for var§[Keyboard.NUMBER_6] = "6";
         §break for var§[Keyboard.NUMBER_7] = "7";
         §break for var§[Keyboard.NUMBER_8] = "8";
         §break for var§[Keyboard.NUMBER_9] = "9";
         §break for var§[Keyboard.MINUS] = "-";
         §break for var§[Keyboard.EQUAL] = "=";
         §break for var§[Keyboard.Q] = "Q";
         §break for var§[Keyboard.W] = "W";
         §break for var§[Keyboard.E] = "E";
         §break for var§[Keyboard.R] = "R";
         §break for var§[Keyboard.T] = "T";
         §break for var§[Keyboard.Y] = "Y";
         §break for var§[Keyboard.U] = "U";
         §break for var§[Keyboard.I] = "I";
         §break for var§[Keyboard.O] = "O";
         §break for var§[Keyboard.P] = "P";
         §break for var§[Keyboard.A] = "A";
         §break for var§[Keyboard.S] = "S";
         §break for var§[Keyboard.D] = "D";
         §break for var§[Keyboard.F] = "F";
         §break for var§[Keyboard.G] = "G";
         §break for var§[Keyboard.H] = "H";
         §break for var§[Keyboard.J] = "J";
         §break for var§[Keyboard.K] = "K";
         §break for var§[Keyboard.L] = "L";
         §break for var§[Keyboard.Z] = "Z";
         §break for var§[Keyboard.X] = "X";
         §break for var§[Keyboard.C] = "C";
         §break for var§[Keyboard.V] = "V";
         §break for var§[Keyboard.B] = "B";
         §break for var§[Keyboard.N] = "N";
         §break for var§[Keyboard.M] = "M";
         §break for var§[Keyboard.LEFT] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_LEFT);
         §break for var§[Keyboard.UP] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_UP);
         §break for var§[Keyboard.RIGHT] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_RIGHT);
         §break for var§[Keyboard.DOWN] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_DOWN);
         §break for var§[Keyboard.NUMPAD_0] = "NumPad 0";
         §break for var§[Keyboard.NUMPAD_1] = "NumPad 1";
         §break for var§[Keyboard.NUMPAD_2] = "NumPad 2";
         §break for var§[Keyboard.NUMPAD_3] = "NumPad 3";
         §break for var§[Keyboard.NUMPAD_4] = "NumPad 4";
         §break for var§[Keyboard.NUMPAD_5] = "NumPad 5";
         §break for var§[Keyboard.NUMPAD_6] = "NumPad 6";
         §break for var§[Keyboard.NUMPAD_7] = "NumPad 7";
         §break for var§[Keyboard.NUMPAD_8] = "NumPad 8";
         §break for var§[Keyboard.NUMPAD_9] = "NumPad 9";
         §break for var§[Keyboard.NUMPAD_ADD] = "NumPad +";
         §break for var§[Keyboard.NUMPAD_SUBTRACT] = "NumPad -";
         §break for var§[Keyboard.NUMPAD_DECIMAL] = "NumPad .";
         §break for var§[Keyboard.NUMPAD_DIVIDE] = "NumPad /";
         §break for var§[Keyboard.NUMPAD_ENTER] = "NumPad Enter";
         §break for var§[Keyboard.LEFTBRACKET] = "[";
         §break for var§[Keyboard.RIGHTBRACKET] = "]";
         §break for var§[Keyboard.BACKSLASH] = "\\";
         §break for var§[Keyboard.SEMICOLON] = ";";
         §break for var§[Keyboard.QUOTE] = "\'";
         §break for var§[Keyboard.COMMA] = ",";
         §break for var§[Keyboard.PERIOD] = ".";
         §break for var§[Keyboard.SLASH] = "/";
         §break for var§[Keyboard.PAGE_DOWN] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_PG_DN);
         §break for var§[Keyboard.PAGE_UP] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_PG_UP);
         §break for var§[Keyboard.SPACE] = localeService.getText(TanksLocale.TEXT_KEYBOARD_KEY_SPACE);
         §break for var§[Keyboard.SHIFT] = "Shift";
      }
   }
}

