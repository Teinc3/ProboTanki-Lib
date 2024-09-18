package alternativa.tanks.gui.settings
{
   import alternativa.tanks.AbstractEnum;
   
   public class §const const const§ extends AbstractEnum
   {
      private static var §,"F§:Vector.<§const const const§>;
      
      public static const GRAPHIC:§const const const§ = new §const const const§(0,"GRAPHIC");
      
      public static const ACCOUNT:§const const const§ = new §const const const§(1,"ACCOUNT");
      
      public static const SOUND:§const const const§ = new §const const const§(2,"SOUND");
      
      public static const GAME:§const const const§ = new §const const const§(3,"GAME");
      
      public static const CONTROL:§const const const§ = new §const const const§(4,"CONTROL");
      
      public function §const const const§(param1:int, param2:String)
      {
         super(param1,param2);
      }
      
      public static function get values() : Vector.<§const const const§>
      {
         if(!§,"F§)
         {
            §,"F§ = new Vector.<§const const const§>(5,true);
            §,"F§[GRAPHIC.value] = GRAPHIC;
            §,"F§[ACCOUNT.value] = ACCOUNT;
            §,"F§[SOUND.value] = SOUND;
            §,"F§[GAME.value] = GAME;
            §,"F§[CONTROL.value] = CONTROL;
         }
         return §,"F§;
      }
   }
}

