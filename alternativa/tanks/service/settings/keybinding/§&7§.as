package alternativa.tanks.service.settings.keybinding
{
   import alternativa.tanks.AbstractEnum;
   
   public class §&7§ extends AbstractEnum
   {
      private static var §,"F§:Vector.<§&7§>;
      
      public static const ROTATE_TURRET_LEFT:§&7§ = new §&7§(0,"ROTATE_TURRET_LEFT");
      
      public static const ROTATE_TURRET_RIGHT:§&7§ = new §&7§(1,"ROTATE_TURRET_RIGHT");
      
      public static const CENTER_TURRET:§&7§ = new §&7§(2,"CENTER_TURRET");
      
      public static const CHASSIS_LEFT_MOVEMENT:§&7§ = new §&7§(3,"CHASSIS_LEFT_MOVEMENT");
      
      public static const CHASSIS_RIGHT_MOVEMENT:§&7§ = new §&7§(4,"CHASSIS_RIGHT_MOVEMENT");
      
      public static const CHASSIS_FORWARD_MOVEMENT:§&7§ = new §&7§(5,"CHASSIS_FORWARD_MOVEMENT");
      
      public static const CHASSIS_BACKWARD_MOVEMENT:§&7§ = new §&7§(6,"CHASSIS_BACKWARD_MOVEMENT");
      
      public static const FOLLOW_CAMERA_UP:§&7§ = new §&7§(7,"FOLLOW_CAMERA_UP");
      
      public static const FOLLOW_CAMERA_DOWN:§&7§ = new §&7§(8,"FOLLOW_CAMERA_DOWN");
      
      public static const DROP_FLAG:§&7§ = new §&7§(9,"DROP_FLAG");
      
      public static const BATTLE_PAUSE:§&7§ = new §&7§(10,"BATTLE_PAUSE");
      
      public static const BATTLE_VIEW_INCREASE:§&7§ = new §&7§(11,"BATTLE_VIEW_INCREASE");
      
      public static const BATTLE_VIEW_DECREASE:§&7§ = new §&7§(12,"BATTLE_VIEW_DECREASE");
      
      public static const FULL_SCREEN:§&7§ = new §&7§(13,"FULL_SCREEN");
      
      public static const SUICIDE:§&7§ = new §&7§(14,"SUICIDE");
      
      public static const SHOW_TANK_PARAMETERS:§&7§ = new §&7§(15,"SHOW_TANK_PARAMETERS");
      
      public static const USE_FIRS_AID:§&7§ = new §&7§(16,"USE_FIRS_AID");
      
      public static const USE_DOUBLE_ARMOR:§&7§ = new §&7§(17,"USE_DOUBLE_ARMOR");
      
      public static const USE_DOUBLE_DAMAGE:§&7§ = new §&7§(18,"USE_DOUBLE_DAMAGE");
      
      public static const USE_NITRO:§&7§ = new §&7§(19,"USE_NITRO");
      
      public static const USE_MINE:§&7§ = new §&7§(20,"USE_MINE");
      
      public static const DROP_GOLD_BOX:§&7§ = new §&7§(21,"DROP_GOLD_BOX");
      
      public static const SHOT:§&7§ = new §&7§(22,"SHOT");
      
      public static const ULTIMATE:§&7§ = new §&7§(23,"ULTIMATE");
      
      public static const OPEN_GARAGE:§&7§ = new §&7§(24,"OPEN_GARAGE");
      
      public function §&7§(param1:int, param2:String)
      {
         super(param1,param2);
      }
      
      public static function get values() : Vector.<§&7§>
      {
         if(!§,"F§)
         {
            §,"F§ = new Vector.<§&7§>();
            §,"F§.push(ROTATE_TURRET_LEFT);
            §,"F§.push(ROTATE_TURRET_RIGHT);
            §,"F§.push(CENTER_TURRET);
            §,"F§.push(CHASSIS_LEFT_MOVEMENT);
            §,"F§.push(CHASSIS_RIGHT_MOVEMENT);
            §,"F§.push(CHASSIS_FORWARD_MOVEMENT);
            §,"F§.push(CHASSIS_BACKWARD_MOVEMENT);
            §,"F§.push(FOLLOW_CAMERA_UP);
            §,"F§.push(FOLLOW_CAMERA_DOWN);
            §,"F§.push(DROP_FLAG);
            §,"F§.push(BATTLE_PAUSE);
            §,"F§.push(BATTLE_VIEW_INCREASE);
            §,"F§.push(BATTLE_VIEW_DECREASE);
            §,"F§.push(FULL_SCREEN);
            §,"F§.push(SUICIDE);
            §,"F§.push(SHOW_TANK_PARAMETERS);
            §,"F§.push(USE_FIRS_AID);
            §,"F§.push(USE_DOUBLE_ARMOR);
            §,"F§.push(USE_DOUBLE_DAMAGE);
            §,"F§.push(USE_NITRO);
            §,"F§.push(USE_MINE);
            §,"F§.push(DROP_GOLD_BOX);
            §,"F§.push(SHOT);
            §,"F§.push(ULTIMATE);
            §,"F§.push(OPEN_GARAGE);
         }
         return §,"F§;
      }
   }
}

