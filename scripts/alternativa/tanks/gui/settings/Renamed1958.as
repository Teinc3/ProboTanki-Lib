package alternativa.tanks.gui.settings
{
   import alternativa.tanks.AbstractEnum;
   
   public class Renamed1958 extends AbstractEnum
   {
      private static var Renamed1994:Vector.<Renamed1958>;
      
      public static const GRAPHIC:Renamed1958 = new Renamed1958(0,"GRAPHIC");
      
      public static const ACCOUNT:Renamed1958 = new Renamed1958(1,"ACCOUNT");
      
      public static const SOUND:Renamed1958 = new Renamed1958(2,"SOUND");
      
      public static const GAME:Renamed1958 = new Renamed1958(3,"GAME");
      
      public static const CONTROL:Renamed1958 = new Renamed1958(4,"CONTROL");
      
      public function Renamed1958(param1:int, param2:String)
      {
         super(param1,param2);
      }
      
      public static function get values() : Vector.<Renamed1958>
      {
         if(!Renamed1994)
         {
            Renamed1994 = new Vector.<Renamed1958>(5,true);
            Renamed1994[GRAPHIC.value] = GRAPHIC;
            Renamed1994[ACCOUNT.value] = ACCOUNT;
            Renamed1994[SOUND.value] = SOUND;
            Renamed1994[GAME.value] = GAME;
            Renamed1994[CONTROL.value] = CONTROL;
         }
         return Renamed1994;
      }
   }
}

