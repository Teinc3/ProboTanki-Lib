package alternativa.tanks.service.settings.keybinding
{
   import alternativa.tanks.AbstractEnum;
   
   public class Renamed717 extends AbstractEnum
   {
      private static var Renamed1994:Vector.<Renamed717>;
      
      public static const ROTATE_TURRET_LEFT:Renamed717 = new Renamed717(0,"ROTATE_TURRET_LEFT");
      
      public static const ROTATE_TURRET_RIGHT:Renamed717 = new Renamed717(1,"ROTATE_TURRET_RIGHT");
      
      public static const CENTER_TURRET:Renamed717 = new Renamed717(2,"CENTER_TURRET");
      
      public static const CHASSIS_LEFT_MOVEMENT:Renamed717 = new Renamed717(3,"CHASSIS_LEFT_MOVEMENT");
      
      public static const CHASSIS_RIGHT_MOVEMENT:Renamed717 = new Renamed717(4,"CHASSIS_RIGHT_MOVEMENT");
      
      public static const CHASSIS_FORWARD_MOVEMENT:Renamed717 = new Renamed717(5,"CHASSIS_FORWARD_MOVEMENT");
      
      public static const CHASSIS_BACKWARD_MOVEMENT:Renamed717 = new Renamed717(6,"CHASSIS_BACKWARD_MOVEMENT");
      
      public static const FOLLOW_CAMERA_UP:Renamed717 = new Renamed717(7,"FOLLOW_CAMERA_UP");
      
      public static const FOLLOW_CAMERA_DOWN:Renamed717 = new Renamed717(8,"FOLLOW_CAMERA_DOWN");
      
      public static const DROP_FLAG:Renamed717 = new Renamed717(9,"DROP_FLAG");
      
      public static const BATTLE_PAUSE:Renamed717 = new Renamed717(10,"BATTLE_PAUSE");
      
      public static const BATTLE_VIEW_INCREASE:Renamed717 = new Renamed717(11,"BATTLE_VIEW_INCREASE");
      
      public static const BATTLE_VIEW_DECREASE:Renamed717 = new Renamed717(12,"BATTLE_VIEW_DECREASE");
      
      public static const FULL_SCREEN:Renamed717 = new Renamed717(13,"FULL_SCREEN");
      
      public static const SUICIDE:Renamed717 = new Renamed717(14,"SUICIDE");
      
      public static const SHOW_TANK_PARAMETERS:Renamed717 = new Renamed717(15,"SHOW_TANK_PARAMETERS");
      
      public static const USE_FIRS_AID:Renamed717 = new Renamed717(16,"USE_FIRS_AID");
      
      public static const USE_DOUBLE_ARMOR:Renamed717 = new Renamed717(17,"USE_DOUBLE_ARMOR");
      
      public static const USE_DOUBLE_DAMAGE:Renamed717 = new Renamed717(18,"USE_DOUBLE_DAMAGE");
      
      public static const USE_NITRO:Renamed717 = new Renamed717(19,"USE_NITRO");
      
      public static const USE_MINE:Renamed717 = new Renamed717(20,"USE_MINE");
      
      public static const DROP_GOLD_BOX:Renamed717 = new Renamed717(21,"DROP_GOLD_BOX");
      
      public static const SHOT:Renamed717 = new Renamed717(22,"SHOT");
      
      public static const ULTIMATE:Renamed717 = new Renamed717(23,"ULTIMATE");
      
      public static const OPEN_GARAGE:Renamed717 = new Renamed717(24,"OPEN_GARAGE");
      
      public function Renamed717(param1:int, param2:String)
      {
         super(param1,param2);
      }
      
      public static function get values() : Vector.<Renamed717>
      {
         if(!Renamed1994)
         {
            Renamed1994 = new Vector.<Renamed717>();
            Renamed1994.push(ROTATE_TURRET_LEFT);
            Renamed1994.push(ROTATE_TURRET_RIGHT);
            Renamed1994.push(CENTER_TURRET);
            Renamed1994.push(CHASSIS_LEFT_MOVEMENT);
            Renamed1994.push(CHASSIS_RIGHT_MOVEMENT);
            Renamed1994.push(CHASSIS_FORWARD_MOVEMENT);
            Renamed1994.push(CHASSIS_BACKWARD_MOVEMENT);
            Renamed1994.push(FOLLOW_CAMERA_UP);
            Renamed1994.push(FOLLOW_CAMERA_DOWN);
            Renamed1994.push(DROP_FLAG);
            Renamed1994.push(BATTLE_PAUSE);
            Renamed1994.push(BATTLE_VIEW_INCREASE);
            Renamed1994.push(BATTLE_VIEW_DECREASE);
            Renamed1994.push(FULL_SCREEN);
            Renamed1994.push(SUICIDE);
            Renamed1994.push(SHOW_TANK_PARAMETERS);
            Renamed1994.push(USE_FIRS_AID);
            Renamed1994.push(USE_DOUBLE_ARMOR);
            Renamed1994.push(USE_DOUBLE_DAMAGE);
            Renamed1994.push(USE_NITRO);
            Renamed1994.push(USE_MINE);
            Renamed1994.push(DROP_GOLD_BOX);
            Renamed1994.push(SHOT);
            Renamed1994.push(ULTIMATE);
            Renamed1994.push(OPEN_GARAGE);
         }
         return Renamed1994;
      }
   }
}

